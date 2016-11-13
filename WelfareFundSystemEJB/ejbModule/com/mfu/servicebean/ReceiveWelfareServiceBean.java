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

}
