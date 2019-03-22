package com.comrench.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "academic_degree")
public class Degree {

  @Id
  @Column(name = "degree_id")
  private long degreeId;

  @Column(name = "degree_name")
  private String degreeName;

  @Column(name = "field")
  private String field;

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "degree_id", referencedColumnName = "degree_id")
  private Set<ApplicantDegrees> applicantDegrees = new HashSet<>();

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "degree_id", referencedColumnName = "degree_id")
  private Set<Degree> jobDegrees = new HashSet<>();

  public long getDegreeId() {
    return degreeId;
  }

  public void setDegreeId(long degreeId) {
    this.degreeId = degreeId;
  }

  public String getDegreeName() {
    return degreeName;
  }

  public void setDegreeName(String degreeName) {
    this.degreeName = degreeName;
  }

  public String getField() {
    return field;
  }

  public void setField(String field) {
    this.field = field;
  }

  public Set<ApplicantDegrees> getApplicantDegrees() {
    return applicantDegrees;
  }

  public void setApplicantDegrees(Set<ApplicantDegrees> applicantDegrees) {
    this.applicantDegrees = applicantDegrees;
  }

  public Set<Degree> getJobDegrees() {
    return jobDegrees;
  }

  public void setJobDegrees(Set<Degree> jobDegrees) {
    this.jobDegrees = jobDegrees;
  }

  @Override
  public String toString() {
    return "Skill [degreeName=" + degreeName + ", field=" + field + "]";
  }
}
