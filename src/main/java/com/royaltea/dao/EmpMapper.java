package com.royaltea.dao;

import java.util.List;

import com.royaltea.pojo.Emp;
import com.royaltea.pojo.EmpKey;

public interface EmpMapper {
	/**
	 * ��ѯ
	 */
	List<Emp> queryAll();

	void add(Emp emp);

	Emp selectById(String empLid);
	Emp selectById1(Integer empId);

	void deleteById(Integer empId);

	void update(Emp emp);

	List<Emp> queryKey(EmpKey empKey);

	void pwdUpdate(Emp emp);
}
