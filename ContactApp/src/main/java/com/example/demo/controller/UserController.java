package com.example.demo.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.command.*;
import com.example.demo.dao.UserRepo;
import com.example.demo.exception.UserBlockedException;
import com.example.demo.model.User;
import com.example.demo.services.*;

@Controller
public class UserController {
	@Autowired
	private UserServiceImp USI;
	@Autowired
	UserRepo repo;
	 
	@RequestMapping(value= {"/","/index"})
	public ModelAndView index() {
		ModelAndView mv= new ModelAndView("index");
		mv.addObject("command", new LoginCommand());
		return mv;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String handleLogin(@ModelAttribute("command") LoginCommand cmd,Model m, HttpSession session)   {
		
		
		try {	
		User loggedInUser= USI.login(cmd.getLoginName(), cmd.getPassword());
		if(loggedInUser==null) {
			 m.addAttribute("ex", "Login Failed! Enter Valid Credentials");
			return "index";
		}
		else {
			//Success
			//Check the role to a appropraite dashboard
			if(loggedInUser.getRole().equals(UserService.ROLE_ADMIN)) {
				addUserInSession(loggedInUser, session);
				return "redirect:admin/dashboard";
			}else if(loggedInUser.getRole().equals(UserService.ROLE_USER)) {
				addUserInSession(loggedInUser, session);
				return "redirect:users/dashboard";
			}else {
				//add error messgae and go back t the form
				 m.addAttribute("err", "Invalid User Role");
				return "index";
			}
		
		}
		}catch(UserBlockedException ex){
			 m.addAttribute("ex", ex.getMessage());
			 System.out.println(ex.getMessage());
			return "index";
		}
	}
	 
	@DeleteMapping("/deleteuser/{userId}")
	public String deleteUser(@PathVariable("userId") int userId) {
		repo.deleteById(userId);
		return "User deleted Succecfully";
	}
	@RequestMapping("/users")
	public List<User> getUser(){
		return repo.findAll();
	}
	@RequestMapping("/users/dashboard")
	public String userDashboard(){
		
		return "dashboard_user";
	}
	@RequestMapping("/logout")
	public String userDashboard(HttpSession session){
		session.invalidate();
		return "redirect:index?act=lo";
	} 
	
	@RequestMapping("/admin/dashboard")
	public ModelAndView adminDashboard(){
		ModelAndView mv=new ModelAndView("dashboard_admin");
		return mv;
	}
	
	
	@RequestMapping(value="/users/{userId}")
	public Optional<User> getUser1(@PathVariable("userId") int userID){
		return repo.findById(userID);
	}
	
	@RequestMapping(value="/reg_form")
	public String registrationForm(Model m) {
		UserCommand cmd= new UserCommand();
		m.addAttribute("command", cmd);
		return "reg_form";
	}
	
	@RequestMapping("/register")
	public String registerUser(@ModelAttribute("command") UserCommand cmd, Model m)   {
		try {
		User user=cmd.getUser();
		user.setLoginStatus(UserService.LOGIN_STATUS_ACVTIVE);
		user.setRole(UserService.ROLE_USER  );
		USI.register(user);
		return "redirect:index?act=reg";  
		
		}catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			m.addAttribute("err", "Username is already registered. Please select another username.");
			return "reg_form";        }
	}
	@PutMapping("/user")
	public User updateUser( User user) {
		repo.save(user);
		return user;
	}
	
	private void addUserInSession(User u, HttpSession session) {
		session.setAttribute("user", u);
		session.setAttribute("userid", u.getUserId());
		session.setAttribute("role", u.getRole());
	}
}
