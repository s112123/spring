package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Product;

public interface ProductService {
	
	//전체목록수
	public int getTotalProducts();
	
	//전체상품목록
	public List<Product> getAllProducts(Pagenation pagenation);
	
	//상품정보
	public Product getProductById(int id);
	
	//상품등록
	public void insertProduct(Product product);
	
	//상품수정
	public void updateProduct(Product product);
	
	//상품삭제
	public void deleteProduct(int id);
	
}
