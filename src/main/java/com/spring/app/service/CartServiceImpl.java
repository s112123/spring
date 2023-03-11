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
	public List<Cart> getItemsInCartByEmail(String email) {
		List<Cart> cart = cartRepository.selectAllByEmail(email);
		return cart;
	}
	
	//수량수정
	@Override
	public void updateItemForQty(Cart cart) {
		cartRepository.updateOneForQty(cart);	
	}
	
	//개별삭제
	public void deleteItemInCart(int id) {
		cartRepository.deleteOne(id);
	}
	
	//일괄삭제
	@Override
	public void deleteItemsInCart(String[] ids) {
		cartRepository.deleteAllById(ids);
	}
	
}
