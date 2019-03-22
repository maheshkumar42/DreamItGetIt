package com.comrench.DAO;

import com.comrench.Entity.Company;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CompanyDAOImpl implements CompanyDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  @Transactional
  public List<Company> getCompaniesList() {
    // TODO : Returning null for now
    System.out.println("getCompaniesList needs to be implemented so returning null for now");
    return null;
  }

  @Override
  @Transactional
  public boolean registerCompany(Company company) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();
    System.out.println("Company: " + company.toString());

    // To handle exceptions thrown with same email id
    try {
      currentSession.save(company);
    } catch (Exception e) {
      return false;
    }
    return true;
  }

  @Override
  @Transactional
  public Map<Long, String> getEmployerInfoMap() {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Object[]> query = currentSession
      .createNativeQuery("select company.name,company.email_id," + "company.contact_number,\r\n"
        + "job.job_id from company join job on job.employer_id = company.employer_id");
    List<Object[]> companyList = query.getResultList();
    Map<Long, String> employerInfoMap = new HashMap<Long, String>();
    for (Object[] c : companyList) {
      employerInfoMap.put(((Integer) c[3]).longValue(), (String) c[0] + "$" + c[1] + "$" + c[2]);
    }

    return employerInfoMap;
  }

  @Override
  @Transactional
  public boolean isExistingClient(String emailId) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Company> query = currentSession.createNativeQuery("select * from company where"
      + " email_id = ?", Company.class);
    query.setParameter(1, emailId);
    List<Company> clientList = query.list();

    if(!clientList.isEmpty())
      return true;

    return false;
  }
}
