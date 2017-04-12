
package com.mfu.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mfu.entity.Account;
import com.mfu.entity.Beneficiary;
import com.mfu.entity.Community;
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
	@RequestMapping(value = "/uploadExcelFile", method = RequestMethod.POST)
	public ResponseEntity<String> upload(@RequestParam CommonsMultipartFile file, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/");
		String filename = file.getOriginalFilename();

		
		File folderPart = new File(session.getServletContext().getRealPath("")+File.separator+"uploadfile");
		if (!folderPart.exists()) {
			folderPart.mkdir();
		}
		try {
			byte barr[] = file.getBytes();

			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path + "/uploadfile/" + filename));
			bout.write(barr);
			bout.flush();
			bout.close();
			String filepath = "uploadfile/" + filename;
			session.setAttribute("recentExcelFileUploaded",path + "uploadfile\\" + filename);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return new ResponseEntity<String>("200", HttpStatus.OK);
	}
	@RequestMapping(value="/readExcelFile" , method=RequestMethod.GET)
	public String readExcelFile(HttpSession session) throws FileNotFoundException, IOException, ParseException{
		List<Member> listMember = new ArrayList<Member>();
		String excelFilePath = (String) session.getAttribute("recentExcelFileUploaded");
		//String excelFilePath = "E:\\jboss-eap-6.4\\standalone\\deployments\\WelfareFundMVC.war\\uploadfile\\member.xls";
		Workbook workbook = null;
		 
	    if (excelFilePath.endsWith("xlsx")) {
	        workbook = new XSSFWorkbook(new FileInputStream(new File(excelFilePath)));
	    } else if (excelFilePath.endsWith("xls")) {
	        workbook = new HSSFWorkbook(new FileInputStream(new File(excelFilePath)));
	    } else {
	        throw new IllegalArgumentException("The specified file is not Excel file");
	    }
	    
	    Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> iterator = firstSheet.iterator();
        
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            Iterator<Cell> cellIterator = nextRow.cellIterator();
             System.out.println("Row Number: "+nextRow.getRowNum());
             
             Member member = new Member();
             Beneficiary benefit = new Beneficiary();
             member.setBeneficiary(benefit);
             outerloop:
            while (cellIterator.hasNext()) {
            	if(nextRow.getRowNum() == 0)
            		break outerloop;
                Cell cell = cellIterator.next();
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case 0:
                    	SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                    	member.setEntranceDate(format.parse((String)getCellValue(cell)));
                        break;
                    case 1:
                    	Community com = communityServ.findCommunityByName((String)getCellValue(cell));
                    	if(com == null){
                    		System.out.println("Community"+ com);
                    		com = new Community();
                    		com.setCommunityName((String)getCellValue(cell));
                    		communityServ.save(com);
                    	}
                    		member.setCommunity(com);
                        break;
                    case 2:
                        member.setPreferPayment((String)getCellValue(cell));
                        break;
                    case 3:
                    	member.setFirstName((String)getCellValue(cell));
                    	break;
                    case 4:
                    	member.setLastName((String)getCellValue(cell));
                    	break;
                    case 5:
                    	long age = Long.parseLong(((String)getCellValue(cell)));
                    	member.setAge((int) age);
                    	break;
                    case 6:
                    	member.setCitizen((String)getCellValue(cell));
                    	break;
                    case 7:
                    	member.setAddress((String)getCellValue(cell));
                    	break;
                    case 8:
                    	member.setTelephoneNumber((String)getCellValue(cell));
                    	break;
                    case 9:
                    	member.setMobileTel((String)getCellValue(cell));
                    	break;
                    case 10:
                    	member.setOccupation((String)getCellValue(cell));
                    	break;
                    case 11:
                    	member.setRevenue(Integer.parseInt((String)getCellValue(cell)));
                    	break;
                    case 12:
                    	System.out.print("Name"+(String)getCellValue(cell));
                    	member.getBeneficiary().setFirstName((String)getCellValue(cell));
                    	break;
                    case 13:
                    	member.getBeneficiary().setLastName((String)getCellValue(cell));
                    	break;
                    case 14:
                    	long benefitage = Math.round((Double)getCellValue(cell));
                    	member.getBeneficiary().setAge((int) benefitage);
                    	break;
                    case 15:
                    	member.getBeneficiary().setCitizenId((String)getCellValue(cell));
                    	break;
                    case 16:
                    	member.getBeneficiary().setAddress((String)getCellValue(cell));
                    	break;
                    case 17:
                    	member.getBeneficiary().setTelephoneNumber((String)getCellValue(cell));
                    	break;
                    case 18:
                    	member.getBeneficiary().setMobileTel((String)getCellValue(cell));
                    	break;
                    case 19:
                    	member.getBeneficiary().setOccupation((String)getCellValue(cell));
                    	break;
                    case 20:
                    	member.getBeneficiary().setRevenue(Integer.parseInt((String)getCellValue(cell)));
                    	break;
                    case 21:
                    	member.getBeneficiary().setRelationship((String)getCellValue(cell));
                    	break;
                }
            }
             Account account = new Account();
				account.setMember(member);
				member.setAccount(account);
				//set Member to Beneficiary
				member.getBeneficiary().setMember(member);
             if(nextRow.getRowNum() > 0){
            	 Member checkSame = memberServ.findMemberByCitizenId(member.getCitizen());
            	 if(checkSame == null){
            		 listMember.add(member);
            		 memberServ.save(member);
            	 }else{
            		 System.out.println("Row Number Same CitizenId : "+nextRow.getRowNum());
            	 }
             }
				
        }
         
        workbook.close();
		
		return "redirect:allMember.jsp";
	}
	
	private Object getCellValue(Cell cell) {
	    switch (cell.getCellType()) {
	    case Cell.CELL_TYPE_STRING:
	        return cell.getStringCellValue();
	 
	    case Cell.CELL_TYPE_BOOLEAN:
	        return cell.getBooleanCellValue();
	 
	    case Cell.CELL_TYPE_NUMERIC:
	        return cell.getNumericCellValue();
	    }
	 
	    return null;
	}
}
