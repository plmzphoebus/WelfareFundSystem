package com.mfu.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Conditional implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long conditionID;
	private int amountofDate;
	private int welfareMoney;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Welfare welfare;
	
	public long getConditionID() {
		return conditionID;
	}
	public void setConditionID(long conditionID) {
		this.conditionID = conditionID;
	}
	public int getAmountofDate() {
		return amountofDate;
	}
	public void setAmountofDate(int amountofDate) {
		this.amountofDate = amountofDate;
	}
	public int getWelfareMoney() {
		return welfareMoney;
	}
	public void setWelfareMoney(int welfareMoney) {
		this.welfareMoney = welfareMoney;
	}
	public Welfare getWelfare() {
		return welfare;
	}
	public void setWelfare(Welfare welfare) {
		this.welfare = welfare;
	}
}
