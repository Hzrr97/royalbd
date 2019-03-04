package com.royaltea.service.impl;

import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.druid.sql.visitor.functions.Length;
import com.royaltea.dao.OrderMapper;
import com.royaltea.pojo.Order;
import com.royaltea.pojo.OrderInfo;
import com.royaltea.pojo.OrderKey;
import com.royaltea.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper orderMapper;

    public OrderMapper getOrderMapper() {
        return orderMapper;
    }
    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }
	@Override
	public List<Order> loadOrder() {
		// TODO Auto-generated method stub
		
		List<Order> list = orderMapper.queryAll();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
        BigDecimal b = new BigDecimal("10.0");
		for(Order order : list) {
			List<OrderInfo> oiList = orderMapper.queryOi(order.getoId());
			for (OrderInfo oi : oiList) {
				oi.setfDprice(oi.getfPrice().multiply(oi.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
				
			}
			order.setOiList(oiList);
			String dec = order.getoDec();
			if(dec != null) {
				if(dec.length()>20) {
					String newString = order.getoDec().substring(0, 20);
					newString = newString + "...";
					order.setoDec(newString);
				}
			}
			order.setoTimes(sdf.format(order.getoTime()));
			
		}
		return list;
	}
	
	@Override
	public int updateStatus (String orderId, Integer status) {
		try {
			orderMapper.updateStatus(orderId,status);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	
	@Override
	public int deleteOrder(String orderId) {
		try {
			orderMapper.deleteOiById(orderId);
			orderMapper.deleteById(orderId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	@Override
	public Order selectById(String orderId) {
		// TODO Auto-generated method stub
		Order order =  orderMapper.selectById(orderId);
//		BigDecimal b = new BigDecimal("10.0");
//		order.setfDprice(order.getfPrice().multiply(order.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
		return order;
	}
	
	@Override
	public void updateOrder1(Order order) {
		// TODO Auto-generated method stub
		orderMapper.update(order);
	}

	@Override
	public void updateOrder(HttpServletRequest request, Order order, MultipartFile file) {
		// TODO Auto-generated method stub
//		if (file.getSize()>= 1) {
//            try {
//                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
//                // )
//            	String fileName = (int)(1+Math.random()*(10-1+1)) +file.getOriginalFilename();
//                String filePath = request.getSession().getServletContext()
//                        .getRealPath("/")
//                        + "upload/" + fileName;
//                System.out.println(filePath);
//                File saveDir = new File(filePath);
//                if (!saveDir.getParentFile().exists())
//                    saveDir.getParentFile().mkdirs();
//
//                // 转存文件
//                file.transferTo(saveDir);
//                order.setfImg(fileName);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
		orderMapper.update(order);
	}
	@Override
	public List<Order> searchOrder(OrderKey orderKey) {
		// TODO Auto-generated method stub
		
		List<Order> list = orderMapper.queryKey(orderKey);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
        BigDecimal b = new BigDecimal("10.0");
		for(Order order : list) {
			List<OrderInfo> oiList = orderMapper.queryOi(order.getoId());
			for (OrderInfo oi : oiList) {
				oi.setfDprice(oi.getfPrice().multiply(oi.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
				
			}
			order.setOiList(oiList);
			String dec = order.getoDec();
			if(dec != null) {
				if(dec.length()>20) {
					String newString = order.getoDec().substring(0, 20);
					newString = newString + "...";
					order.setoDec(newString);
				}
			}
			order.setoTimes(sdf.format(order.getoTime()));
			
		}
		return list;
	}
	
	

}
