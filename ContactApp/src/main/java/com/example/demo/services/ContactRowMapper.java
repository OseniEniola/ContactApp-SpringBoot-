package com.example.demo.services;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.example.demo.model.Contact;

public class ContactRowMapper implements RowMapper {
	@Override
	public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Contact c=new Contact();
		c.setAddress(rs.getString("address"));
		c.setContactId(rs.getInt("contact_Id"));
		c.setEmail(rs.getString("email"));
		c.setName(rs.getString("name"));
		c.setPhone(rs.getString("phone"));
		c.setRemark(rs.getString("remark"));
		c.setUserId(rs.getInt("user_Id"));
		return c;
	}
}
