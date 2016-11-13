package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Member;
import com.mfu.entity.ReceiveWelfare;
import com.mfu.entity.Transaction;
import com.mfu.service.MemberService;
@Stateless
@Remote(MemberService.class)
public class MemberServiceBean implements MemberService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ;
	@Override
	public void save(Member member) {
		// TODO Auto-generated method stub
		this.em.persist(member);
	}

	@Override
	public void update(Member member) {
		// TODO Auto-generated method stub
		this.em.merge(member);
	}

	@Override
	public Member findMemberById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Member.class, id);
	}

	@Override
	public List<Member> getAllMember() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Member ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Member member = findMemberById(id);
		if(member !=null){
			this.em.remove(member);
		}
	}

	@Override
	public List<ReceiveWelfare> getReceiveWelfareByMember(long memberId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM ReceiveWelfare WHERE ent.member.memberId=:memberId").setParameter("memberId", memberId).getResultList();
	}
}
