package com.comrench.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "applicant")
public class Applicant {

  @Id
  @GeneratedValue
  @Column(name = "applicant_id")
  private long applicantId;

  @Column(name = "email_id")
  private String emailId;

  @Column(name = "first_name")
  private String firstName;

  @Column(name = "last_name")
  private String lastName;

  @Column(name = "middle_name")
  private String middleName;

  @Column(name = "contact_number")
  private String contact;

  @Column(name = "minimum_salary")
  private int minimumSalary;

  @Column(name = "working_time")
  private int workingTime;

  @Column(name = "password")
  private String password;

  public transient ArrayList<String> employerInfoList;
  private transient int aggregateSkillLevel = 0;

  @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinColumn(name = "applicant_id", referencedColumnName = "applicant_id")
  private List<ApplicantSkills> applicantSkills = new ArrayList<>();

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "applicant_id", referencedColumnName = "applicant_id")
  private List<ApplicantDegrees> applicantDegrees = new ArrayList<>();

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "applicant_id", referencedColumnName = "applicant_id")
  private List<JobApplicants> jobApplicants = new ArrayList<>();

  public long getApplicantId() {
    return applicantId;
  }

  public void setApplicantId(long applicantId) {
    this.applicantId = applicantId;
  }

  public String getEmailId() {
    return emailId;
  }

  public void setEmailId(String emailId) {
    this.emailId = emailId;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getMiddleName() {
    return middleName;
  }

  public void setMiddleName(String middleName) {
    this.middleName = middleName;
  }

  public String getContact() {
    return contact;
  }

  public void setContact(String contact) {
    this.contact = contact;
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

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public ArrayList<String> getEmployerInfoList() {
    return employerInfoList;
  }

  public void setEmployerInfoList(ArrayList<String> employerInfoList) {
    this.employerInfoList = employerInfoList;
  }

  public int getAggregateSkillLevel() {
    return aggregateSkillLevel;
  }

  public void setAggregateSkillLevel(int aggregateSkillLevel) {
    this.aggregateSkillLevel = aggregateSkillLevel;
  }

  public List<ApplicantSkills> getApplicantSkills() {
    return applicantSkills;
  }

  public void setApplicantSkills(List<ApplicantSkills> applicantSkills) {
    this.applicantSkills = applicantSkills;
  }

  public List<ApplicantDegrees> getApplicantDegrees() {
    return applicantDegrees;
  }

  public void setApplicantDegrees(List<ApplicantDegrees> applicantDegrees) {
    this.applicantDegrees = applicantDegrees;
  }

  public List<JobApplicants> getJobApplicants() {
    return jobApplicants;
  }

  public void setJobApplicants(List<JobApplicants> jobApplicants) {
    this.jobApplicants = jobApplicants;
  }

  @Override
  public String toString() {
    return "Applicant [applicantId=" + applicantId + ", emailId=" + emailId + "," + " firstName=" + firstName + ", lastName=" + lastName + "," + " middleName=" + middleName + ", contact=" + contact + "," + " minimumSalary=" + minimumSalary + ", workingTime=" + workingTime + ", applicant Skills=" + applicantSkills + ", applicant Degrees=" + applicantDegrees + "]";
  }
}
