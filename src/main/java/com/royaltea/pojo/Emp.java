package com.royaltea.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Emp {
//	E_ID` int(10) NOT NULL AUTO_INCREMENT,
//  `E_LID` varchar(20) DEFAULT NULL,
//  `E_PWD` varchar(20) DEFAULT NULL,
//  `R_ID` int(10) DEFAULT NULL,
//  `E_NAME` varchar(20) DEFAULT NULL,
//  `E_SEX` int(1) DEFAULT NULL,
//  `E_SALARY` decimal(8,2) DEFAULT NULL,
//  `E_WORKTIME` datetime DEFAULT NULL,
//  `E_BIRTHTIME` datetime DEFAULT NULL,
//  `E_TEL` int(20) DEFAULT NULL,
	private Integer empId;
	private String empLid;
	private String empPwd;
	private String empPwdc;
	private String roleId;
	private String roleName;
	private Integer roleRule;
	private String empName;
	private Integer empSex;
	private BigDecimal empSalary;
	private Date empWorktime;
	private Date empBirthtime;
	private String birthtime;
	private String worktime;
	private String empTel;
	private Long empAge;
	private Long empAgework;
	private Long empAgeworkm;
	private String empImg;
	public Integer getRoleRule() {
		return roleRule;
	}
	public void setRoleRule(Integer roleRule) {
		this.roleRule = roleRule;
	}
	public String getEmpImg() {
		return empImg;
	}
	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}
	public Long getEmpAgeworkm() {
		return empAgeworkm;
	}
	public void setEmpAgeworkm(Long empAgeworkm) {
		this.empAgeworkm = empAgeworkm;
	}
	public Long getEmpAgework() {
		return empAgework;
	}
	public void setEmpAgework(Long empAgework) {
		this.empAgework = empAgework;
	}
	public Long getEmpAge() {
		return empAge;
	}
	public void setEmpAge(Long empAge) {
		this.empAge = empAge;
	}
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public String getEmpLid() {
		return empLid;
	}
	public void setEmpLid(String empLid) {
		this.empLid = empLid;
	}
	public String getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Integer getEmpSex() {
		return empSex;
	}
	public void setEmpSex(Integer empSex) {
		this.empSex = empSex;
	}
	
	public BigDecimal getEmpSalary() {
		return empSalary;
	}
	public void setEmpSalary(BigDecimal empSalary) {
		this.empSalary = empSalary;
	}
	public Date getEmpWorktime() {
		return empWorktime;
	}
	public void setEmpWorktime(Date empWorktime) {
		this.empWorktime = empWorktime;
	}
	public Date getEmpBirthtime() {
		return empBirthtime;
	}
	public void setEmpBirthtime(Date empBirthtime) {
		this.empBirthtime = empBirthtime;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getEmpPwdc() {
		return empPwdc;
	}
	public void setEmpPwdc(String empPwdc) {
		this.empPwdc = empPwdc;
	}
	public String getBirthtime() {
		return birthtime;
	}
	public void setBirthtime(String birthtime) {
		this.birthtime = birthtime;
	}
	public String getWorktime() {
		return worktime;
	}
	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", empLid=" + empLid + ", empPwd=" + empPwd + ", empPwdc=" + empPwdc
				+ ", roleId=" + roleId + ", roleName=" + roleName + ", empName=" + empName + ", empSex=" + empSex
				+ ", empSalary=" + empSalary + ", empWorktime=" + empWorktime + ", empBirthtime=" + empBirthtime
				+ ", birthtime=" + birthtime + ", worktime=" + worktime + ", empTel=" + empTel + ", empAge=" + empAge
				+ ", empAgework=" + empAgework + ", empAgeworkm=" + empAgeworkm + "]";
	}
	
	
}
