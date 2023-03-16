package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Order;
import com.spring.app.entity.OrderDetail;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;
	
	//전체주문수
	@Override
	public int getTotalOrders() {
		return orderDao.countAll();
	}
	
	//전체주문목록
	@Override
	public List<Order> getOrdersByEmail(Pagenation pagenation) {
		List<Order> orders = orderDao.selectAllByEmail(pagenation);
		return orders;
	}
	
	//주문상품목록
	public List<OrderDetail> getOrderProductsByCode(String code) {
		List<OrderDetail> orderProducts = orderDao.selectAllByCode(code);
		return orderProducts;
	}
	
	//주문등록
	@Override
	public void insertOrder(Order order) {
		orderDao.insertOne(order);
	}
	
	//주문내역등록
	@Override
	public void insertDetailForOneOrder(OrderDetail orderDetail) {
		orderDao.insertDetailForOneOrder(orderDetail);
	}
	
	
}
