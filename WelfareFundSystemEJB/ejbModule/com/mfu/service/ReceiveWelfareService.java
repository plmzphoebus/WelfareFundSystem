package com.mfu.service;

import java.util.List;

import com.mfu.entity.ReceiveWelfare;

public interface ReceiveWelfareService {
	public void save(ReceiveWelfare receiveWelfare);
	public void update(ReceiveWelfare receiveWelfare);
	public ReceiveWelfare findReceiveWelfareById(long id);
	public List<ReceiveWelfare> getAllReceiveWelfare();
	public void delete(long id);
	
}
