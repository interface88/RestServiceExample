package com.cricket.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.model.PasswordResetToken;

@Repository
public class PasswordResetTokenDaoImp implements PasswordResetTokenDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createPasswordResetTokenForUser(
			PasswordResetToken passwordResetToken) {
		sessionFactory.getCurrentSession().save(passwordResetToken);

	}

	@Override
	public PasswordResetToken findByToken(String token) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from com.cricket.model.PasswordResetToken where token = :token").setParameter("token", token);
		PasswordResetToken passwordResetToken = (PasswordResetToken) query.uniqueResult();
		return passwordResetToken;
	}

}
