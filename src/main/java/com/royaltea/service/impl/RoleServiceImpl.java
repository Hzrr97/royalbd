package com.royaltea.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royaltea.dao.RoleMapper;
import com.royaltea.pojo.Role;
import com.royaltea.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> loadRole() {
		return roleMapper.queryAll();
	}

	@Override
	public void addRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.add(role);
	}
	
	@Override
	public int deleteRole(Integer roleId) {
		try {
			roleMapper.deleteById(roleId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	
	@Override
	public Role selectById(Integer roleId) {
		// TODO Auto-generated method stub
		Role role =  roleMapper.selectById(roleId);
		
		return role;
	}

	@Override
	public void updateRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.update(role);
		
	}
}
