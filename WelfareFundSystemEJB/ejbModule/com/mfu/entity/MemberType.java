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
public class MemberType implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long memberTypeId;
	private String memberTypeName;
	
	@OneToMany(mappedBy="memberType",cascade={CascadeType.ALL})
	@JsonIgnore
	private List<Member> members;
		
	public long getMemberTypeId() {
		return memberTypeId;
	}
	public void setMemberTypeId(long memberTypeId) {
		this.memberTypeId = memberTypeId;
	}
	public String getMemberTypeName() {
		return memberTypeName;
	}
	public void setMemberTypeName(String memberTypeName) {
		this.memberTypeName = memberTypeName;
	}
	public List<Member> getMembers() {
		return members;
	}
	public void setMembers(List<Member> members) {
		this.members = members;
	}
	
}
