package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Order;
import com.spring.app.entity.OrderDetail;

@Repository
public class OrderDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//주문목록
	public List<Order> selectAllByEmail(String email) {
		List<Order> orders = sqlSession.selectList("order.selectAllByEmail", email);
		return orders;
	}
	
	//주문등록
	public int insertOne(Order order) {
		int result = sqlSession.insert("order.insertOne", order);
		return result;
	}
	
	//주문내역등록
	public int insertDetailForOneOrder(OrderDetail orderDetail) {
		int result = sqlSession.insert("order.insertDetailForOneOrder", orderDetail);
		return result;
	}
	
}
