package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Cart;
import com.spring.app.repository.CartRepository;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartRepository cartRepository;
	
	//전체목록
	public List<Cart> getCartByEmail(String email) {
		List<Cart> cart = cartRepository.selectAllByEmail(email);
		return cart;
	}
	
	//수량수정
	@Override
	public void modifyCartForQty(Cart cart) {
		cartRepository.updateOneForQty(cart);	
	}
	
	//제품삭제
	public void removeCart(int id) {
		cartRepository.deleteOne(id);
	}
	
}
