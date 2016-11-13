package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Conditional;
import com.mfu.entity.ReceiveWelfare;
import com.mfu.entity.Welfare;
import com.mfu.service.WelfareService;
@Stateless
@Remote(WelfareService.class)
public class WelfareServiceBean implements WelfareService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ; 
	@Override
	public void save(Welfare welfare) {
		// TODO Auto-generated method stub
		this.em.persist(welfare);
	}

	@Override
	public void update(Welfare welfare) {
		// TODO Auto-generated method stub
		this.em.merge(welfare);
	}

	@Override
	public Welfare findWelfareById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Welfare.class, id);
	}

	@Override
	public List<Welfare> getAllWelfare() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Welfare ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Welfare welfare = findWelfareById(id);
		if(welfare !=null){
			this.em.remove(welfare);
		}
	}

	@Override
	public List<Conditional> getConditionByWelfare(long welfareId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Conditional ent WHERE ent.welfareId=:welfareId").setParameter("welfareId", welfareId).getResultList();
	}

	@Override
	public List<ReceiveWelfare> getReceiveWelfareByWelfare(long welfareId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM ReceiveWelfare ent WHERE ent.welfare.welfareId=:welfareId").setParameter("welfareId", welfareId).getResultList();
	}

}
