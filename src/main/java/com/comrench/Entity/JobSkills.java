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
@Table(name = "job_skills")
public class JobSkills {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private long id;

  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "job_id")
  private Job job;

  @Column(name = "skill_id")
  private long skillId;

  @Column(name = "level")
  private int level;

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

  public long getSkillId() {
    return skillId;
  }

  public void setSkillId(long skillId) {
    this.skillId = skillId;
  }

  public int getLevel() {
    return level;
  }

  public void setLevel(int level) {
    this.level = level;
  }

  @Override
  public String toString() {
    return "Job Skills [id=" + id + ", skillId=" + skillId + ", " + "level=" + level + "]";
  }
}
