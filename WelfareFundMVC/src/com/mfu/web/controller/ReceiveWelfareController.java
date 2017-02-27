package com.mfu.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.mfu.entity.Community;
import com.mfu.entity.Member;
import com.mfu.entity.ReceiveWelfare;
import com.mfu.entity.Welfare;
import com.mfu.service.MemberService;
import com.mfu.service.ReceiveWelfareService;
import com.mfu.service.WelfareService;
import com.mfu.web.model.LineChart;
import com.mfu.web.model.TotalMembersChart;



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
	
	@RequestMapping(value = "/getReceiveWelfare/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<ReceiveWelfare> getReceiveWelfareById(@PathVariable("id") String id){
		ReceiveWelfare receiveWelfare = receiveWelfareServ.findReceiveWelfareById(Long.parseLong(id));
		return new ResponseEntity<ReceiveWelfare>(receiveWelfare, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveReceiveWelfare", method = {RequestMethod.POST, RequestMethod.PUT})
	@ResponseBody
	public ResponseEntity<String> createReceiveWelfare(@RequestBody ReceiveWelfare receiveWelfare){

			System.out.println("amount" + receiveWelfare.getAmount());
			System.out.println("Date" + receiveWelfare.getDate());
			System.out.println("member"+receiveWelfare.getMember().getMemberId());
			System.out.println("welfare"+receiveWelfare.getWelfare().getWelfareID());
			receiveWelfare.setMember(memberServ.findMemberById(receiveWelfare.getMember().getMemberId()));
			receiveWelfare.setWelfare(welfareServ.findWelfareById(receiveWelfare.getWelfare().getWelfareID()));

				receiveWelfareServ.save(receiveWelfare);

			return new ResponseEntity<String>("200", HttpStatus.OK);

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
	// getMoneyReceiveChart.do
			@RequestMapping(value = "/getMoneyReceiveChart", method = RequestMethod.GET)
			@ResponseBody
			public ResponseEntity<List<TotalMembersChart>> getMoneyReceiveChart() {
				List<Welfare> listwelfare = welfareServ.getAllWelfare();
				List<TotalMembersChart> listchart = new ArrayList<TotalMembersChart>();
				for(Welfare welfare : listwelfare){
					TotalMembersChart chart = new TotalMembersChart();
					int totalmoney = 0 ;
					List<ReceiveWelfare> listreceivewelfare = welfareServ.getReceiveWelfareByWelfare(welfare.getWelfareID());
					for(ReceiveWelfare receivewelfare : listreceivewelfare){
						totalmoney += receivewelfare.getAmount();
					}
					chart.setLabel(welfare.getWelfareName());
					chart.setY(totalmoney);
					listchart.add(chart);
				}
				
				return new ResponseEntity<List<TotalMembersChart>>(listchart, HttpStatus.OK);
			}
			@RequestMapping(value="/getReceiveWelfareYearly", method = RequestMethod.GET)
			@ResponseBody
			public ResponseEntity<List<LineChart>> getReceiveWelfareYearly() throws ParseException{
				List<LineChart> listLineChart = new ArrayList<LineChart>() ;
				List<Integer> listYear = receiveWelfareServ.getYearYearlyReport();
				List<Long> listTotalAmount = receiveWelfareServ.getTotalAmountYearlyReport();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				for(int index = 0 ; index < listYear.size() ; index++){
					LineChart lineChart = new LineChart();
					Date c= sdf.parse(listYear.get(index)+"-06-15");
					lineChart.setX(c);
					lineChart.setY(listTotalAmount.get(index));
					listLineChart.add(lineChart);
				}
				return new ResponseEntity<List<LineChart>>(listLineChart, HttpStatus.OK);
			}
}
