package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Account;
import com.mfu.entity.Transaction;
import com.mfu.service.AccountService;

@Stateless
@Remote(AccountService.class)
public class AccountServiceBean implements AccountService {
	@PersistenceContext(unitName = "welfareFund")
	EntityManager em;

	@Override
	public void save(Account account) {
		// TODO Auto-generated method stub
		this.em.persist(account);
	}

	@Override
	public void update(Account account) {
		// TODO Auto-generated method stub
		this.em.merge(account);
	}

	@Override
	public Account findAccountById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Account.class, id);
	}

	@Override
	public List<Account> getAllAccount() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Account ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Account account = findAccountById(id);
		if (account != null) {
			this.em.remove(account);
		}
	}

	@Override
	public List<Transaction> getTransactionByAccount(long accountId) {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Transaction ent WHERE ent.account.accountId =:accountId")
				.setParameter("accountId", accountId).getResultList();
	}

}
