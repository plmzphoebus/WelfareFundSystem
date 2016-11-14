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

import com.mfu.entity.Transaction;
import com.mfu.service.TransactionService;


@Controller
public class TransactionController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//TransactionServiceBean!com.mfu.service.TransactionService")
	TransactionService transactionServ;
	
		
	@RequestMapping(value = "/getTransaction/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Transaction> getRoleById(@PathVariable("id") String id){
		Transaction transaction = transactionServ.findSavingFundById(Long.parseLong(id));
		return new ResponseEntity<Transaction>(transaction, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveTransaction", method = {RequestMethod.POST, RequestMethod.PUT})
	public ResponseEntity<String> createTransaction(@RequestBody Transaction transaction){
		try{
			if(transaction.getTransactionId() == 0){
				transactionServ.save(transaction);
			}else{
				transactionServ.update(transaction);
			}	
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteTransaction", method = RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<String> deleteTransaction(@PathVariable("id") String id){
		try{
			transactionServ.delete(Long.parseLong(id));
			return new ResponseEntity<String>("200", HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<String>("400", HttpStatus.BAD_REQUEST);
		}
	}
}
