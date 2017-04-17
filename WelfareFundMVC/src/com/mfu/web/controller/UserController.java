package com.mfu.web.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.config.EncodePassword;
import com.mfu.entity.User;
import com.mfu.service.UserService;


@Controller
public class UserController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//UserServiceBean!com.mfu.service.UserService")
	UserService userServ;
	
	@RequestMapping(value = "/listUser", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<User>> getAllUser(HttpSession session){
		List<User> listUser = userServ.getAllUser();
		System.out.println("User Session "+ (User) session.getAttribute("user"));
		return new ResponseEntity<List<User>>(listUser, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getUser/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<User> getRoleById(@PathVariable("id") String id){
		User user = userServ.findUserById(Long.parseLong(id));
		return new ResponseEntity<User>(user, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveUser", method = {RequestMethod.POST, RequestMethod.PUT})
	public ResponseEntity<String> createUser(@RequestBody User user, HttpServletRequest request){
		try{
			
			//user.setPassword(new EncodePassword().encodeString(user.getPassword()));
			if(user.getUser() == 0){
				userServ.save(user);
			}else{
				String choice = request.getParameter("choice");
				if(choice.equals("new")){
					//user.setPassword(new EncodePassword().encodeString(user.getPassword()));
				}else{
					User oldUser = userServ.findUserById(user.getUser());
					user.setPassword(oldUser.getPassword());
				}
				userServ.update(user);
			}	
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteUser(@PathVariable("id") String id){
		try{
			userServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
	@RequestMapping(value= "/loginStaff" , method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> loginUser(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
//		String encodedPassword = password;
//			try {
//				encodedPassword = new EncodePassword().encodeString(password);
//			} catch (NoSuchAlgorithmException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		System.out.println("EncodedPassword "+password+" username"+username);
		User user = userServ.loginUser(username, password);
		if(user != null){
			session.setAttribute("user", user);
			System.out.println("User not null "+user);
			System.out.println("User Session "+ (User) session.getAttribute("user"));
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}else{
			System.out.println("User null "+user);
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/logout")
	public String Logout(HttpSession session){
		session.setAttribute("user", "");
		return "redirect:login.jsp";
	}
}
