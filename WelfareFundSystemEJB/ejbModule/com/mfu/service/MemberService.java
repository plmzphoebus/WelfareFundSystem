package com.mfu.service;

import java.util.List;

import com.mfu.entity.Beneficiary;
import com.mfu.entity.Member;
import com.mfu.entity.ReceiveWelfare;

public interface MemberService {
	public void save(Member member);
	public void update(Member member);
	public Member findMemberById(long id);
	public List<Member> getAllMember();
	public List<ReceiveWelfare> getReceiveWelfareByMember(long memberId);
	public List<Beneficiary> getBeneficiaryByMember(long memberId);
	public Member findMemberByCitizenId(String citizenId);
	public void delete (long id);
} 
