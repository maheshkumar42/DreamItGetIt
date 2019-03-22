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
@Table(name = "job_degrees")
public class JobDegrees {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private long id;

  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "job_id")
  private Job job;

  @Column(name = "degree_id")
  private long degreeId;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Job getJob() {
    return job;
  }

  public void setJob(Job job) {
    this.job = job;
  }

  public long getDegreeId() {
    return degreeId;
  }

  public void setDegreeId(long degreeId) {
    this.degreeId = degreeId;
  }

  @Override
  public String toString() {
    return "Job Degree [id=" + id + ", degreeId=" + degreeId + "]";
  }
}
