package com.mfu.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Member implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)		
	private long memberId;
	private String citizen;
	private Date entranceDate;
	private String firstName;
	private String lastName;
	private int age;
	private String address;
	private String telephoneNumber;
	private String mobileTel;
	private String occupation;
	private int revenue;
	private String preferPayment;

	@ManyToOne(fetch = FetchType.EAGER)
	private Community community;
	
	@OneToOne(cascade={CascadeType.ALL} , fetch = FetchType.EAGER)
	private Beneficiary beneficiary; 
	
	@OneToMany(mappedBy = "member", cascade = { CascadeType.ALL })
	@JsonIgnore
	private List<ReceiveWelfare> receiveWelfare;
	
	@OneToOne(cascade={CascadeType.ALL} , fetch = FetchType.EAGER)
	private Account account;
	

	
	public long getMemberId() {
		return memberId;
	}

	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}

	public String getCitizen() {
		return citizen;
	}

	public void setCitizen(String citizen) {
		this.citizen = citizen;
	}

	public Date getEntranceDate() {
		return entranceDate;
	}

	public void setEntranceDate(Date entranceDate) {
		this.entranceDate = entranceDate;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	public String getMobileTel() {
		return mobileTel;
	}

	public void setMobileTel(String mobileTel) {
		this.mobileTel = mobileTel;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public int getRevenue() {
		return revenue;
	}

	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}

	public String getPreferPayment() {
		return preferPayment;
	}

	public void setPreferPayment(String preferPayment) {
		this.preferPayment = preferPayment;
	}

	public Community getCommunity() {
		return community;
	}

	public void setCommunity(Community community) {
		this.community = community;
	}

	public Beneficiary getBeneficiary() {
		return beneficiary;
	}

	public void setBeneficiary(Beneficiary beneficiary) {
		this.beneficiary = beneficiary;
	}

	public List<ReceiveWelfare> getReceiveWelfare() {
		return receiveWelfare;
	}

	public void setReceiveWelfare(List<ReceiveWelfare> receiveWelfare) {
		this.receiveWelfare = receiveWelfare;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
}
