package com.comrench.DAO;

import com.comrench.Entity.Skills;
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
public class SkillDAOImpl implements SkillDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  @Transactional
  public List<Skills> getSkillsList() {
    // Getting session object from sessionFactory
    Session currentSession = sessionFactory.getCurrentSession();

    // creating query
    Query<Skills> query = currentSession.createQuery("from Skills", Skills.class);
    // Getting skills list
    List<Skills> skillList = query.list();
    return skillList;
  }

  @Override
  @Transactional
  public Map<Long, String> getSkillsMap(List<Skills> skills) {
    if (skills == null) {
      Session currentSession = sessionFactory.getCurrentSession();
      Query<Skills> query = currentSession.createQuery("from Skills", Skills.class);
      skills = query.list();
    }

    Map<Long, String> skillMap = new HashMap<Long, String>();

    for (Skills skill : skills)
      skillMap.put(skill.getSkillId(), skill.getSkillName());

    return skillMap;
  }
}
