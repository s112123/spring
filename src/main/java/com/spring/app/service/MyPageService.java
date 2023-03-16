package com.spring.app.service;

import java.util.List;
import java.util.Map;

import com.spring.app.entity.Board;
import com.spring.app.entity.Order;

public interface MyPageService {

	//전체 주문 수
	public int getTotalMyOrders(String email);
	
	//전체 글 개수
	public int getTotalMyBoards(String email);
	
	//주문목록조회
	public List<Order> getMyOrdersByEmail(Map<String, Object> map);
	
	//글목록조회
	public List<Board> getMyBoardsByEmail(Map<String, Object> map);
	
}
