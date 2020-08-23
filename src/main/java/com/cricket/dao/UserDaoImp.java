package com.cricket.dao;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.model.User;

@Repository
public class UserDaoImp implements UserDao {

   @Autowired
   private SessionFactory sessionFactory;

   @Override
   public long save(User user) {
      sessionFactory.getCurrentSession().save(user);
      return user.getId();
   }

   @Override
   public User get(long id) {
      return sessionFactory.getCurrentSession().get(User.class, id);
   }

   @Override
   public List<User> list() {
      Session session = sessionFactory.getCurrentSession();
      
      CriteriaBuilder cb = session.getCriteriaBuilder();
      CriteriaQuery<User> cq = cb.createQuery(User.class);
      Root<User> root = cq.from(User.class);
      cq.select(root);
      Query<User> query = session.createQuery(cq);
      return query.getResultList();
   }

   @Override
   public void update(long id, User user) {
      Session session = sessionFactory.getCurrentSession();
      session.merge(user);
      session.flush();
   }

   @Override
   public void delete(long id) {
      Session session = sessionFactory.getCurrentSession();
      User user = session.byId(User.class).load(id);
      session.delete(user);
   }

	@Override
	public User loadUserByUsername(String userName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from com.progenetive.model.User where name = :name").setParameter("name", userName);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	@Override
	public User getUserByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from com.progenetive.model.User where email = :email").setParameter("email", email);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	@Override
	public User getUserByEmployeeId(String employeeId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from com.progenetive.model.User where employeeId = :employeeId").setParameter("employeeId", employeeId);
		User user = (User) query.uniqueResult();
		return user;
	}

}
