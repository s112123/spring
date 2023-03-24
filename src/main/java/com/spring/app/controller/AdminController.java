package com.spring.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	//관리자 페이지
	@GetMapping("/admin")
	public String admin() {
		return "redirect:/member/list";
	}
	
}
