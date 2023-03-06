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
		return "home.index";
	}
	
	//로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "home.login";
	}
	
	//약관동의 페이지
	@GetMapping("/agree")
	public String agree() {
		return "home.agree";
	}
	
	//회원가입 페이지
	@GetMapping("/register")
	public String register() {
		return "home.register";
	}
	
	//마이 페이지 & 개인정보 페이지
	@GetMapping({"/user", "/userinfo"})
	public String userInfo() {
		return "home.userinfo";
	}	
	
	//개인 주문내역 페이지
	@GetMapping("/userorders")
	public String userOrders() {
		return "home.userorders";
	}	

	//개인 문의내역 페이지
	@GetMapping("/userqnas")
	public String userQnas() {
		return "home.userqnas";
	}	
	
	//상품 페이지
	@GetMapping("/products")
	public String products() {
		return "home.products";
	}
	
	//장바구니
	@GetMapping("/cart")
	public String cart() {
		return "home.cart";
	}
	
	//고객서비스 페이지 & 공지사항 페이지
	@GetMapping({"/customer", "/notices"})
	public String customer() {
		return "home.notices";
	}
	
	//QnA 페이지
	@GetMapping("/qnas")
	public String qna() {
		return "home.qnas";
	}
	
	//QnA 글쓰기 페이지
	@GetMapping("/writeqna")
	public String writeQna() {
		return "home.writeqna";
	}
	
}
