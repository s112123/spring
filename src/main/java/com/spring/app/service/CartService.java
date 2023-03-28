package com.spring.app.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.app.entity.Cart;

public interface CartService {

	//전체목록
	public List<Cart> getItemsInCartByEmail(HttpSession session);
	
	//일괄목록: 선택된 목록을 조회
	public List<Cart> getItemsByIds(int[] ids);
	
	//상품번호와 이메일로 조회
	public Cart getItemByPidAndEamil(Map<String, Object> map);
	
	//장바구니 추가
	public void insertItemInCart(Cart cart);

	//수량수정
	public void updateItemForQty(Integer id, Integer qty);
	
	//개별삭제
	public void deleteItemInCart(int id);
	
	//일괄삭제
	public void deleteItemsInCart(int[] ids);
	
}
