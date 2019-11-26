package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Contact;

public interface ContactRepo extends JpaRepository<Contact, Integer> {
List<Contact> findByUserId(Integer userid);
}
 