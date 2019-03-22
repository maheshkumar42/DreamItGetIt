package com.comrench.DAO;

import com.comrench.Entity.Degree;

import java.util.List;
import java.util.Map;

public interface DegreeDAO {
  public List<Degree> getDegreesList();
  public Map<Long, String> getDegreesMap(List<Degree> degreesList);
}
