package com.mfu.service;

import java.util.List;

import com.mfu.entity.Member;
import com.mfu.entity.PreferPayment;

public interface PreferPaymentService {
	public void save(PreferPayment preferPayment);
	public void update(PreferPayment preferPayment);
	public PreferPayment findPreferPaymentById(long id);
	public List<PreferPayment> getAllPaymentType();
	public List<Member> getMemberByPreferPayment(long preferPaymentId);
	public void delete(long id);
	
}
