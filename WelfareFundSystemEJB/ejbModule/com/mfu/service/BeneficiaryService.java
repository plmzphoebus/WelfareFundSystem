package com.mfu.service;

import java.util.List;

import com.mfu.entity.Beneficiary;

public interface BeneficiaryService {
	public void save(Beneficiary beneficiary);
	public void update(Beneficiary beneficiary);
	public Beneficiary findBeneficiaryById(long id);
	public List<Beneficiary> getAllBeneficiary();
	public void delete(long id);
	
}
