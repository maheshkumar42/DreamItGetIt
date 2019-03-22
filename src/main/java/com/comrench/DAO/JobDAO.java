package com.comrench.DAO;

import com.comrench.Entity.Applicant;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;
import com.comrench.Entity.JobDegrees;

import java.util.List;

public interface JobDAO {
  public boolean saveJob(Job job);
  public List<Job> fetchEmployerJobs(long employerId);
  public List<Applicant> getQualifiedApplicants(Job job, List<Degree> degreesList, List<JobDegrees> jobDegrees);
  public Job fetchJob(String jobId);
  public List<JobDegrees> getJobDegrees(String jobId);
}
