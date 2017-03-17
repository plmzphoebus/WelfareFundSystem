package com.mfu.service;

import java.util.List;

import com.mfu.entity.Account;
import com.mfu.entity.Member;
import com.mfu.entity.Transaction;

public interface AccountService {
	public void save(Account account);
	public void update(Account account);
	public Account findAccountById(long id);
	public List<Account> getAllAccount();
	public List<Transaction> getTransactionByAccount(long accountId);
	public Member getMemberByAcountId(long accountId);
	public void delete (long id);
	
}
