package com.cricket.service;

import com.cricket.model.PasswordResetToken;

public interface PasswordResetTokenService {

	public void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken);
	
	public PasswordResetToken findByToken(String token);
}
