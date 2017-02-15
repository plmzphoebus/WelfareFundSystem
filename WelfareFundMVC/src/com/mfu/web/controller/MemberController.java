
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

import com.mfu.entity.Account;
import com.mfu.entity.Member;
import com.mfu.service.CommunityService;
import com.mfu.service.MemberService;



@Controller
public class MemberController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//MemberServiceBean!com.mfu.service.MemberService")
	MemberService memberServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//CommunityServiceBean!com.mfu.service.CommunityService")
	CommunityService communityServ;
	@RequestMapping(value = "/listMember", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Member>> getAllMember(){
		List<Member> listMember = memberServ.getAllMember();
		return new ResponseEntity<List<Member>>(listMember, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getMember/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Member> getMemberById(@PathVariable("id") String id){
		Member member = memberServ.findMemberById(Long.parseLong(id));
		return new ResponseEntity<Member>(member, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveMember", method = {RequestMethod.POST, RequestMethod.PUT})	
	public ResponseEntity<String> createMember(@RequestBody Member member){
		try{
			long communityId = member.getCommunity().getCommunityId();
			if(member.getMemberId() == 0){
				Account account = new Account();
				account.setMember(member);
				member.setAccount(account);
				//set Member to Beneficiary
				member.getBeneficiary().setMember(member);
				
				//set community memberType preferPayment using service
				member.setCommunity(communityServ.findCommunityById(communityId));
				
				memberServ.save(member);
			}else{
				memberServ.update(member);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400",HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteMember/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteMember(@PathVariable("id") String id){
		try{
			memberServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
	@RequestMapping(value = "/login/{citizenid}" , method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Member> login(@PathVariable("citizenid") String citizenid){
		List<Member> listmember = memberServ.getAllMember();
		for(Member member : listmember){
			if(member.getCitizen().equals(citizenid)){
				return new ResponseEntity<Member>(member,HttpStatus.OK);
			}
		}
		return new ResponseEntity<Member>(new Member(),HttpStatus.BAD_REQUEST);
	}
}
