package com.mfu.web.controller;

import java.util.ArrayList;
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
import com.mfu.service.CommunityService;
import com.mfu.web.model.TotalMembersChart;

@Controller
public class CommunityController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//CommunityServiceBean!com.mfu.service.CommunityService")
	CommunityService communityserv;

	// listallCommunity.do
	@RequestMapping(value = "/listallCommunity", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Community>> getAllCommunity() {
		List<Community> listCommunity = communityserv.getAllCommunity();
		return new ResponseEntity<List<Community>>(listCommunity, HttpStatus.OK);
	}
	
	// getTotalMembersChart.do
		@RequestMapping(value = "/getTotalMembersChart", method = RequestMethod.GET)
		@ResponseBody
		public ResponseEntity<List<TotalMembersChart>> getTotalMembersChart() {
			List<Community> listCommunity = communityserv.getAllCommunity();
			List<TotalMembersChart> listchart = new ArrayList<TotalMembersChart>();
			for(Community community : listCommunity){
				TotalMembersChart chart = new TotalMembersChart();
				int total = 0 ;
				List<Member> listmember = communityserv.getMemberByCommunity(community.getCommunityId());
				for(Member member : listmember){
					total++;
				}
				chart.setLabel(community.getCommunityName());
				chart.setY(total);
				listchart.add(chart);
			}
			return new ResponseEntity<List<TotalMembersChart>>(listchart, HttpStatus.OK);
		}

	// getCommunity/1.do
	@RequestMapping(value = "/getCommunity/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Community> getCommunityById(@PathVariable("id") String id) {
		Community community = communityserv.findCommunityById(Long.parseLong(id));
		return new ResponseEntity<Community>(community, HttpStatus.OK);
	}

	// saveCommnity.do
	@RequestMapping(value = "/saveCommunity", method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<String> createCommunity(@RequestBody Community community) {
		try {
			if (community.getCommunityId() == 0) {
				communityserv.save(community);
			} else {
				communityserv.update(community);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}

	// deleteCommunity/5.do
	@RequestMapping(value = "/deleteCommunity/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteCommunity(@PathVariable("id") String id) {
		try {
			communityserv.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
}
