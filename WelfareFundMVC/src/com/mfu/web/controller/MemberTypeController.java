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

import com.mfu.entity.MemberType;
import com.mfu.service.MemberTypeService;

@Controller
public class MemberTypeController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//MemberTypeServiceBean!com.mfu.service.MemberTypeService")
	MemberTypeService memberTypeServ;

	// listallMemberType.do
	@RequestMapping(value = "/listallMemberType", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<MemberType>> getAllMemberType() {
		List<MemberType> listMemberType = memberTypeServ.getAllMemberType();
		return new ResponseEntity<List<MemberType>>(listMemberType, HttpStatus.OK);
	}

	// getMemberType/1.do
	@RequestMapping(value = "/getMemberType/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<MemberType> getMemberTypeById(@PathVariable("id") String id) {
		MemberType memberType = memberTypeServ.findMemberTypeById(Long.parseLong(id));
		return new ResponseEntity<MemberType>(memberType, HttpStatus.OK);
	}

	// saveMemberType.do
	@RequestMapping(value = "/saveMemberType", method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<String> createMemberType(@RequestBody MemberType memberType) {
		try {
			if (memberType.getMemberTypeId() == 0) {
				memberTypeServ.save(memberType);
			} else {
				memberTypeServ.update(memberType);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}

	// deleteMemberType/5.do
	@RequestMapping(value = "/deleteMemberType/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteMemberType(@PathVariable("id") String id) {
		try {
			memberTypeServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
}
