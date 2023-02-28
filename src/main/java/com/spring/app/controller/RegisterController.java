package com.spring.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegisterController {
	
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
	
}
