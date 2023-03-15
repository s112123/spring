package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Cart;

@Repository
public class CartDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//전체목록
	public List<Cart> selectAllByEmail(String email) {
		List<Cart> cart = sqlSession.selectList("cart.selectAllByEmail", email);
		return cart;
	}
	
	//일괄조회
	public List<Cart> selectAllById(int[] ids) {
		List<Cart> cart = sqlSession.selectList("cart.selectAllById", ids);
		return cart;
	}
	
	//장바구니 추가
	public int insertOne(Cart cart) {
		int result = sqlSession.insert("cart.insertOne", cart);
		return result;
	}
	
	//수량수정
	public int updateOneForQty(Cart cart) {
		int result = sqlSession.update("cart.updateOneForQty", cart);
		return result;
	}
	
	//개별삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("cart.deleteOne", id);
		return result;
	}
	
	//일괄삭제
	public int deleteAllById(int[] ids) {
		int result = sqlSession.delete("cart.deleteAllById", ids);
		return result;
	}
	
}
