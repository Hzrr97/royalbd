package com.royaltea.controller;

import java.math.BigDecimal;
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
import com.royaltea.pojo.Desk;
import com.royaltea.pojo.Order;
import com.royaltea.pojo.OrderKey;
import com.royaltea.service.DeskService;
import com.royaltea.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private DeskService deskService;
    
    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/order",method=RequestMethod.GET)
    public String pageList(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpSession htttpSession){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        OrderKey orderKey = (OrderKey)htttpSession.getAttribute("orderKey");
        List<Order> orderList;
        if (orderKey == null){
        	orderList = orderService.loadOrder();//��ȡ�����û���Ϣ
        }else {
        	orderList = orderService.searchOrder(orderKey);//��ȡ�����û���Ϣ
        }
        PageInfo<Order> pageInfo=new PageInfo<Order>(orderList);
        List<Desk> deskInfo = deskService.loadDesk();
        map.addAttribute("deskInfo", deskInfo);
        map.addAttribute("pageInfo", pageInfo);
        return "order";
    }
    
    
    @RequestMapping(value="/ostatus-update",method=RequestMethod.POST)
    @ResponseBody
    public String orderDelete(String oId, Integer status){
    	int i = orderService.updateStatus(oId,status);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/order-delete",method=RequestMethod.POST)
    @ResponseBody
    public String orderDelete(String oId){
    	int i = orderService.deleteOrder(oId);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/order-update",method=RequestMethod.GET)
    public String orderUpdate(ModelMap map,String oId,Integer pageNo,HttpSession htttpSession){
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        OrderKey orderKey = (OrderKey)htttpSession.getAttribute("orderKey");
        List<Order> orderList;
        if (orderKey == null){
        	orderList = orderService.loadOrder();//��ȡ�����û���Ϣ
        }else {
        	orderList = orderService.searchOrder(orderKey);//��ȡ�����û���Ϣ
        }
        PageInfo<Order> pageInfo=new PageInfo<Order>(orderList);
        List<Desk> deskInfo = deskService.loadDesk();
        map.addAttribute("deskInfo", deskInfo);
        map.addAttribute("pageInfo", pageInfo);
    	Order updateInfo = orderService.selectById(oId);
    	map.addAttribute("updateInfo", updateInfo);
        return "order";
    }
    
    @RequestMapping(value="/order-update1",method=RequestMethod.POST)
    public String orderUpdate1(@RequestParam("img") MultipartFile files, HttpServletRequest request, ModelMap map,Order order){
    	
    	orderService.updateOrder(request, order, files);
		
        return "redirect:order";
    }
    
    
    @RequestMapping(value="/order-search",method=RequestMethod.GET)
    public String orderSearch(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,OrderKey orderKey,HttpSession httpSession){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<Order> orderList = orderService.searchOrder(orderKey);//��ȡ�����û���Ϣ
        PageInfo<Order> pageInfo=new PageInfo<Order>(orderList);
        httpSession.setAttribute("orderKey", orderKey);
        List<Desk> deskInfo = deskService.loadDesk();
        map.addAttribute("deskInfo", deskInfo);
        map.addAttribute("pageInfo", pageInfo);
        return "order";
    }
    
   
}
