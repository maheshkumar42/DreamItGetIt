package com.comrench.DAO;

import com.comrench.Entity.Degree;
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
public class DegreeDAOImpl implements DegreeDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  @Transactional
  public List<Degree> getDegreesList() {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Degree> query = currentSession.createNativeQuery("select * from academic_degree", Degree.class);

    // Getting skills list
    List<Degree> degrees = query.list();
    return degrees;
  }

  @Override
  @Transactional
  public Map<Long, String> getDegreesMap(List<Degree> degreesList) {
    if (degreesList == null) {
      Session currentSession = sessionFactory.getCurrentSession();
      Query<Degree> query = currentSession.createNativeQuery("select * from academic_degree", Degree.class);
      degreesList = query.list();
    }

    Map<Long, String> degreesMap = new HashMap<Long, String>();

    for (Degree degree : degreesList)
      degreesMap.put(degree.getDegreeId(), degree.getDegreeName() + " in " + degree.getField());

    return degreesMap;
  }
}
