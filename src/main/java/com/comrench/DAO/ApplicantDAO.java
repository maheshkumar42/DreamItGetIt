package com.comrench.DAO;

import com.comrench.Entity.Applicant;
import com.comrench.Entity.ApplicantDegrees;
import com.comrench.Entity.Degree;
import com.comrench.Entity.Job;

import java.util.List;
import java.util.Map;

public interface ApplicantDAO {
  public boolean subscribeApplicant(Applicant applicant);
  public List<Job> getQualifiedJobs(Applicant applicant, List<Degree> degreesList, List<ApplicantDegrees> applicantDegreesList, Map<Long, String> employerInfo);
  public Applicant getApplicant(String applicantId);
  public List<ApplicantDegrees> getApplicantDegrees(String applicantId);
  public void applyJob(String applicantId, String jobId);
  public List<Job> getAppliedJobs(String applicantId);
  public boolean isExistingApplicant(String emailId);
}
