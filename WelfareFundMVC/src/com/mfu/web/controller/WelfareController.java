package com.mfu.web.controller;

import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.entity.Conditional;
import com.mfu.entity.Welfare;
import com.mfu.service.ConditionService;
import com.mfu.service.WelfareService;


@Controller
public class WelfareController  {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//WelfareServiceBean!com.mfu.service.WelfareService")
	WelfareService welfareServ;
	
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//ConditionServiceBean!com.mfu.service.ConditionService")
	ConditionService conditioneServ;
	
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
		List<Conditional> listcon = welfare.getConditionals();
		for(Conditional con : listcon){
			System.out.println("Date"+con.getAmountofDate());
			con.setWelfare(welfare);
		}
		welfare.setConditionals(welfare.getConditionals());
		
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
	@RequestMapping(value = "/editConditionDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> editConditionDetail(HttpServletRequest request){
		try{
			long conditionId = Long.parseLong(request.getParameter("pk"));
			String conditionDetail = request.getParameter("value");
			System.out.println("ConditionID: "+conditionId);
			System.out.println("Condition Detail Title: "+conditionDetail);
			Conditional condition = conditioneServ.findConditionById(conditionId);
			condition.setConditionDetail(conditionDetail);
			conditioneServ.updat(condition);
			conditioneServ.updat(condition);
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch(Exception e){
			return new ResponseEntity<String>("400", HttpStatus.OK);
		}
		
	}
	
	@RequestMapping(value = "/editWelfareMoney", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> editWelfareMoney(HttpServletRequest request){
		try{
			long conditionId = Long.parseLong(request.getParameter("pk"));
			int welfareMoney = Integer.parseInt(request.getParameter("value"));
			System.out.println("ConditionID: "+conditionId);
			System.out.println("Welfare Money Title: "+welfareMoney);
			Conditional condition = conditioneServ.findConditionById(conditionId);
			condition.setWelfareMoney(welfareMoney);
			conditioneServ.updat(condition);
			conditioneServ.updat(condition);
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch(Exception e){
			return new ResponseEntity<String>("400", HttpStatus.OK);
		}
		
	}
	
	@RequestMapping(value = "/editAmountofDate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> editAmountofDate(HttpServletRequest request){
		try{
			long conditionId = Long.parseLong(request.getParameter("pk"));
			int amountofDate = Integer.parseInt(request.getParameter("value"));
			System.out.println("ConditionID: "+conditionId);
			System.out.println("Welfare Money Title: "+amountofDate);
			Conditional condition = conditioneServ.findConditionById(conditionId);
			condition.setAmountofDate(amountofDate);
			conditioneServ.updat(condition);
			conditioneServ.updat(condition);
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch(Exception e){
			return new ResponseEntity<String>("400", HttpStatus.OK);
		}
		
	}
}
