package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Order;
import com.spring.app.entity.OrderProduct;
import com.spring.app.entity.Pagenation;

public interface OrderService {
	
	//전체주문수
	public int getTotalOrders();
	
	//전체주문목록
	public List<Order> getOrdersByEmail(Pagenation pagenation);

	//주문상품목록
	public List<OrderProduct> getOrderProductsByCode(String code);
	
	//주문등록
	public void insertOrder(Order order);
	
	//주문내역등록
	public void insertProductForOneOrder(OrderProduct orderProduct);
	
}
