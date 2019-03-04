package com.royaltea.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.royaltea.dao.EmpMapper;
import com.royaltea.pojo.Emp;
import com.royaltea.pojo.EmpKey;
import com.royaltea.pojo.Role;
import com.royaltea.service.EmpService;
import com.royaltea.service.RoleService;

@Controller
public class EmpController {
	@Autowired
	private EmpService empService;
    
	@Autowired
	private RoleService roleService;

    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/emp",method=RequestMethod.GET)
    public String pageList(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpSession httpSession){
        
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        EmpKey empKey = (EmpKey)httpSession.getAttribute("empKey");
        List<Emp> empList;
        if (empKey == null){
        	empList = empService.loadEmp();//��ȡ�����û���Ϣ
        }else {
        	empList = empService.searchEmp(empKey);//��ȡ�����û���Ϣ
        }
        PageInfo<Emp> pageInfo=new PageInfo<Emp>(empList);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("roleInfo", roleService.loadRole());
        return "emp";
    }
    
    @RequestMapping(value="/emp-add",method=RequestMethod.POST)
    public String empAdd(ModelMap map,Emp emp,String empWorktime1,String empBirthtime1){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
			emp.setEmpBirthtime(sdf.parse(empBirthtime1));
			emp.setEmpWorktime(sdf.parse(empWorktime1));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	empService.addEmp(emp);
		
        return "redirect:emp";
    }
    
    @RequestMapping(value="/emp-login",method=RequestMethod.POST)
    public String empLogin(ModelMap map,String empLid,String empPwd,HttpSession httpSession){
    	String errorMsg = "";
    	try{
			Emp emp = empService.login(empLid, empPwd);
			httpSession.setAttribute("emp", emp);
		}catch(Exception ex){
			ex.printStackTrace();
			errorMsg = ex.getMessage();
		}
		
		if("".equals(errorMsg)){
			return "redirect:emp";
		}else{
			map.addAttribute("errorMsg", errorMsg);
			return "login";
		}
        
    }
    
    @RequestMapping(value="/emp-delete",method=RequestMethod.POST)
    @ResponseBody
    public String empDelete(Integer empId){
    	int i = empService.deleteEmp(empId);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/emp-update",method=RequestMethod.GET)
    public String empUpdate(ModelMap map,Integer empId,Integer pageNo,HttpSession httpSession){
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        EmpKey empKey = (EmpKey)httpSession.getAttribute("empKey");
        List<Emp> empList;
        if (empKey == null){
        	empList = empService.loadEmp();//��ȡ�����û���Ϣ
        }else {
        	empList = empService.searchEmp(empKey);//��ȡ�����û���Ϣ
        }
        PageInfo<Emp> pageInfo=new PageInfo<Emp>(empList);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("roleInfo", roleService.loadRole());
    	Emp updateInfo = empService.selectById(empId);
    	map.addAttribute("updateInfo", updateInfo);
        return "emp";
    }
    
    @RequestMapping(value="/emp-update1",method=RequestMethod.POST)
    public String empUpdate1(ModelMap map,Emp emp,String empWorktime1,String empBirthtime1){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
			emp.setEmpBirthtime(sdf.parse(empBirthtime1));
			emp.setEmpWorktime(sdf.parse(empWorktime1));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	empService.updateEmp1(emp);
		
        return "redirect:emp";
    }
    
    @RequestMapping(value="/info",method=RequestMethod.GET)
    public String info(ModelMap map,HttpSession httpsession){
        map.addAttribute("roleInfo", roleService.loadRole());
        Emp emp = (Emp)httpsession.getAttribute("emp");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String Birthtime = sdf.format(emp.getEmpBirthtime());
		String Worktime = sdf.format(emp.getEmpWorktime());
		emp.setBirthtime(Birthtime);
		emp.setWorktime(Worktime);
		httpsession.setAttribute("emp", emp);
        return "info";
    }
    
    @RequestMapping(value="/info-update",method=RequestMethod.POST)
    public String infoUpdate(@RequestParam("img") MultipartFile files, HttpServletRequest request, ModelMap map,Emp emp,String empWorktime1,String empBirthtime1,HttpSession httpsession){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
			emp.setEmpBirthtime(sdf.parse(empBirthtime1));
			emp.setEmpWorktime(sdf.parse(empWorktime1));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	empService.updateEmp(request, emp, files);
    	Emp newEmp = empService.selectById(emp.getEmpId());
    	httpsession.setAttribute("emp", newEmp);
        return "redirect:info";
    }
    
    @RequestMapping(value="/emp-search",method=RequestMethod.GET)
    public String empSearch(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,EmpKey empKey,HttpSession httpSession){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<Emp> empList = empService.searchEmp(empKey);//��ȡ�����û���Ϣ
        PageInfo<Emp> pageInfo=new PageInfo<Emp>(empList);
        httpSession.setAttribute("empKey", empKey);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("roleInfo", roleService.loadRole());
        return "emp";
    }
    
    @RequestMapping(value="/pwd-update",method=RequestMethod.POST)
    public String pwdUpdate(ModelMap map,HttpSession httpsession,String empPwd,String empPwdc,String oldPwd){
    	String errorMsg = "";
    	Emp emp = (Emp)httpsession.getAttribute("emp");
    	System.out.println(oldPwd);
    	System.out.println(emp.getEmpPwd());
    	if(oldPwd.equals(emp.getEmpPwd())){
    		errorMsg = "密码修改成功";
    	}else{
    		errorMsg = "原密码错误";
    	}
    	if(empPwd.equals(empPwdc)==false){
    		errorMsg = "新密码不一致";
    	}
    	if(errorMsg == "密码修改成功"){
    		emp.setEmpPwd(empPwd);
        	empService.pwdEmp(emp);
    		httpsession.removeAttribute("emp");
    		map.addAttribute("errorMsg", errorMsg);
    		return "login";
    	}else{
    		map.addAttribute("errorMsg", errorMsg);
    		return "pwd";
    	}
    		
    }
    
    @RequestMapping(value="/pwd",method=RequestMethod.GET)
    public String pwdUpdate(){
    	return "pwd";
    		
    }
}
