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

import com.mfu.entity.ReceiveWelfare;
import com.mfu.service.MemberService;
import com.mfu.service.ReceiveWelfareService;
import com.mfu.service.WelfareService;



@Controller
public class ReceiveWelfareController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//ReceiveWelfareServiceBean!com.mfu.service.ReceiveWelfareService")
	ReceiveWelfareService receiveWelfareServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//MemberServiceBean!com.mfu.service.MemberService")
	MemberService memberServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//WelfareServiceBean!com.mfu.service.WelfareService")
	WelfareService welfareServ;
	
	@RequestMapping(value = "listReceiveWelfare/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<ReceiveWelfare>> getAllReceiveWelfare(@PathVariable("id") long memberId){
		List<ReceiveWelfare> listReceivewelfare = memberServ.getReceiveWelfareByMember(memberId);
		return new ResponseEntity<List<ReceiveWelfare>>(listReceivewelfare, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getReceiveWelfare", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<ReceiveWelfare> getReceiveWelfareById(@PathVariable("id") String id){
		ReceiveWelfare receiveWelfare = receiveWelfareServ.findReceiveWelfareById(Long.parseLong(id));
		return new ResponseEntity<ReceiveWelfare>(receiveWelfare, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveReceiveWelfare", method = {RequestMethod.POST, RequestMethod.PUT})	
	public ResponseEntity<String> createReceiveWelfare(@RequestBody ReceiveWelfare receiveWelfare){
		try{
			receiveWelfare.setMember(memberServ.findMemberById(receiveWelfare.getMember().getMemberId()));
			receiveWelfare.setWelfare(welfareServ.findWelfareById(receiveWelfare.getWelfare().getWelfareID()));
			if(receiveWelfare.getReceiveWelfareId() == 0){
				receiveWelfareServ.save(receiveWelfare);
			}else{
				receiveWelfareServ.update(receiveWelfare);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400",HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteReceiveWelfare/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteReceiveWelfare(@PathVariable("id") String id){
		try{
			receiveWelfareServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
}
