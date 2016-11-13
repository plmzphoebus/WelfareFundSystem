package com.mfu.service;

import java.util.List;

import com.mfu.entity.Community;
import com.mfu.entity.Member;

public interface CommunityService {
	public void save(Community community);
	public void update(Community community);
	public Community findCommunityById(long id);
	public List<Community> getAllCommunity();
	public List<Member> getMemberByCommunity(long communityid);
	public void delete(long id);
}
