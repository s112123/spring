package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Product;
import com.spring.app.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	//전체목록수
	@Override
	public int getTotalProducts() {
		return productRepository.countAll();
	}
	
	//전체상품목록
	@Override
	public List<Product> getProducts(Pagenation pagenation) {
		List<Product> products = productRepository.selectAll(pagenation);
		return products;
	}
	
	//전체상품목록: 카테고리별
	@Override
	public List<Product> getProductsByCategory(String category) {
		List<Product> products = productRepository.selectAllByCategory(category);
		return products;
	}
	
	//상품정보
	@Override
	public Product getProductById(int id) {
		Product product = productRepository.selectOneById(id);
		return product;
	}
	
	//상품등록
	@Override
	public void insertProduct(Product product) {
		productRepository.insertOne(product);
	}
	
	//상품수정
	@Override
	public void updateProduct(Product product) {
		productRepository.updateOne(product);
	}
	
	//상품삭제
	@Override
	public void deleteProduct(int id) {
		productRepository.deleteOne(id);
	}
	
}
