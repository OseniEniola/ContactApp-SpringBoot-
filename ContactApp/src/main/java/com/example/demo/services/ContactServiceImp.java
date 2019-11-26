package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ContactRepo;
import com.example.demo.model.Contact;
import com.example.demo.utility.StringUtility;


@Service
public class ContactServiceImp implements ContactService {
	@Autowired 
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	ContactRepo repo;
	
	
	@Override
	public void save(Contact c) {
		// TODO Auto-generated method stub
		repo.save(c);
	}

	@Override
	public void update(Contact c) {
		// TODO Auto-generated method stub
		repo.save(c);
	}

	@Override
	public void delete(Integer contactId) {
		// TODO Auto-generated method stub
		repo.deleteById(contactId);
	} 

	@Override
	public void delete(Integer[] contactIds) {
		// TODO Auto-generated method stub
		String ids= StringUtility.toCommaSeparatedString(contactIds);
		String sql="DELETE FROM contact WHERE contactId IN("+ids+")";
		jdbcTemplate.update(sql);
	}

	@Override
	public List<Contact> findUserContact(Integer userId) {
		// TODO Auto-generated method stub
		return repo.findByUserId(userId);
		
	}
	@Override
	public Contact findById(Integer contactId) {
		return repo.findById(contactId).orElse(new Contact());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contact> findUserContact(Integer userId, String txt) {
		// TODO Auto-generated method stub
		String sql="SELECT contact_Id,user_Id,name,phone,email,address,remark FROM contact "
				+ "WHERE user_Id=? AND (name LIKE '%"+txt+"%' OR address LIKE '%"+txt+"%' OR phone LIKE '%"+txt+"%' OR email"
						+ " LIKE '%"+txt+"%' OR name LIKE '%"+txt+"%')";
		return jdbcTemplate.query(sql,new ContactRowMapper(),userId);
	}

	

}
