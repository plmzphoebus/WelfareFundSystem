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
public class Welfare implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long welfareID;
	private String welfareName;
	private String description;
	
	@OneToMany(mappedBy="welfare",cascade={CascadeType.ALL})
	@JsonIgnore
	private List<Conditional> conditionals;
	
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
	public List<Conditional> getConditions() {
		return conditionals;
	}
	public void setConditions(List<Conditional> conditionals) {
		this.conditionals = conditionals;
	}

}
