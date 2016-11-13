package com.mfu.service;

import java.util.List;

import com.mfu.entity.Conditional;
import com.mfu.entity.ReceiveWelfare;
import com.mfu.entity.Welfare;

public interface WelfareService {
	public void save(Welfare welfare);
	public void update(Welfare welfare);
	public Welfare findWelfareById(long id);
	public List<Welfare> getAllWelfare();
	public List<Conditional> getConditionByWelfare(long welfareId);
	public List<ReceiveWelfare> getReceiveWelfareByWelfare(long welfareId);
	public void delete(long id);
	
}
