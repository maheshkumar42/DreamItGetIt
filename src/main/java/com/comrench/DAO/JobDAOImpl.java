package com.comrench.DAO;

import com.comrench.Entity.Applicant;
import com.comrench.Entity.ApplicantDegrees;
import com.comrench.Entity.ApplicantSkills;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;
import com.comrench.Entity.JobDegrees;
import com.comrench.Entity.JobSkills;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobDAOImpl implements JobDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  @Transactional
  public boolean saveJob(Job job) {
    Session currentSession = sessionFactory.getCurrentSession();
    System.out.println("Job: " + job.toString());
    currentSession.save(job);
    return true;
  }

  @Override
  @Transactional
  public List<Job> fetchEmployerJobs(long employerId) {
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Job> query = currentSession.createNativeQuery("select * from job where " + "employer_id=?", Job.class);
    query.setParameter(1, employerId);
    List<Job> jobList = query.list();
    for (Job job : jobList)
      System.out.println(job.toString());
    return jobList;
  }

  @Override
  @Transactional
  public List<Applicant> getQualifiedApplicants(Job job, List<Degree> degreesList, List<JobDegrees> jobDegreesList) {
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Applicant> query = currentSession.createNativeQuery("select applicant.* from applicant"
      + " join job_applicants on applicant.applicant_id = job_applicants.applicant_id"
      + " where job_applicants.job_id = ?", Applicant.class);
    query.setParameter(1, job.getJobId());
    List<Applicant> applicantList = query.list();
    List<Applicant> qualifiedApplicants = new ArrayList<Applicant>();

    for (Applicant applicant : applicantList) {

      // Verify working time
      if (applicant.getWorkingTime() != 1 && job.getWorkingTime() != applicant.getWorkingTime())
        continue;

      // Verify salary range
      if (applicant.getMinimumSalary() > job.getMinimumSalary()
        || applicant.getMinimumSalary() > job.getMaximumSalary())
        continue;

      boolean ignoreEntry = false;

      // Sort applicants skills
      Collections.sort(applicant.getApplicantSkills(), new Comparator<ApplicantSkills>() {
        public int compare(ApplicantSkills x, ApplicantSkills y) {
          return Integer.compare((int) x.getSkillId(), (int) y.getSkillId());
        }
      });

      // Sort job skills
      Collections.sort(job.getJobSkills(), new Comparator<JobSkills>() {
        public int compare(JobSkills x, JobSkills y) {
          return Integer.compare((int) x.getSkillId(), (int) y.getSkillId());
        }
      });

      if (applicant.getApplicantSkills().size() < job.getJobSkills().size())
        continue;

      // Check for Skills
      int j = 0;
      List<ApplicantSkills> applSkills = applicant.getApplicantSkills();
      List<JobSkills> jobSkills = job.getJobSkills();
      for (int i = 0; i < applSkills.size(); i++) {
        if (j >= jobSkills.size())
          break;

        if (jobSkills.get(j).getSkillId() == applSkills.get(i).getSkillId()
          && applSkills.get(i).getLevel() >= jobSkills.get(j).getLevel()) {
          j++;
          int aggregateSkillLevel = applicant.getAggregateSkillLevel() + applSkills.get(i).getLevel();
          applicant.setAggregateSkillLevel(aggregateSkillLevel);
          continue;
        }

        else if (applSkills.get(i).getSkillId() < jobSkills.get(j).getSkillId())
          continue;

        ignoreEntry = true;
        break;
      }

      if (ignoreEntry)
        continue;

      //// Check for Degrees
      j = 0;
      ignoreEntry = false;
      List<ApplicantDegrees> applDegrees = applicant.getApplicantDegrees();
      List<JobDegrees> jobDegrees = jobDegreesList;
      Map<Long, String> degreeMap = new HashMap<Long, String>();
      Map<Long, String> applDegreeMap = new HashMap<Long, String>();

      for (Degree degree : degreesList) {
        degreeMap.put(degree.getDegreeId(), degree.getDegreeName() + "-" + degree.getField());
      }

      // Iterate and map applicant degrees
      for (ApplicantDegrees degree : applDegrees) {
        String value = degreeMap.get(degree.getDegreeId());
        applDegreeMap.put(degree.getDegreeId(), value);
      }

      // Iterate and map job degrees
      for (JobDegrees jobDegree : jobDegrees) {
        String value = degreeMap.get(jobDegree.getDegreeId());
        String[] degreeTokens = value.split("-");
        String degreeName = degreeTokens[0];
        String field = degreeTokens[1];

        if (applDegreeMap.containsKey(jobDegree.getDegreeId()))
          continue;

          // check for higher specialization in same field
        else if (degreeName.equalsIgnoreCase("Bachelors") || degreeName.equalsIgnoreCase("Diploma")) {
          if (applDegreeMap.containsValue("Masters-" + field))
            continue;
        }

        // Different field specialization
        else {
          ignoreEntry = true;
          break;
        }
      }

      System.out.println("Qualified : " + applicant.toString());
      qualifiedApplicants.add(applicant);
    }

    // Sort on Best applicant based on aggregate skill level
    Collections.sort(qualifiedApplicants, new Comparator<Applicant>() {
      public int compare(Applicant x, Applicant y) {
        return -1 * (Integer.compare((int) x.getAggregateSkillLevel(), (int) y.getAggregateSkillLevel()));
      }
    });

    return qualifiedApplicants;
  }

  @Override
  @Transactional
  public Job fetchJob(String jobId) {
    Session currentSession = sessionFactory.getCurrentSession();
    Query<Job> query = currentSession.createNativeQuery("select job.* from job where job.job_id = ?", Job.class);
    query.setParameter(1, jobId);
    Job job = query.getSingleResult();
    return job;
  }

  @Override
  @Transactional
  public List<JobDegrees> getJobDegrees(String jobId) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();
    // creating query
    Query<JobDegrees> query = currentSession.createNativeQuery("select * from job_degrees " + "where job_id = ?",
      JobDegrees.class);
    query.setParameter(1, jobId);
    List<JobDegrees> degreeList = query.list();
    return degreeList;
  }
}
