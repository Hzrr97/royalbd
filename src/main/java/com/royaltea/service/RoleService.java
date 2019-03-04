package com.royaltea.service;

import java.util.List;

import com.royaltea.pojo.Emp;
import com.royaltea.pojo.Role;

public interface RoleService {
	/**
     * ����ȫ����person
     * @return
     */
    List<Role> loadRole();
    
    void addRole(Role role);
    
    int deleteRole(Integer ftId);

	Role selectById(Integer roleId);

	void updateRole(Role role);
}
