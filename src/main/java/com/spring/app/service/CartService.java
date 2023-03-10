package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Cart;

public interface CartService {

	//전체목록
	public List<Cart> getCartByEmail(String email);
	
	//수량수정
	public void modifyCartForQty(Cart cart);
	
	//제품삭제
	public void removeCart(int id);
	
}
