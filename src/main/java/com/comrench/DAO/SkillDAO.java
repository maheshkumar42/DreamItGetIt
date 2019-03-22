package com.comrench.DAO;

import com.comrench.Entity.Skills;

import java.util.List;
import java.util.Map;

public interface SkillDAO {
  public List<Skills> getSkillsList();
  public Map<Long, String> getSkillsMap(List<Skills> skills);
}
