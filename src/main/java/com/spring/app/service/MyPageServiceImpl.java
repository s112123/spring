package com.spring.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Board;
import com.spring.app.entity.Order;
import com.spring.app.repository.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;

	//전체 주문 수
	@Override
	public int getTotalMyOrders(String email) {
		return myPageDao.countAllMyOrders(email);
	}	
	
	//전체 글 개수
	@Override
	public int getTotalMyBoards(String email) {
		return myPageDao.countAllMyBoards(email);
	}	

	//주문목록조회
	@Override
	public List<Order> getMyOrdersByEmail(Map<String, Object> map) {
		List<Order> orders = myPageDao.selectAllMyOrdersByEmail(map);
		return orders;
	}
	
	//글목록조회
	@Override
	public List<Board> getMyBoardsByEmail(Map<String, Object> map) {
		List<Board> boards = myPageDao.selectAllMyBoardsByEmail(map);
		return boards;
	}
	
}
