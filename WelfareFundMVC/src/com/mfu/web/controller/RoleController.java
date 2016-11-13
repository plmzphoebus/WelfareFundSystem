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

import com.mfu.entity.Role;
import com.mfu.service.RoleService;



@Controller
public class RoleController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//RoleServiceBean!com.mfu.service.RoleService")
	RoleService roleServ;
	
	@RequestMapping(value = "listRole", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Role>> getAllRole(){
		List<Role> listRole = roleServ.getAllRole();
		return new ResponseEntity<List<Role>>(listRole, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getRole/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Role> getRoleBtId(@PathVariable("id") String id){
		Role role = roleServ.findRoleById(Long.parseLong(id));
		return new ResponseEntity<Role>(role, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveRole", method = {RequestMethod.POST, RequestMethod.PUT})
	public ResponseEntity<String> createRole(@RequestBody Role role){
		try{
			if(role.getRole() == 0){
				roleServ.save(role);
			}else{
				roleServ.update(role);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteRole/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteRole(@PathVariable("id") String id){
		try{
			roleServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
}
