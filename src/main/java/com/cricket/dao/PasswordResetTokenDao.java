package com.cricket.dao;

import com.cricket.model.PasswordResetToken;

public interface PasswordResetTokenDao {

	public void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken);
	
	public PasswordResetToken findByToken(String token);
}
