package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Conditional;
import com.mfu.entity.Role;
import com.mfu.service.ConditionService;
@Stateless
@Remote(ConditionService.class)
public class ConditionServiceBean implements ConditionService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ;
	@Override
	public void save(Conditional conditional) {
		// TODO Auto-generated method stub
		this.em.persist(conditional);
	}

	@Override
	public void updat(Conditional conditional) {
		// TODO Auto-generated method stub
		this.em.merge(conditional);
	}

	@Override
	public Conditional findConditionById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Conditional.class, id);
	}

	@Override
	public List<Conditional> getAllCondition() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Conditional ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Conditional conditional = findConditionById(id);
		if(conditional != null){
			this.em.remove(conditional);
		}
	}

}
