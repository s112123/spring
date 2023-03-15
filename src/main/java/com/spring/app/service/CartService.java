package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Cart;

public interface CartService {

	//전체목록
	public List<Cart> getItemsInCartByEmail(String email);
	
	//일괄목록: 선택된 목록을 조회
	public List<Cart> getItemsById(int[] ids);
	
	//장바구니 추가
	public void insertItemInCart(Cart cart);

	//수량수정
	public void updateItemForQty(Cart cart);
	
	//개별삭제
	public void deleteItemInCart(int id);
	
	//일괄삭제
	public void deleteItemsInCart(int[] ids);
	
}
