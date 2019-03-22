package com.comrench.DAO;

import com.comrench.Entity.Applicant;
import com.comrench.Entity.Company;
import com.comrench.Entity.LoginUser;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class CustomRepositoryImpl implements CustomRepository{

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  @Transactional
  public Applicant authenticateApplicant(LoginUser user) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Applicant> query = currentSession
      .createNativeQuery("select * from applicant where " + "email_id=? and password = ?", Applicant.class);
    query.setParameter(1, user.getEmailId());
    query.setParameter(2, user.getPassword());
    List<Applicant> applicants = query.list();
    if (applicants.isEmpty())
      return null;
    else {
      Applicant applicant = (Applicant) applicants.get(0);
      System.out.println("applicant authenticated: " + applicant);
      return applicant;
    }
  }

  @Override
  @Transactional
  public Company authenticateEmployer(LoginUser user) {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Company> query = currentSession
      .createNativeQuery("select * from company where " + "email_id=? and password = ?", Company.class);
    query.setParameter(1, user.getEmailId());
    query.setParameter(2, user.getPassword());

    List<Company> employers = query.list();
    if (employers.isEmpty())
      return null;

    else {

      Company company = (Company) employers.get(0);
      System.out.println(company);
      return company;
    }
  }
}
