package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Product;

@Repository
public class ProductRepository {
	
	@Autowired
	SqlSession sqlSession;

	//전체목록수
	public int countAll() {
		return sqlSession.selectOne("product.countAll");
	}
	
	//전체상품목록
	public List<Product> selectAll(Pagenation pagenation) {
		List<Product> products = sqlSession.selectList("product.selectAll", pagenation);
		return products;
	}
	
	//상품정보
	public Product selectOneById(int id) {
		Product product = sqlSession.selectOne("product.selectOneById", id);
		return product;
	}
	
	//상품등록
	public int insertOne(Product product) {
		int result = sqlSession.insert("product.insertOne", product);
		return result;
	}
	
	//상품수정
	public int updateOne(Product product) {
		int result = sqlSession.update("product.updateOne", product);
		return result;
	}
	
	//상품삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("product.deleteOne", id);
		return result;
	}
	
}