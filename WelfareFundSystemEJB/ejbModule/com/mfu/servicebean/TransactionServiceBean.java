package com.mfu.servicebean;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mfu.entity.Transaction;
import com.mfu.service.TransactionService;
@Stateless
@Remote(TransactionService.class)
public class TransactionServiceBean implements TransactionService {
	@PersistenceContext(unitName="welfareFund")
	EntityManager em ; 
	@Override
	public void save(Transaction transaction) {
		// TODO Auto-generated method stub
		this.em.persist(transaction);
	}

	@Override
	public void update(Transaction transaction) {
		// TODO Auto-generated method stub
		this.em.merge(transaction);
	}

	@Override
	public Transaction findSavingFundById(long id) {
		// TODO Auto-generated method stub
		return this.em.find(Transaction.class, id);
	}

	@Override
	public List<Transaction> getAllRSavingFund() {
		// TODO Auto-generated method stub
		return this.em.createQuery("SELECT ent FROM Transaction ent").getResultList();
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		Transaction transaction = findSavingFundById(id);
		if(transaction !=null){
			this.em.remove(transaction);
		}
	}

	@Override
	public List<Integer> getYearYearlyReport() {
		List<Integer> model = this.em.createQuery("SELECT distinct year(ent.date) FROM Transaction ent group by year(ent.date) order by year(ent.date) asc").getResultList();
		return model;
	}

	@Override
	public List<Double> getTotalAmountYearlyReport() {
		List<Double> model = this.em.createQuery("SELECT sum(ent.amount) FROM Transaction ent group by year(ent.date) order by year(ent.date) asc").getResultList();
		return model;
	}

	@Override
	public List<Integer> getYearMonthlyReport() {
		List<Integer> model = this.em.createQuery("SELECT YEAR(ent.date) FROM Transaction ent GROUP BY YEAR(ent.date), MONTH(ent.date) ORDER BY YEAR(ent.date), MONTH(ent.date)").getResultList();
		return model;
	}

	@Override
	public List<Integer> getMonthMonthlyReport() {
		List<Integer> model = this.em.createQuery("SELECT MONTH(ent.date) FROM Transaction ent GROUP BY YEAR(ent.date), MONTH(ent.date) ORDER BY YEAR(ent.date), MONTH(ent.date)").getResultList();
		return model;
	}

	@Override
	public List<Double> getTotalAmountMonthlyReport() {
		List<Double> model = this.em.createQuery("SELECT SUM(ent.amount) FROM Transaction ent GROUP BY YEAR(ent.date), MONTH(ent.date) ORDER BY YEAR(ent.date), MONTH(ent.date)").getResultList();
		return model;
	}
	@Override
	public Transaction getLastRecordByAccountId(long accountId) {
		// TODO Auto-generated method stub
		try{
		return (Transaction) this.em.createQuery("SELECT ent FROM Transaction ent WHERE ent.account.accountId=:accountId ORDER BY ent.transactionId DESC").setMaxResults(1).setParameter("accountId", accountId).getResultList().get(0);
		}catch(IndexOutOfBoundsException e){
			return null;
		}
	}

}
