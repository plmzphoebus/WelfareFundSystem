package com.mfu.service;

import java.util.List;

import com.mfu.entity.Transaction;

public interface TransactionService {
	public void save(Transaction transaction);
	public void update(Transaction transaction);
	public Transaction findSavingFundById(long id);
	public List<Transaction> getAllRSavingFund();
	public List<Integer> getYearYearlyReport();
	public List<Double> getTotalAmountYearlyReport();
	public List<Integer> getYearMonthlyReport();
	public List<Integer> getMonthMonthlyReport();
	public List<Double> getTotalAmountMonthlyReport();
	public void delete(long id);
}
