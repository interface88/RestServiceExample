package com.cricket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.PasswordResetTokenDao;
import com.cricket.model.PasswordResetToken;

@Service
@Transactional(readOnly = true)
public class PasswordResetTokenServiceImp implements PasswordResetTokenService {

	@Autowired
	private PasswordResetTokenDao passwordResetTokenDao;

	@Transactional
	@Override
	public void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken) {
		passwordResetTokenDao.createPasswordResetTokenForUser(passwordResetToken);

	}

	@Override
	public PasswordResetToken findByToken(String token) {
		return passwordResetTokenDao.findByToken(token);
	}

}
