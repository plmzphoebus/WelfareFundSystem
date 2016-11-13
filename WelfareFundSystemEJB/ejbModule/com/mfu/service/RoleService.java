package com.mfu.service;

import java.util.List;

import com.mfu.entity.Role;
import com.mfu.entity.User;

public interface RoleService {
	public void save(Role role);
	public void update(Role role);
	public Role findRoleById(long id);
	public List<Role> getAllRole();
	public List<User> getUserByRole(long roleId);
	public void delete(long id);
}
