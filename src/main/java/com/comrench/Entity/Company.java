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
@Table(name = "company")
public class Company {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "employer_id")
  private long employerID;

  @Column(name = "email_id")
  private String emailId;

  @Column(name = "contact_number")
  private String contactNumber;

  @Column(name = "password")
  private String password;

  @Column(name = "name")
  private String name;

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "employer_id", referencedColumnName = "employer_id")
  private List<Job> jobs = new ArrayList<>();

  public long getEmployerID() {
    return employerID;
  }

  public void setEmployerID(long employerID) {
    this.employerID = employerID;
  }

  public String getEmailId() {
    return emailId;
  }

  public void setEmailId(String emailId) {
    this.emailId = emailId;
  }

  public String getContactNumber() {
    return contactNumber;
  }

  public void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public List<Job> getJobs() {
    return jobs;
  }

  public void setJobs(List<Job> jobs) {
    this.jobs = jobs;
  }

  @Override
  public String toString() {
    return "Employer Info [employerID=" + employerID + ", name=" + name + ", " + "Email_id=" + emailId + ", Contact=" + contactNumber + ", Password=" + password + "]";
  }
}
