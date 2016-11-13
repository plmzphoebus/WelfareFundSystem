package com.mfu.service;

import java.util.List;

import com.mfu.entity.Member;
import com.mfu.entity.MemberType;

public interface MemberTypeService {
	public void save(MemberType memberType);
	public void update(MemberType memberType);
	public MemberType findMemberTypeById(long id);
	public List<MemberType> getAllMemberType();
	public List<Member> getMemberByMemberType(long memberTypeId);
	public void delete(long id);	
}
