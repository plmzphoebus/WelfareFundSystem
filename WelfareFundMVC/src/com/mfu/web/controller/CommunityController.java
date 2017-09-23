package com.mfu.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
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
			Community communityfound = communityserv.findCommunityByName(community.getCommunityName());
			if(communityfound == null){
				if (community.getCommunityId() == 0) {
					communityserv.save(community);
				} else {
					communityserv.update(community);
				}
			}else{
				throw new Exception();
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
	@RequestMapping(value="/getMemberExcelFile", method = RequestMethod.GET)
	public void getMemberReportExcelFile(HttpServletResponse response) throws IOException{
		List<Community> listCommunity = communityserv.getAllCommunity();
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("ข้อมูลสมาชิก");
		HSSFRow row = sheet.createRow(0);
		row.createCell(0).setCellValue("#");
		row.createCell(1).setCellValue("ชื่อ - นามสกุล");
		row.createCell(2).setCellValue("เลขบัตรประชาชน");
		row.createCell(3).setCellValue("วันที่เข้าเป็นสมาชิก");
		row.createCell(4).setCellValue("ประเภทการชำระเงิน");
		row.createCell(5).setCellValue("ชุมชน");
		row.createCell(6).setCellValue("ที่อยู่");
//		row.createCell(7).setCellValue("ผู้รับผลประโยชน์");
		
		//set Date Format
		DataFormat format = workbook.createDataFormat();
		CellStyle dateStyle = workbook.createCellStyle();
		dateStyle.setDataFormat(format.getFormat("dd/mm/yyyy"));
		
		int rows = 1 ;
		for(Community community : listCommunity){
			List<Member> listmember = communityserv.getMemberByCommunity(community.getCommunityId());
			for(Member member : listmember){
				row = sheet.createRow(rows);
				row.createCell(0).setCellValue(rows);
				row.createCell(1).setCellValue(member.getFirstName()+" "+member.getLastName());
				HSSFCell cell = row.createCell(2);
				cell.setCellValue(member.getCitizen().toString());
				cell = row.createCell(3);
				cell.setCellStyle(dateStyle);
				cell.setCellValue(member.getEntranceDate());
				row.createCell(4).setCellValue(member.getPreferPayment());
				row.createCell(5).setCellValue(community.getCommunityName());
				row.createCell(6).setCellValue(member.getAddress());
//				row.createCell(7).setCellValue(member.getBeneficiary().getFirstName()+" "+member.getBeneficiary().getLastName());
				rows++;
			}
		}
		sheet.autoSizeColumn(1);
		sheet.autoSizeColumn(2);
		sheet.autoSizeColumn(3);
		sheet.autoSizeColumn(4);
		sheet.autoSizeColumn(5);
		sheet.autoSizeColumn(6);
//		sheet.autoSizeColumn(7);
		
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=MemberExcelFile.xls");
		workbook.write(response.getOutputStream()); // Write workbook to response.
		workbook.close();
	}
}
