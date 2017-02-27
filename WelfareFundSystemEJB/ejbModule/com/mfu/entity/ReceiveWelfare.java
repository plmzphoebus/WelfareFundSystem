package com.mfu.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ReceiveWelfare implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long receiveWelfareId;
	private Date date;
	private int amount;
	private String remark;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Member member;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Welfare welfare;

	public long getReceiveWelfareId() {
		return receiveWelfareId;
	}

	public void setReceiveWelfareId(long receiveWelfareId) {
		this.receiveWelfareId = receiveWelfareId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Welfare getWelfare() {
		return welfare;
	}

	public void setWelfare(Welfare welfare) {
		this.welfare = welfare;
	}

	@Override
	public String toString() {
		return "ReceiveWelfare [receiveWelfareId=" + receiveWelfareId + ", date=" + date + ", amount=" + amount
				+ ", remark=" + remark + ", member=" + member + ", welfare=" + welfare + "]";
	}

}
