package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Order;
import com.spring.app.entity.OrderProduct;
import com.spring.app.entity.Pagenation;

@Repository
public class OrderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
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
	public List<OrderProduct> selectAllByCode(String code) {
		List<OrderProduct> orderProducts = sqlSession.selectList("order.selectAllByCode", code);
		return orderProducts;
	}
	
	//주문조회
	public Order selectOneByCode(String code) {
		Order order = sqlSession.selectOne("order.selectOneByCode", code);
		return order;
	}
	
	//주문등록
	public int insertOne(Order order) {
		int result = sqlSession.insert("order.insertOne", order);
		return result;
	}
	
	//주문내역등록
	public int insertProductForOneOrder(OrderProduct orderProduct) {
		int result = sqlSession.insert("order.insertProductForOneOrder", orderProduct);
		return result;
	}
	
	//주문삭제
	public int deleteOrder(int id) {
		int result = sqlSession.delete("order.deleteOrder", id);
		return result;
	}
	
}
