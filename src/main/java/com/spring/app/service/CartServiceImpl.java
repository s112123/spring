package com.spring.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Cart;
import com.spring.app.entity.Member;
import com.spring.app.repository.CartDao;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	
	//전체목록
	@Override
	public List<Cart> getItemsInCartByEmail(HttpSession session) {
		Member member = (Member) session.getAttribute("login");
		List<Cart> cart = cartDao.selectAllByEmail(member.getEmail());
		return cart;
	}
	
	//일괄목록: 선택된 상품만 목록으로 추출
	@Override
	public List<Cart> getItemsByIds(int[] ids) {
		List<Cart> cart = cartDao.selectAllByIds(ids);
		return cart;
	}
	
	//상품번호와 이메일로 조회
	@Override
	public Cart getItemByPidAndEamil(Map<String, Object> map) {
		Cart cart = cartDao.selectOneByPidAndEmail(map);
		return cart;
	}
	
	//장바구니 추가
	@Override
	public void insertItemInCart(Cart cart) {
		cartDao.insertOne(cart);
	}
	
	//수량수정
	@Override
	public void updateItemForQty(Integer id, Integer qty) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		map.put("qty", qty);
		cartDao.updateOneForQty(map);	
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
