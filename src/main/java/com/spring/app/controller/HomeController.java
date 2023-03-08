package com.spring.app.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	//메인 페이지
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	//개인정보 페이지
	@GetMapping("/my/infomation")
	public String member() {
		return "home.member.member";
	}	
	
	//개인 주문내역 페이지
	@GetMapping("/my/orders")
	public String memberOrders() {
		return "home.member.orders";
	}	

	//개인 문의내역 페이지
	@GetMapping("/my/qnas")
	public String memberQnas() {
		return "home.member.qnas";
	}	

	//장바구니
	@GetMapping("/my/cart")
	public String memberCart() {
		return "home.member.cart";
	}
	
	//상품 페이지
	@GetMapping("/products")
	public String products() {
		return "home.product.products";
	}
	
	
	//QnA 페이지
	@GetMapping("/qnas")
	public String qnas() {
		return "home.customer.qna.qnas";
	}
	
}
