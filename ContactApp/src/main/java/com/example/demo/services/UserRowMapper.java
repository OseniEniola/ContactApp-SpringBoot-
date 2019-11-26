package com.example.demo.services;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		User u=new User();
		u.setEmail(rs.getString("email"));
		u.setAddress(rs.getString("address"));
		u.setLoginName(rs.getString("login_name"));
		u.setLoginStatus(rs.getInt("login_status"));
		u.setName(rs.getString("name"));
		u.setPassword(rs.getString("password"));
		u.setPhone(rs.getString("phone"));
		u.setRole(rs.getInt("role"));
		u.setUserId(rs.getInt("user_id"));
		return u;
	}

}
