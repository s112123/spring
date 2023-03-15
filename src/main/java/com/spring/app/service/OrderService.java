package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Order;
import com.spring.app.entity.OrderDetail;

public interface OrderService {
	
	//주문목록
	public List<Order> getOrdersByEmail(String email);

	//주문등록
	public void insertOrder(Order order);
	
	//주문내역등록
	public void insertDetailForOneOrder(OrderDetail orderDetail);
	
}
