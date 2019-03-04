package com.royaltea.dao;

import java.util.List;

import com.royaltea.pojo.Order;
import com.royaltea.pojo.OrderInfo;
import com.royaltea.pojo.OrderKey;

public interface OrderMapper {
	/**
	 * ��ѯ
	 */
	List<Order> queryAll();

	List<OrderInfo> queryOi(String oId);
	
	void add(Order f);

	Order selectById(String oId);

	void deleteById(String oId);

	void update(Order f);

	List<Order> queryKey(OrderKey orderKey);

	void updateStatus(String orderId, Integer status);

	void deleteOiById(String orderId);

}
