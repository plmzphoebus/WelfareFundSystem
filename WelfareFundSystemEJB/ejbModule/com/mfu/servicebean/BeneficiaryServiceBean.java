package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Beneficiary;
import com.mfu.service.BeneficiaryService;
@Stateless
@Remote(BeneficiaryService.class)
public class BeneficiaryServiceBean implements BeneficiaryService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ;
	@Override
	public void save(Beneficiary beneficiary) {
		// TODO Auto-generated method stub
		this.em.persist(beneficiary);
	}

	@Override
	public void update(Beneficiary beneficiary) {
		// TODO Auto-generated method stub
		this.em.merge(beneficiary);
	}

	@Override
	public Beneficiary findBeneficiaryById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Beneficiary.class, id);
	}

	@Override
	public List<Beneficiary> getAllBeneficiary() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Beneficiary ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Beneficiary beneficiary = findBeneficiaryById(id);
		if(beneficiary !=null){
			this.em.remove(beneficiary);
		}
	}

}
