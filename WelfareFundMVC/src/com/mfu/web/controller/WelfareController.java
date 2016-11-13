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

import com.mfu.entity.Welfare;
import com.mfu.service.WelfareService;


@Controller
public class WelfareController  {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//WelfareServiceBean!com.mfu.service.WelfareService")
	WelfareService welfareServ;
	
	//listAllWelfare.do
	@RequestMapping(value = "/listAllWelfare", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Welfare>> getAllWelfare() {
		List<Welfare> listWelfare = welfareServ.getAllWelfare();
		return new ResponseEntity<List<Welfare>>(listWelfare,HttpStatus.OK);
	}
	
	//getWelfare/2.do
	@RequestMapping(value = "/getWelfare/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Welfare> getAllWelfareById(@PathVariable("id") String id ){
		Welfare welfare = welfareServ.findWelfareById(Long.parseLong(id));
		return new ResponseEntity<Welfare>(welfare, HttpStatus.OK);
	}
	
	//saveWelfare.do
	@RequestMapping(value = "/saveWelfare", method = {RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<String> createWelfare(@RequestBody Welfare welfare){
		try {
			if (welfare.getWelfareID() == 0){
				welfareServ.save(welfare);
			} else {
				welfareServ.update(welfare);
			}
			return new ResponseEntity<String>("200",HttpStatus.OK);	
		} catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}

	
	//deleteWelfare/4.do
	@RequestMapping(value = "/deleteWelfare/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteWelfare(@PathVariable("id") String id){
		try {
			welfareServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
	

}
