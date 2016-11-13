package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Member;
import com.mfu.entity.MemberType;
import com.mfu.service.MemberTypeService;
@Stateless
@Remote(MemberTypeService.class)
public class MemberTypeServiceBean implements MemberTypeService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ; 
	@Override
	public void save(MemberType memberType) {
		// TODO Auto-generated method stub
		this.em.persist(memberType);
	}

	@Override
	public void update(MemberType memberType) {
		// TODO Auto-generated method stub
		this.em.merge(memberType);
	}

	@Override
	public MemberType findMemberTypeById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(MemberType.class, id);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		MemberType memberType = findMemberTypeById(id);
		if(memberType !=null){
			this.em.remove(memberType);
		}
	}

	@Override
	public List<MemberType> getAllMemberType() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM MemberType ent").getResultList();
		
	}

	@Override
	public List<Member> getMemberByMemberType(long memberTypeId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Member ent WHERE ent.memberType.memberTypeId=:memberTypeId").setParameter("memberTypeId", memberTypeId).getResultList();
	} 

}
