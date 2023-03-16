package com.spring.app.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Board;
import com.spring.app.entity.Order;

@Repository
public class MyPageDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//전체 글 개수
	public int countAllMyBoards(String email) {
		return sqlSession.selectOne("mypage.countAllMyBoards", email);
	}	
	
	//전체 주문 개수
	public int countAllMyOrders(String email) {
		return sqlSession.selectOne("mypage.countAllMyOrders", email);
	}
	
	//주문목록조회
	public List<Order> selectAllMyOrdersByEmail(Map<String, Object> map) {
		List<Order> orders = sqlSession.selectList("mypage.selectAllMyOrdersByEmail", map);	
		return orders;
	}
	
	//글목록조회
	public List<Board> selectAllMyBoardsByEmail(Map<String, Object> map) {
		List<Board> boards = sqlSession.selectList("mypage.selectAllMyBoardsByEmail", map);	
		return boards;
	}
	
	
}
