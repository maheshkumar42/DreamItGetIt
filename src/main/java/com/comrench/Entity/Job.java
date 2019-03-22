package com.comrench.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "job")
public class Job {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "job_id")
  private long jobId;

  @Column(name = "job_name")
  private String jobName;

  @Column(name = "job_description")
  private String jobDescription;

  @Column(name = "minimum_salary")
  private int minimumSalary;

  @Column(name = "working_time")
  private int workingTime = 1;

  @Column(name = "maximum_salary")
  private int maximumSalary;

  public transient int empId = 0;
  public transient String empName;

  @Column(name = "employer_id")
  private long employerId;

  @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinColumn(name = "job_id", referencedColumnName = "job_id")
  private List<JobSkills> jobSkills = new ArrayList<>();

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "job_id", referencedColumnName = "job_id")
  private List<JobDegrees> jobDegrees = new ArrayList<>();

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "job_id", referencedColumnName = "job_id")
  private List<JobApplicants> jobApplicants = new ArrayList<>();

  public long getJobId() {
    return jobId;
  }

  public void setJobId(long jobId) {
    this.jobId = jobId;
  }

  public String getJobName() {
    return jobName;
  }

  public void setJobName(String jobName) {
    this.jobName = jobName;
  }

  public String getJobDescription() {
    return jobDescription;
  }

  public void setJobDescription(String jobDescription) {
    this.jobDescription = jobDescription;
  }

  public int getMinimumSalary() {
    return minimumSalary;
  }

  public void setMinimumSalary(int minimumSalary) {
    this.minimumSalary = minimumSalary;
  }

  public int getWorkingTime() {
    return workingTime;
  }

  public void setWorkingTime(int workingTime) {
    this.workingTime = workingTime;
  }

  public int getMaximumSalary() {
    return maximumSalary;
  }

  public void setMaximumSalary(int maximumSalary) {
    this.maximumSalary = maximumSalary;
  }

  public int getEmpId() {
    return empId;
  }

  public void setEmpId(int empId) {
    this.empId = empId;
  }

  public String getEmpName() {
    return empName;
  }

  public void setEmpName(String empName) {
    this.empName = empName;
  }

  public long getEmployerId() {
    return employerId;
  }

  public void setEmployerId(long employerId) {
    this.employerId = employerId;
  }

  public List<JobSkills> getJobSkills() {
    return jobSkills;
  }

  public void setJobSkills(List<JobSkills> jobSkills) {
    this.jobSkills = jobSkills;
  }

  public List<JobDegrees> getJobDegrees() {
    return jobDegrees;
  }

  public void setJobDegrees(List<JobDegrees> jobDegrees) {
    this.jobDegrees = jobDegrees;
  }

  public List<JobApplicants> getJobApplicants() {
    return jobApplicants;
  }

  public void setJobApplicants(List<JobApplicants> jobApplicants) {
    this.jobApplicants = jobApplicants;
  }

  @Override
  public String toString() {
    return "Job [jobId=" + jobId + ", maximumSalary=" + maximumSalary + "," + " jobName=" + jobName + ", jobDescription=" + jobDescription + "," + " minimumSalary=" + minimumSalary + ", workingTime=" + workingTime + ", jobSkills =" + jobSkills + ", jobDegrees=" + jobDegrees + ", employer_id=" + employerId + "]";
  }
}
