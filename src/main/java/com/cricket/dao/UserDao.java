package com.cricket.dao;

import java.util.List;

import com.cricket.model.User;

public interface UserDao {

	long save(User user);

	User get(long id);

	List<User> list();

	void update(long id, User user);

	void delete(long id);
	
	User loadUserByUsername(String userName);
	
	User getUserByEmail(String email);
	
	User getUserByEmployeeId(String employeeId);
	
}
