package com.comrench.DAO;

import com.comrench.Entity.Applicant;
import com.comrench.Entity.Company;
import com.comrench.Entity.LoginUser;

public interface CustomRepository {
  public Applicant authenticateApplicant(LoginUser user);
  public Company authenticateEmployer(LoginUser user);
}
