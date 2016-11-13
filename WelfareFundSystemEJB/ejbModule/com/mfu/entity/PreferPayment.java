package com.mfu.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class PreferPayment implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long preferPaymentId;
	private String preferPaymentName;
	private double amount;
	
	@OneToMany(mappedBy="preferPayment",cascade={CascadeType.ALL})
	@JsonIgnore
	private List<Member> members;

	public long getPreferPaymentId() {
		return preferPaymentId;
	}

	public void setPreferPaymentId(long preferPaymentId) {
		this.preferPaymentId = preferPaymentId;
	}

	public String getPreferPaymentName() {
		return preferPaymentName;
	}

	public void setPreferPaymentName(String preferPaymentName) {
		this.preferPaymentName = preferPaymentName;
	}

	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
		
}
