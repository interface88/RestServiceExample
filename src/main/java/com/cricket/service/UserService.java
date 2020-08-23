package com.cricket.service;

import java.util.List;

import com.cricket.model.User;

public interface UserService {

   long save(User user);
   User get(long id);
   List<User> list();
   void update(long id, User user);
   void delete(long id);
   User loadUserByUsername(String userName);
   void changeUserPassword(String userName, String password);
   User getUserByEmail(String email);
   public User getUserByEmployeeId(String employeeId);
}
