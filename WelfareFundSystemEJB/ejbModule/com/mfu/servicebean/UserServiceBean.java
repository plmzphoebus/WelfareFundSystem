package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.User;
import com.mfu.service.UserService;
@Stateless
@Remote(UserService.class)
public class UserServiceBean implements UserService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ; 
	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		this.em.persist(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		this.em.merge(user);
	}

	@Override
	public User findUserById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(User.class, id);
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM User ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		User user = findUserById(id);
		if(user !=null){
			this.em.remove(user);
		}
	}

	@Override
	public User loginUser(String username, String password) {
		// TODO Auto-generated method stub
		User user = null;
		try{
			user = (User) this.em.createQuery("SELECT ent FROM User ent WHERE ent.userName=:username AND ent.password=:password").setParameter("username", username).setParameter("password", password).getResultList().get(0);
		}catch(Exception e){
			
		}
		return user;
	}

}
