package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.ContactRepo;
import com.example.demo.dao.UserRepo;
import com.example.demo.model.Contact;
import com.example.demo.services.ContactService;
import com.example.demo.services.ContactServiceImp;
@Controller
public class ContactContoller {
	@Autowired
	ContactRepo repo;
	@Autowired
	ContactService CS;// the spring ioc container would add the implmentation
	
	//Links to the contact form
	@RequestMapping(value="/user/contact_form")
	public String contactForm(Model m) {
		Contact contact= new Contact();
		m.addAttribute("command", contact);
		return "contact_form"; 
	}
	//Save a contact on the contact list
	@RequestMapping(value="/user/save_contact")
	public String saveOrUpdateContact(@ModelAttribute("command") Contact c,Model m, HttpSession session) {
		Integer contactId=(Integer) session.getAttribute("aContactId");
		if(contactId==null) {
			//Save task
			try {
				Integer userId= (Integer) session.getAttribute("userid");
				c.setUserId(userId);
				CS.save(c);
				return "redirect:clist?act=sv";
			}catch(Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to save contact");
				return "contact_form";
			}
		}else {
			//Update task
			try {
			c.setContactId(contactId);//primary key value
				CS.update(c);
				return "redirect:clist?act=sv";
			}catch(Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to edit contact");
				return "contact_form";
			}
		}
	}
		

	@RequestMapping(value="/user/edit_contact")
	public String prepareEditForm(Model m, HttpSession session, @RequestParam ("cid") Integer contactId) {
		session.setAttribute("aContactId", contactId);
		Contact contact= CS.findById(contactId);
		m.addAttribute("command", contact);
		return "contact_form"; 
	}
	// delete contact from the contact list
	@RequestMapping("/user/del_contact") 
	public String deleteContact(@RequestParam("cid") int contactId) { 
		CS.delete(contactId);
		return "redirect:clist?act=del";
	}
	@DeleteMapping("/deletecontact/{id}") 
	public Contact deleteUser(@PathVariable("id") int contactId) { 
		Contact c=repo.getOne(contactId);
	repo.delete(c);
	return c;
	}
	@RequestMapping(value="/user/clist")
	public String contactList(Model m, HttpSession session) {
		Integer userId= (Integer) session.getAttribute("userid");
		m.addAttribute("contactList",CS.findUserContact(userId)); 
		
		return"clist";//Jsp
	}
	@RequestMapping("/contacts")
	public List<Contact> getContact(){
		return repo.findAll();
	}
	@RequestMapping("/contacts/{contactId}")
	public Contact getContact(@PathVariable("contactId") int id){
		return repo.findById(id).orElse(new Contact());
	}
	@PostMapping("/contact")
	public Contact addUser( Contact contact) {
		repo.save(contact);
		return contact;
	}
	@PutMapping("/contact")
	public Contact updateUser(Contact contact) {
		
		repo.save(contact);
		
		return contact;
	}
	@RequestMapping("/contacts/{contactId}/{txt}")
	public List<Contact> getContact1(@PathVariable("contactId") int id, @PathVariable("txt") String txt){
		return CS.findUserContact(id, txt);
	}
}
