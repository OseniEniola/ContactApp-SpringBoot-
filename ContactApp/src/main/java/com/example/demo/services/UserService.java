package com.example.demo.services;

import java.sql.SQLException;
import java.util.List;

import com.example.demo.exception.UserBlockedException;
import com.example.demo.model.User;

public interface UserService {
	
	public static final Integer LOGIN_STATUS_ACVTIVE=1;
	public static final Integer  LOGIN_STATUS_BLOCKED=2;
	public static final Integer ROLE_ADMIN=1;
	public static final Integer ROLE_USER=2;

	
	public void register(User u);

	/**
	 * @param loginName
	 * @param password  The method handles login operations using given credentials,
	 *                  it returns User object when success and null when denied
	 * @return
	 * @throws SQLException 
	 * @throws WHEN USER ACCOUNT IS BLOCKED 
	 */
	public User login(String loginName, String password) throws UserBlockedException, SQLException;
	
	
	/**
	 * Use this methhod to get list of users
	 */
	public List<User> getUserList();
	
	/**
	 * This method change the user login status*/
	public void changeLoginStatus(Integer userId, Integer loginStatus);

}
