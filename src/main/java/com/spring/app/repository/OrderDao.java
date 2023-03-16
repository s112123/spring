package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Order;
import com.spring.app.entity.OrderDetail;
import com.spring.app.entity.Pagenation;

@Repository
public class OrderDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//전체회원수
	public int countAll() {
		return sqlSession.selectOne("order.countAll");
	}
	
	//전체주문목록
	public List<Order> selectAllByEmail(Pagenation pagenation) {
		List<Order> orders = sqlSession.selectList("order.selectAllByEmail", pagenation);
		return orders;
	}
	
	//주문상품목록
	public List<OrderDetail> selectAllByCode(String code) {
		List<OrderDetail> orderProducts = sqlSession.selectList("order.selectAllByCode", code);
		return orderProducts;
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
