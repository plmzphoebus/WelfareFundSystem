package com.mfu.web.controller;

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

import com.mfu.entity.Transaction;
import com.mfu.service.AccountService;
import com.mfu.service.TransactionService;

@Controller
public class AccountController {
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//AccountServiceBean!com.mfu.service.AccountService")
	AccountService accountServ;
	@EJB(mappedName = "ejb:/WelfareFundSystemEJB//TransactionServiceBean!com.mfu.service.TransactionService")
	TransactionService transServ;

	@RequestMapping(value = "/getTransaction/{accountid}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Transaction>> getTransactionByAccount(@PathVariable("accountid") long accountid) {
		System.out.println(accountid);
		List<Transaction> listtrans = accountServ.getTransactionByAccount(accountid);
		System.out.println(listtrans.size());
		return new ResponseEntity<List<Transaction>>(listtrans, HttpStatus.OK);
	}

	@RequestMapping(value = "/getTransactionDetail/{transactionid}")
	@ResponseBody
	public ResponseEntity<Transaction> getTransactionDetail(@PathVariable("transactionid") long transactionid) {
		Transaction transaction = transServ.findSavingFundById(transactionid);
		return new ResponseEntity<Transaction>(transaction, HttpStatus.OK);
	}

	@RequestMapping(value = "/savingFund", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> savingFund(@RequestBody Transaction transaction) {
		try {
			Date date = new Date();
			System.out.println("Date "+date);
			System.out.println(transaction.getStartDate());
			System.out.println(transaction.getAccount().getAccountId());
			transaction.setDate(date);
			transaction.setAccount(accountServ.findAccountById(transaction.getAccount().getAccountId()));
			System.out.println("Date "+transaction.getDate());
			transServ.save(transaction);
			
			return new ResponseEntity<String>("200",HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("400",HttpStatus.BAD_REQUEST);
		}
	}
}
