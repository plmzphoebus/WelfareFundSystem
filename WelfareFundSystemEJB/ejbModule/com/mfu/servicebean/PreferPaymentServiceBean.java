package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Community;
import com.mfu.entity.Member;
import com.mfu.entity.PreferPayment;
import com.mfu.service.PreferPaymentService;
@Stateless
@Remote(PreferPaymentService.class)
public class PreferPaymentServiceBean implements PreferPaymentService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ; 
	@Override
	public void save(PreferPayment preferPayment) {
		// TODO Auto-generated method stub
		this.em.persist(preferPayment);
	}

	@Override
	public void update(PreferPayment preferPayment) {
		// TODO Auto-generated method stub
		this.em.merge(preferPayment);
	}

	
	@Override
	public PreferPayment findPreferPaymentById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(PreferPayment.class, id);
	}

	@Override
	public List<PreferPayment> getAllPaymentType() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM PreferPayment ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		PreferPayment preferPayment = findPreferPaymentById(id);
		if(preferPayment !=null){
			this.em.remove(preferPayment);
		}
	}

	@Override
	public List<Member> getMemberByPreferPayment(long preferPaymentId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Member WHERE ent.preferPayment.preferPaymentId=:preferPaymentId").setParameter("preferPaymentId", preferPaymentId).getResultList();
	}

}
