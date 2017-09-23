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

import com.mfu.entity.Beneficiary;
import com.mfu.service.BeneficiaryService;
import com.mfu.service.MemberService;

@Controller
public class BeneficiaryController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//BeneficiaryServiceBean!com.mfu.service.BeneficiaryService")
	BeneficiaryService beneficiaryServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//MemberServiceBean!com.mfu.service.MemberService")
	MemberService memberServ;
	
	@RequestMapping(value = "/getBeneficiaryByMember/{memberId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Beneficiary>> getBeneficiaryByMemberId(@PathVariable("memberId") String memberId){
		List<Beneficiary> listBeneficiary = memberServ.getBeneficiaryByMember(Integer.parseInt(memberId));
		return new ResponseEntity<List<Beneficiary>>(listBeneficiary, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getBeneficiary/{beneficiaryId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Beneficiary> getBeneficiary(@PathVariable("beneficiaryId") String beneficiaryId){
		Beneficiary beneficiary = beneficiaryServ.findBeneficiaryById(Integer.parseInt(beneficiaryId));
		return new ResponseEntity<Beneficiary>(beneficiary, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveBeneficiary/{memberId}", method = {RequestMethod.POST, RequestMethod.PUT})
	@ResponseBody
	public ResponseEntity<String> saveBeneficiary(@RequestBody Beneficiary beneficiary, @PathVariable("memberId") String memberId){
		try{
			if(beneficiary.getBeneficiaryId() == 0){
				beneficiary.setMember(memberServ.findMemberById(Integer.parseInt(memberId)));
				beneficiaryServ.save(beneficiary);
			}else{
				beneficiaryServ.update(beneficiary);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch(Exception e){
			return new ResponseEntity<String>("400", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/deleteBeneficiary/{beneficiaryId}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteBeneficiary(@PathVariable("beneficiaryId") String beneficiaryId){
		try{
			beneficiaryServ.delete(Integer.parseInt(beneficiaryId));
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch(Exception e){
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
}
