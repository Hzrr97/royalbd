package com.royaltea.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.royaltea.pojo.Emp;
import com.royaltea.pojo.Role;
import com.royaltea.service.RoleService;

@Controller
public class RoleController {
	
	@Autowired
	private RoleService roleService;
    

    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/role",method=RequestMethod.GET)
    public String pageList(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<Role> roleList = roleService.loadRole();//��ȡ�����û���Ϣ
        PageInfo<Role> pageInfo=new PageInfo<Role>(roleList);
        map.addAttribute("pageInfo", pageInfo);return "/job";
    }
    
    @RequestMapping(value="/role-add",method=RequestMethod.POST)
    public String pageList(ModelMap map,Role role){
    	try {
			roleService.addRole(role);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "redirect:/role";
    }
    
    @RequestMapping(value="/role-delete",method=RequestMethod.POST)
    @ResponseBody
    public String roleDelete(Integer roleId){
    	int i = roleService.deleteRole(roleId);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/role-update",method=RequestMethod.GET)
    public String roleUpdate(ModelMap map,Integer roleId,Integer pageNo){
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<Role> roleList = roleService.loadRole();//��ȡ�����û���Ϣ
        PageInfo<Role> pageInfo=new PageInfo<Role>(roleList);
        map.addAttribute("pageInfo", pageInfo);
    	Role updateInfo = roleService.selectById(roleId);
    	map.addAttribute("updateInfo", updateInfo);
        return "job";
    }
    
    @RequestMapping(value="/role-update1",method=RequestMethod.POST)
    public String empUpdate1(ModelMap map,Role role){
    	
    	roleService.updateRole(role);
		
        return "redirect:role";
    }
}
