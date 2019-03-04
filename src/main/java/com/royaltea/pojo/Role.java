package com.royaltea.pojo;

import java.math.BigDecimal;

public class Role {
	private Integer roleId;
	private String roleName;
	private BigDecimal roleMinsalary;
	private BigDecimal roleMaxsalary;
	private String roleRule;
	public String getRoleRule() {
		return roleRule;
	}
	public void setRoleRule(String roleRule) {
		this.roleRule = roleRule;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public BigDecimal getRoleMinsalary() {
		return roleMinsalary;
	}
	public void setRoleMinsalary(BigDecimal roleMinsalary) {
		this.roleMinsalary = roleMinsalary;
	}
	public BigDecimal getRoleMaxsalary() {
		return roleMaxsalary;
	}
	public void setRoleMaxsalary(BigDecimal roleMaxsalary) {
		this.roleMaxsalary = roleMaxsalary;
	}
	
}
