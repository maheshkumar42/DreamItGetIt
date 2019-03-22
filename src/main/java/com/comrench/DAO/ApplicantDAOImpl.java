package com.comrench.DAO;

import com.comrench.Entity.Applicant;
import com.comrench.Entity.ApplicantDegrees;
import com.comrench.Entity.ApplicantSkills;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;
import com.comrench.Entity.JobApplicants;
import com.comrench.Entity.JobDegrees;
import com.comrench.Entity.JobSkills;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ApplicantDAOImpl implements ApplicantDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  @Transactional
  public boolean subscribeApplicant(Applicant applicant) {
    Session currentSession = sessionFactory.getCurrentSession();
    System.out.println("applicant: " + applicant.toString());
    // throws an exception if a user with same email id exists
    try {
      currentSession.save(applicant);
    } catch (Exception e) {
      System.out.println("Unable to save applicant");
      e.printStackTrace();
      return false;
    }
    return true;
  }

  @Override
  @Transactional
  public List<Job> getQualifiedJobs(Applicant applicant, List<Degree> degreesList,
                                    List<ApplicantDegrees> applicantDegreeList, Map<Long, String> employerInfo) {
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Job> query = currentSession.createNativeQuery("select job.* from job where job.job_id not in (select" + " job_applicants.job_id from" + " job_applicants where job_applicants.applicant_id = ?)", Job.class);
    query.setParameter(1, applicant.getApplicantId());
    List<Job> jobList = query.list();
    List<Job> qualifiedJobs = new ArrayList<>();
    ArrayList<String> employerInfoList = new ArrayList<>();
    for (Job job: jobList){
      System.out.println(job.toString());

      if(applicant.getWorkingTime() != 1 && job.getWorkingTime() != applicant.getWorkingTime())
        continue;
      if(applicant.getMinimumSalary() > job.getMinimumSalary() || applicant.getMinimumSalary() > job.getMaximumSalary())
        continue;

      boolean ignoreJob = false;

      // sort applicant skills
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

      // Ignore jobs for which applicant skills doesnt satisfy
      for (int i = 0; i < applSkills.size(); i++) {
        if (j >= jobSkills.size())
          break;

        if (jobSkills.get(j).getSkillId() == applSkills.get(i).getSkillId()
          && applSkills.get(i).getLevel() >= jobSkills.get(j).getLevel()) {
          j++;
          continue;
        }

        else if (applSkills.get(i).getSkillId() < jobSkills.get(j).getSkillId())
          continue;

        ignoreJob = true;
        break;
      }

      if (ignoreJob)
        continue;

      // Check for Degrees qualification
      j = 0;
      ignoreJob = false;
      List<ApplicantDegrees> applDegrees = applicantDegreeList;
      List<JobDegrees> jobDegrees = job.getJobDegrees();
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
          System.out.println("at");
          System.out.println(applDegreeMap.values());
          System.out.println(jobDegree.toString());
          ignoreJob = true;
          break;
        }
      }

      if (ignoreJob)
        continue;

      System.out.println("Qualified : " + job.toString());
      qualifiedJobs.add(job);

      // To retrieve employer information of a job
      String companyInfo = employerInfo.get(job.getJobId());
      employerInfoList.add(companyInfo);
    }
    applicant.setEmployerInfoList(employerInfoList);
    return qualifiedJobs;
  }

  @Override
  @Transactional
  public Applicant getApplicant(String applicantId) {
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Applicant> query = currentSession.createNativeQuery("select * from applicant" + " where applicant_id = ?",
      Applicant.class);
    query.setParameter(1, applicantId);
    // Getting skills list
    List<Applicant> appList = query.list();

    if (!appList.isEmpty()) {
      System.out.println("Applicant list " + appList.get(0));
      return appList.get(0);
    }
    else {
      System.out.println("Applicant not found for Id = " + applicantId);
      return null;
    }
  }

  @Override
  @Transactional
  public List<ApplicantDegrees> getApplicantDegrees(String applicantId) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();
    // creating query
    Query<ApplicantDegrees> query = currentSession.createNativeQuery(
      "select * from applicant_degrees " + "where applicant_id = ?", ApplicantDegrees.class);
    query.setParameter(1, applicantId);
    List<ApplicantDegrees> degreeList = query.list();
    return degreeList;
  }

  @Override
  @Transactional
  public void applyJob(String applicantId, String jobId) {
    JobApplicants jobApplicant = new JobApplicants();
    jobApplicant.setJobId(Long.parseLong(jobId));
    jobApplicant.setApplicantId(Long.parseLong(applicantId));
    Session currentSession = sessionFactory.getCurrentSession();
    currentSession.save(jobApplicant);
  }

  @Override
  @Transactional
  public List<Job> getAppliedJobs(String applicantId) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Job> query = currentSession.createNativeQuery("select job.* from job join job_applicants "
      + "on job.job_id = job_applicants.job_id where job_applicants.applicant_id = ?", Job.class);
    query.setParameter(1, applicantId);
    List<Job> jobList = query.list();
    return jobList;
  }

  @Override
  @Transactional
  public boolean isExistingApplicant(String emailId) {
    // Getting session object from sessionFactory
    System.out.println("isExistingApplicant");
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Applicant> query = currentSession.createNativeQuery("select * from applicant where"
      + " email_id = ?", Applicant.class);
    System.out.println(query);
    query.setParameter(1, emailId);
    List<Applicant> appList = query.list();



    if(!appList.isEmpty()) {
      System.out.println("Query result of existing applicant is empty");
      return true;
    }

    return false;
  }
}
