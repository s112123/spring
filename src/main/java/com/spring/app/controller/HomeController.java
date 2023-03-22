package com.spring.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	//메인 페이지
	@GetMapping({"/", "/index"})
	public String main() {
		return "index";
	}
	
}
