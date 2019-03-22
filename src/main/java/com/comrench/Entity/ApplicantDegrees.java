package com.comrench.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applicant_degrees")
public class ApplicantDegrees {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private long id;

  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "applicant_id")
  private Applicant applicant;

  @Column(name = "degree_id")
  private long degreeId;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Applicant getApplicant() {
    return applicant;
  }

  public void setApplicant(Applicant applicant) {
    this.applicant = applicant;
  }

  public long getDegreeId() {
    return degreeId;
  }

  public void setDegreeId(long degreeId) {
    this.degreeId = degreeId;
  }

  @Override
  public String toString() {
    return "Applicant Degree [id=" + id + ", degreeId=" + degreeId + "]";
  }
}
