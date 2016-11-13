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

import com.mfu.entity.PreferPayment;
import com.mfu.service.PreferPaymentService;

@Controller
public class PreferPaymentController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//PreferPaymentServiceBean!com.mfu.service.PreferPaymentService")
	PreferPaymentService preferPaymentServ;

	// listallPreferPayment.do
	@RequestMapping(value = "/listallPreferPayment", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<PreferPayment>> getAllPreferPayment() {
		List<PreferPayment> listPreferPayment = preferPaymentServ.getAllPaymentType();
		return new ResponseEntity<List<PreferPayment>>(listPreferPayment, HttpStatus.OK);
	}

	// getPreferPayment/1.do
	@RequestMapping(value = "/getPreferPayment/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<PreferPayment> getPreferPaymentById(@PathVariable("id") String id) {
		PreferPayment community = preferPaymentServ.findPreferPaymentById(Long.parseLong(id));
		return new ResponseEntity<PreferPayment>(community, HttpStatus.OK);
	}

	// savePreferPayment.do
	@RequestMapping(value = "/savePreferPayment", method = { RequestMethod.POST, RequestMethod.PUT })
	public ResponseEntity<String> createPreferPayment(@RequestBody PreferPayment community) {
		try {
			if (community.getPreferPaymentId() == 0) {
				preferPaymentServ.save(community);
			} else {
				preferPaymentServ.update(community);
			}
			return new ResponseEntity<String>("200", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}

	// deletePreferPayment/5.do
	@RequestMapping(value = "/deletePreferPayment/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deletePreferPayment(@PathVariable("id") String id) {
		try {
			preferPaymentServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
		}
	}
}
