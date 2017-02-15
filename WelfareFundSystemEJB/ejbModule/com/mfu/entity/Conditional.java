package com.mfu.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Conditional implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long conditionID;
	private String conditionDetail;
	private int amountofDate;
	private int welfareMoney;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Welfare welfare;
	
	public long getConditionID() {
		return conditionID;
	}
	public void setConditionID(long conditionID) {
		this.conditionID = conditionID;
	}
	public String getConditionDetail() {
		return conditionDetail;
	}
	public void setConditionDetail(String conditionDetail) {
		this.conditionDetail = conditionDetail;
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
