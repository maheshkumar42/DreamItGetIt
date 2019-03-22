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
@Table(name = "applicant_skills")
public class ApplicantSkills {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
  private long id;

  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "applicant_id")
  private Applicant applicant;

  @Column(name = "skill_id")
  private long skillId;

  @Column(name = "level")
  private int level;

  private transient String levelStr;

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

  public String getLevelStr() {
    return levelStr;
  }

  public void setLevelStr(String levelStr) {
    this.levelStr = levelStr;
  }

  @Override
  public String toString() {
    return "ApplicantSkills [id=" + id + ", skillId=" + skillId + ", " + "level=" + level + ", " + "levelStr=" + levelStr + "]";
  }
}
