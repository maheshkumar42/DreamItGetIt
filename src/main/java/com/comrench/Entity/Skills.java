package com.comrench.Entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "skills")
public class Skills {

  @Id
  @Column(name = "skill_id")
  private long skillId;

  @Column(name = "skill_name")
  private String skillName;

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "skill_id", referencedColumnName = "skill_id")
  private List<ApplicantSkills> applicantSkills = new ArrayList<>();

  @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  @JoinColumn(name = "skill_id", referencedColumnName = "skill_id")
  private List<JobSkills> jobSkills = new ArrayList<>();

  public long getSkillId() {
    return skillId;
  }

  public void setSkillId(long skillId) {
    this.skillId = skillId;
  }

  public String getSkillName() {
    return skillName;
  }

  public void setSkillName(String skillName) {
    this.skillName = skillName;
  }

  public List<ApplicantSkills> getApplicantSkills() {
    return applicantSkills;
  }

  public void setApplicantSkills(List<ApplicantSkills> applicantSkills) {
    this.applicantSkills = applicantSkills;
  }

  public List<JobSkills> getJobSkills() {
    return jobSkills;
  }

  public void setJobSkills(List<JobSkills> jobSkills) {
    this.jobSkills = jobSkills;
  }

  @Override
  public String toString() {
    return "Skill [skillId=" + skillId + ", skillName=" + skillName + "]";
  }
}
