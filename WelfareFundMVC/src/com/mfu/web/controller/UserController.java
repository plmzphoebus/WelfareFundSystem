package com.mfu.web.controller;

import java.util.List;

import javax.ejb.EJB;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.entity.User;
import com.mfu.service.UserService;


@Controller
public class UserController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//UserServiceBean!com.mfu.service.UserService")
	UserService userServ;
	
	@RequestMapping(value = "/listUser", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<User>> getAllUser(){
		List<User> listUser = userServ.getAllUser();
		return new ResponseEntity<List<User>>(listUser, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getUser/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<User> getRoleById(@PathVariable("id") String id){
		User user = userServ.findUserById(Long.parseLong(id));
		return new ResponseEntity<User>(user, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveUser", method = {RequestMethod.POST, RequestMethod.PUT})
	public ResponseEntity<String> createUser(@RequestBody User user){
		try{
			if(user.getUser() == 0){
				userServ.save(user);
			}else{
				userServ.update(user);
			}	
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteUser(@PathVariable("id") String id){
		try{
			userServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
}
