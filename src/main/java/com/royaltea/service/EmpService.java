package com.royaltea.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.royaltea.pojo.Emp;
import com.royaltea.pojo.EmpKey;
import com.royaltea.pojo.Person;

public interface EmpService {
	/**
     * ����ȫ����person
     * @return
     */
    List<Emp> loadEmp();

	void addEmp(Emp emp);

	Emp login(String empLid, String empPwd) throws Exception;

	int deleteEmp(Integer empId);

	Emp selectById(Integer empId);
	
	void updateEmp1(Emp emp);

	void updateEmp(HttpServletRequest request, Emp emp, MultipartFile file);

	List<Emp> searchEmp(EmpKey empKey);

	void pwdEmp(Emp emp);
}
