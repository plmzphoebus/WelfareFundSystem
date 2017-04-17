package com.mfu.service;

import java.util.List;

import com.mfu.entity.User;

public interface UserService {
	public void save(User user);
	public void update(User user);
	public User findUserById(long id);
	public List<User> getAllUser();
	public void delete(long id);
	public User loginUser(String username, String password);
}
