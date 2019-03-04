package com.royaltea.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.royaltea.pojo.Order;
import com.royaltea.pojo.OrderKey;

public interface OrderService {
	/**
     * ����ȫ����person
     * @return
     */
    List<Order> loadOrder();

	int deleteOrder(String orderId);

	Order selectById(String orderId);
	
	void updateOrder1(Order order);

	void updateOrder(HttpServletRequest request, Order order, MultipartFile file);

	List<Order> searchOrder(OrderKey orderKey);

	int updateStatus(String oId, Integer status);


}
