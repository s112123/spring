package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Cart;
import com.spring.app.repository.CartDao;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDao cartDao;
	
	//전체목록
	@Override
	public List<Cart> getItemsInCartByEmail(String email) {
		List<Cart> cart = cartDao.selectAllByEmail(email);
		return cart;
	}
	
	//일괄목록: 선택된 상품만 목록으로 추출
	@Override
	public List<Cart> getItemsById(int[] ids) {
		List<Cart> cart = cartDao.selectAllById(ids);
		return cart;
	}
	
	//장바구니 추가
	@Override
	public void insertItemInCart(Cart cart) {
		cartDao.insertOne(cart);
	}
	
	//수량수정
	@Override
	public void updateItemForQty(Cart cart) {
		cartDao.updateOneForQty(cart);	
	}
	
	//개별삭제
	@Override
	public void deleteItemInCart(int id) {
		cartDao.deleteOne(id);
	}
	
	//일괄삭제
	@Override
	public void deleteItemsInCart(int[] ids) {
		cartDao.deleteAllById(ids);
	}
	
}
