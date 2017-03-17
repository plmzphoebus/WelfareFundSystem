package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.ReceiveWelfare;
import com.mfu.service.ReceiveWelfareService;
@Stateless
@Remote(ReceiveWelfareService.class)
public class ReceiveWelfareServiceBean implements ReceiveWelfareService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ;
	@Override
	public void save(ReceiveWelfare receiveWelfare) {
		// TODO Auto-generated method stub
		this.em.persist(receiveWelfare);
	}

	@Override
	public void update(ReceiveWelfare receiveWelfare) {
		// TODO Auto-generated method stub
		this.em.merge(receiveWelfare);
	}

	@Override
	public ReceiveWelfare findReceiveWelfareById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(ReceiveWelfare.class, id);
	}

	@Override
	public List<ReceiveWelfare> getAllReceiveWelfare() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM ReceiveWelfare ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		ReceiveWelfare receiveWelfare = findReceiveWelfareById(id);
		if(receiveWelfare !=null){
			this.em.remove(receiveWelfare);
		}
	}

	@Override
	public List<Integer> getYearYearlyReport() {
		// TODO Auto-generated method stub
		List<Integer> model = this.em.createQuery("SELECT distinct year(ent.date) FROM ReceiveWelfare ent group by year(ent.date) order by year(ent.date) asc").getResultList();
		return model;
	}

	@Override
	public List<Long> getTotalAmountYearlyReport() {
		// TODO Auto-generated method stub
		List<Long> model = this.em.createQuery("SELECT sum(ent.amount) FROM ReceiveWelfare ent group by year(ent.date) order by year(ent.date) asc").getResultList();
		return model;
	}

	@Override
	public List<Integer> getYearMonthlyReport() {
		List<Integer> model = this.em.createQuery("SELECT YEAR(ent.date) FROM ReceiveWelfare ent GROUP BY YEAR(ent.date), MONTH(ent.date) ORDER BY YEAR(ent.date), MONTH(ent.date)").getResultList();
		return model;
	}

	@Override
	public List<Integer> getMonthMonthlyReport() {
		List<Integer> model = this.em.createQuery("SELECT MONTH(ent.date) FROM ReceiveWelfare ent GROUP BY YEAR(ent.date), MONTH(ent.date) ORDER BY YEAR(ent.date), MONTH(ent.date)").getResultList();
		return model;
	}

	@Override
	public List<Long> getTotalAmountMonthlyReport() {
		List<Long> model = this.em.createQuery("SELECT SUM(ent.amount) FROM ReceiveWelfare ent GROUP BY YEAR(ent.date), MONTH(ent.date) ORDER BY YEAR(ent.date), MONTH(ent.date)").getResultList();
		return model;
	}
	

}
