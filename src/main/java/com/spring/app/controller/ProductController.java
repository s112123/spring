package com.spring.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

	//상품 페이지
	@GetMapping("/product")
	public String productGET() {
		return "home.product.productlist";
	}
	
}
