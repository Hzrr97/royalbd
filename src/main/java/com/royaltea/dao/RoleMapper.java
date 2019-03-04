package com.royaltea.dao;

import java.util.List;

import com.royaltea.pojo.Role;

public interface RoleMapper {
	
	List<Role> queryAll();
	
	void add(Role role);
	
	void deleteById(Integer roleId);

	Role selectById(Integer roleId);

	void update(Role role);
}
