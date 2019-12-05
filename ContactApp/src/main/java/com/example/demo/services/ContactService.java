package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.Contact;

public interface ContactService {
	/*
	 * The interface specifies all the businees operation for contact entity*/
	
	public void save(Contact c);
	public void update(Contact c);
	public void delete(Integer contactId);
	public void delete(Integer[] contactIds);
	public Contact findById(Integer contactId);
	
	/*
	 * This method returns all user contact(user who is logged in
	 */
	public List<Contact> findUserContact(Integer userId);
	
	/*This method search contact for user(UserId) based on a given free-text-criteria*/
	public List<Contact> findUserContact(Integer userId, String txt);
	
	
}
