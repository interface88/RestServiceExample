package com.cricket.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.model.Scenario;
import com.cricket.model.State;

@Repository
public class ScenarioDaoImp implements ScenarioDao {

   @Autowired
   private SessionFactory sessionFactory;

   @Override
   public Scenario get(long id) {
      return sessionFactory.getCurrentSession().get(Scenario.class, id);
   }
   
   @Override
   public List<Scenario> list() {
      Session session = sessionFactory.getCurrentSession();
      
      CriteriaBuilder cb = session.getCriteriaBuilder();
      CriteriaQuery<Scenario> cq = cb.createQuery(Scenario.class);
      Root<Scenario> root = cq.from(Scenario.class);
      cq.select(root);
      Query<Scenario> query = session.createQuery(cq);
      return query.getResultList();
   }

}
