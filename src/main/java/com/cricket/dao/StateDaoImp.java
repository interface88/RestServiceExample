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

import com.cricket.model.State;
import com.cricket.model.User;

@Repository
public class StateDaoImp implements StateDao {

   @Autowired
   private SessionFactory sessionFactory;

   @Override
   public long save(State state) {
      sessionFactory.getCurrentSession().save(state);
      return state.getId();
   }

   @Override
   public State get(long id) {
      return sessionFactory.getCurrentSession().get(State.class, id);
   }

   @Override
   public List<State> list(String stateName) {
      Session session = sessionFactory.getCurrentSession();
      
      if(stateName == null){
    	  CriteriaBuilder cb = session.getCriteriaBuilder();
    	  CriteriaQuery<State> cq = cb.createQuery(State.class);
    	  Root<State> root = cq.from(State.class);
    	  cq.select(root);
    	  Query<State> query = session.createQuery(cq);
    	  return query.getResultList();
      }else{
    	  Query query = session.createQuery("from com.progenetive.model.State where upper(stateName) = upper(:stateName)")
    			  .setParameter("stateName", stateName);
    	  List<State> stateList = (List<State>) query.getResultList();
		  return stateList;
      }
   }

   @Override
   public void update(long id, State state) {
      Session session = sessionFactory.getCurrentSession();
      State state2 = session.byId(State.class).load(id);
      state2.setStateName(state.getStateName());
     
      session.flush();
   }

   @Override
   public void delete(long id) {
      Session session = sessionFactory.getCurrentSession();
      State state = session.byId(State.class).load(id);
      session.delete(state);
   }

}
