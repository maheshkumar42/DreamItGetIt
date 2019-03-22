package com.comrench.DAO;

import com.comrench.Entity.Company;

import java.util.List;
import java.util.Map;

public interface CompanyDAO {
  public List<Company> getCompaniesList();
  public boolean registerCompany(Company company);
  public Map<Long, String> getEmployerInfoMap();
  public boolean isExistingClient(String emailId);
}
