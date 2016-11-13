package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Role;
import com.mfu.entity.User;
import com.mfu.service.RoleService;
@Stateless
@Remote(RoleService.class)
public class RoleServiceBean implements RoleService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ;
	@Override
	public void save(Role role) {
		// TODO Auto-generated method stub
		this.em.persist(role);
	}

	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		this.em.merge(role);
	}

	@Override
	public Role findRoleById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Role.class, id);
	}

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Role ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Role role = findRoleById(id);
		if(role != null){
			this.em.remove(role);
		}
	}

	@Override
	public List<User> getUserByRole(long roleId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM User ent WHERE ent.role.roleId=:roleId").setParameter("roleId", roleId).getResultList();
	}

}
