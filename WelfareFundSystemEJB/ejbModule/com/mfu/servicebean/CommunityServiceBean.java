package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Community;
import com.mfu.entity.Member;
import com.mfu.service.CommunityService;
@Stateless
@Remote(CommunityService.class)
public class CommunityServiceBean implements CommunityService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ; 
	@Override
	public void save(Community community) {
		// TODO Auto-generated method stub
		this.em.persist(community);
	}

	@Override
	public void update(Community community) {
		// TODO Auto-generated method stub
		this.em.merge(community);
	}

	@Override
	public Community findCommunityById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Community.class, id);
		
	}

	@Override
	public List<Community> getAllCommunity() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Community ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Community community = findCommunityById(id);
		if(community !=null){
			this.em.remove(community);
		}
	}

	@Override
	public List<Member> getMemberByCommunity(long communityid) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Member ent WHERE ent.community.communityId =:communityid").setParameter("communityid", communityid).getResultList();
	}

}
