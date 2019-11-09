package com.royaltea.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import com.royaltea.pojo.Desk;
import com.royaltea.service.DeskService;


@Controller
public class DeskController {
	
	@Autowired
	private DeskService deskService;
    

    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/desk",method=RequestMethod.GET)
    public String pageList(ModelMap map){
        List<Desk> deskList = deskService.loadDesk();//��ȡ�����û���Ϣ
        map.addAttribute("deskList", deskList);return "/desk";
    }
    
    @RequestMapping(value="/desk-add",method=RequestMethod.POST)
    public String pageList(ModelMap map,Desk desk){
    	String errorMsg;
    	try {
			deskService.addDesk(desk);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorMsg = "餐桌号已存在！";
			map.addAttribute("errorMsg", errorMsg);
		}
    	List<Desk> deskList = deskService.loadDesk();
    	map.addAttribute("deskList", deskList);
        return "desk";
    }
    
    @RequestMapping(value="/desk-delete",method=RequestMethod.POST)
    @ResponseBody
    public String deskDelete(Integer dId){
    	int i = deskService.deleteDesk(dId);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/desk-update",method=RequestMethod.GET)
    public String deskUpdate(ModelMap map,Integer dId){
        List<Desk> deskList = deskService.loadDesk();//��ȡ�����û���Ϣ
    	Desk updateInfo = deskService.selectById(dId);
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
//    	long dateTime = updateInfo.getdTime().getTime();
    	updateInfo.setdTimes(sdf.format(updateInfo.getdTime()));
    	updateInfo.setdTimes1(sdf1.format(updateInfo.getdTime()));
    	map.addAttribute("deskList", deskList);
    	map.addAttribute("updateInfo", updateInfo);
        return "desk";
    }
    
    @RequestMapping(value="/desk-update1",method=RequestMethod.POST)
    public String empUpdate1(Desk desk){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");
    	try {
			Date date = sdf.parse(desk.getdTimes());
			Date date1 = sdf1.parse(desk.getdTimes1());
			Date newDate = new Date(date.getTime()+date1.getTime());
			desk.setdTime(newDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	deskService.updateDesk(desk);
		
        return "redirect:desk";
    }
    
    @RequestMapping(value="/desk-deletePlan",method=RequestMethod.GET)
    public String deskDeletePlan(ModelMap map,Integer dId){
        
    	deskService.deletePlan(dId);
    	List<Desk> deskList = deskService.loadDesk();//��ȡ�����û���Ϣ
    	map.addAttribute("deskList", deskList);
        return "desk";
    }
    
    @RequestMapping(value="/desk-showQR",method=RequestMethod.POST)
    @ResponseBody
    public String deskShowQR(Integer dId, String host, HttpServletRequest request){
    	String url = "http://royaltea.hzryxx.cn/shop?dId="+dId;
        String path = request.getSession().getServletContext().getRealPath("/")+ "upload/";
        String fileName = dId+".jpg";
        deskService.createQrCode(url, path, fileName);
        return fileName;
    }
}
