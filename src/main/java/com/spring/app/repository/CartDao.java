package com.spring.app.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Cart;

@Repository
public class CartDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체목록
	public List<Cart> selectAllByEmail(String email) {
		List<Cart> cart = sqlSession.selectList("cart.selectAllByEmail", email);
		return cart;
	}
	
	//일괄조회
	public List<Cart> selectAllByIds(int[] ids) {
		List<Cart> cart = sqlSession.selectList("cart.selectAllByIds", ids);
		return cart;
	}
	
	//상품번호와 이메일로 조회
	public Cart selectOneByPidAndEmail(Map<String, Object> map) {
		Cart cart = sqlSession.selectOne("cart.selectOneByPidAndEmail", map);
		return cart;
	}
	
	//장바구니 추가
	public int insertOne(Cart cart) {
		int result = sqlSession.insert("cart.insertOne", cart);
		return result;
	}
	
	//수량수정
	public int updateOneForQty(Map<String, Integer> map) {
		int result = sqlSession.update("cart.updateOneForQty", map);
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
