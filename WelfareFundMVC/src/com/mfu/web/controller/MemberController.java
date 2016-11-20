
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
import com.mfu.service.MemberTypeService;
import com.mfu.service.PreferPaymentService;



@Controller
public class MemberController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//MemberServiceBean!com.mfu.service.MemberService")
	MemberService memberServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//MemberTypeServiceBean!com.mfu.service.MemberTypeService")
	MemberTypeService memberTypeServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//CommunityServiceBean!com.mfu.service.CommunityService")
	CommunityService communityServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//PreferPaymentServiceBean!com.mfu.service.PreferPaymentService")
	PreferPaymentService preferServ;
	@RequestMapping(value = "/listMember", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Member>> getAllMember(){
		List<Member> listMember = memberServ.getAllMember();
		System.out.println("Length "+listMember.size());
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
			long memberTypeId = member.getMemberType().getMemberTypeId();
			long communityId = member.getCommunity().getCommunityId();
			long preferPaymentId = member.getPreferPayment().getPreferPaymentId();
			if(member.getMemberId() == 0){
				Account account = new Account();
				account.setMember(member);
				member.setAccount(account);
				//set Member to Beneficiary
				member.getBeneficiary().setMember(member);
				
				//set community memberType preferPayment using service
				member.setCommunity(communityServ.findCommunityById(communityId));
				member.setMemberType(memberTypeServ.findMemberTypeById(memberTypeId));
				member.setPreferPayment(preferServ.findPreferPaymentById(preferPaymentId));
				
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
}
