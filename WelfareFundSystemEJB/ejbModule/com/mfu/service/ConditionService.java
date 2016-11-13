package com.mfu.service;

import java.util.List;

import com.mfu.entity.Conditional;

public interface ConditionService {
	public void save(Conditional conditional);
	public void updat(Conditional conditional);
	public Conditional findConditionById(long id);
	public List<Conditional> getAllCondition();
	public void delete(long id);
}
