package com.royaltea.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.royaltea.dao.EmpMapper;
import com.royaltea.pojo.Emp;
import com.royaltea.pojo.EmpKey;
import com.royaltea.service.EmpService;

@Service("empService")
public class EmpServiceImpl implements EmpService {
	
	private EmpMapper empMapper;

    public EmpMapper getEmpMapper() {
        return empMapper;
    }
    @Autowired
    public void setEmpMapper(EmpMapper empMapper) {
        this.empMapper = empMapper;
    }
	@Override
	public List<Emp> loadEmp() {
		// TODO Auto-generated method stub
		Long day;
		Date a=new Date();
		Date b;
		Date c;
		List<Emp> list = empMapper.queryAll();
		for(Emp emp : list) {
			if(emp.getEmpBirthtime()!=null){
			b=emp.getEmpBirthtime();
			c=emp.getEmpWorktime();
			day=(Long)((a.getTime()-b.getTime())/(24*60*60*365)/1000);
			  emp.setEmpAge(day);
			  day=(Long)((a.getTime()-c.getTime())/(24*60*60*365)/1000);
			  emp.setEmpAgework(day);
			  day=(Long)((a.getTime()-c.getTime())/(24*60*60*30)/1000);
			  emp.setEmpAgeworkm(day%12);
			} 
			}
		return list;
	}
	@Override
	public void addEmp(Emp emp) {
		// TODO Auto-generated method stub
		empMapper.add(emp);
	}
	@Override
	public Emp login(String empLid, String empPwd) throws Exception{
		Emp emp = null;
		
		try{
			emp = empMapper.selectById(empLid);
		}catch(Exception ex){
			throw new Exception("服务器错误",ex);
		}
		if (emp == null){
			throw new Exception("用户不存在");
		}
		if(!emp.getEmpPwd().equals(empPwd)){
			throw new Exception("密码错误");
		}
		
		return emp;
	}
	@Override
	public int deleteEmp(Integer empId) {
		try {
			empMapper.deleteById(empId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	@Override
	public Emp selectById(Integer empId) {
		// TODO Auto-generated method stub
		Emp emp =  empMapper.selectById1(empId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String Birthtime = sdf.format(emp.getEmpBirthtime());
		String Worktime = sdf.format(emp.getEmpWorktime());
		emp.setBirthtime(Birthtime);
		emp.setWorktime(Worktime);
		return emp;
	}
	
	@Override
	public void updateEmp1(Emp emp) {
		// TODO Auto-generated method stub
		empMapper.update(emp);
	}
	
	@Override
	public void updateEmp(HttpServletRequest request, Emp emp, MultipartFile file) {
		// TODO Auto-generated method stub
		if (file.getSize()>= 1) {
            try {
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
                // )
            	String fileName = (int)(1+Math.random()*(10-1+1)) +file.getOriginalFilename();
                String filePath = request.getSession().getServletContext()
                        .getRealPath("/")
                        + "upload/" + fileName;
                System.out.println(filePath);
                File saveDir = new File(filePath);
                if (!saveDir.getParentFile().exists())
                    saveDir.getParentFile().mkdirs();

                // 转存文件
                file.transferTo(saveDir);
                emp.setEmpImg(fileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		empMapper.update(emp);
	}
	@Override
	public List<Emp> searchEmp(EmpKey empKey) {
		// TODO Auto-generated method stub
		Long day;
		Date a=new Date();
		Date b;
		Date c;
		List<Emp> list = empMapper.queryKey(empKey);
		for(Emp emp : list) {
			if(emp.getEmpBirthtime()!=null){
			b=emp.getEmpBirthtime();
			c=emp.getEmpWorktime();
			day=(Long)((a.getTime()-b.getTime())/(24*60*60*365)/1000);
			  emp.setEmpAge(day);
			  day=(Long)((a.getTime()-c.getTime())/(24*60*60*365)/1000);
			  emp.setEmpAgework(day);
			  day=(Long)((a.getTime()-c.getTime())/(24*60*60*30)/1000);
			  emp.setEmpAgeworkm(day%12);
			} 
			}
		return list;
	}
	@Override
	public void pwdEmp(Emp emp) {
		// TODO Auto-generated method stub
		empMapper.pwdUpdate(emp);
	}
	

}
