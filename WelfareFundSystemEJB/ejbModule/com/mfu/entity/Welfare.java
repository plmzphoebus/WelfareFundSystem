package com.mfu.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Welfare implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long welfareID;
	private String welfareName;
	private String description;
	
	@OneToMany(mappedBy="welfare",cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
	private List<Conditional> conditionals;
	@OneToMany(mappedBy="welfare", cascade={CascadeType.ALL}, fetch=FetchType.LAZY)
	@JsonIgnore
	private List<ReceiveWelfare> receiveWelfare ;
	public long getWelfareID() {
		return welfareID;
	}
	public void setWelfareID(long welfareID) {
		this.welfareID = welfareID;
	}
	public String getWelfareName() {
		return welfareName;
	}
	public void setWelfareName(String welfareName) {
		this.welfareName = welfareName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Conditional> getConditionals() {
		return conditionals;
	}
	public void setConditionals(List<Conditional> conditionals) {
		this.conditionals = conditionals;
	}
	public List<ReceiveWelfare> getReceiveWelfare() {
		return receiveWelfare;
	}
	public void setReceiveWelfare(List<ReceiveWelfare> receiveWelfare) {
		this.receiveWelfare = receiveWelfare;
	}

}
