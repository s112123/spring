package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Cart;

@Repository
public class CartRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	//전체목록
	public List<Cart> selectAllByEmail(String email) {
		List<Cart> cart = sqlSession.selectList("cart.selectAllByEmail", email);
		return cart;
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
	public int deleteAllById(String[] ids) {
		int result = sqlSession.delete("cart.deleteAllById", ids);
		return result;
	}
	
}
