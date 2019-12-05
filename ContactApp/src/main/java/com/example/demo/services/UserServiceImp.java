package com.example.demo.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserRepo;
import com.example.demo.exception.UserBlockedException;
import com.example.demo.model.Contact;
import com.example.demo.model.User;

@Service
public class UserServiceImp extends User implements UserService{
	@Autowired
	UserRepo userrepo;
	@Autowired 
	UserService CS;
	@Autowired
	JdbcTemplate temp;
	
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Override
	public void register(User u) {
		// TODO Auto-generated method stub
		userrepo.save(u);
	}
	
	/*The method handles user login operation(authentication) using given credentials,
	 * it returns User Object when success and null when failed.
	 * When user is blocked an exception will be thrown by this method
	 * @param loginName
	 * @param password
	 * @return
	 * @throws userblockedexeption when the user is blocked*/

	@Override
	public User login(String loginName, String password) throws UserBlockedException {
		// TODO Auto-generated method stub
		String sql="SELECT user_Id, name, phone, email, address, role, login_status, login_name, password"
				+ " FROM user WHERE login_name=? AND password=?";
		Map m= new HashMap();
		m.put("in", loginName);
		m.put("pw", password);

		try {
		
		User u=   (User) namedParameterJdbcTemplate.getJdbcTemplate().queryForObject(sql, m.values().toArray(), new UserRowMapper());
		if(u.getLoginStatus().equals(UserService.LOGIN_STATUS_BLOCKED)) {
			throw new UserBlockedException("Your account has been blocked. Contact Admin");
		}else {
			return u;
		}
		
		}catch(EmptyResultDataAccessException e) {
			return null;
		}

	}

	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		
		return userrepo.findByRole(CS.ROLE_USER );
	}

	@Override
	public void changeLoginStatus(Integer userId, Integer loginStatus) {
		// TODO Auto-generated method stub
		String sql="UPDATE user SET login_Status=? WHERE user_Id=?";
		Map m= new HashMap();
		m.put("lst", loginStatus);
		m.put("uid", userId);
		
		temp.update(sql,m.values().toArray());
	}

	
	

}
