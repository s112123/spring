package com.spring.app.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@Value("#{serviceKey['api.key']}")
	private String apiKaKaoMapServiceKey;
	
	//메인 페이지
	@GetMapping({"/", "/index"})
	public String main(Model model) {
		model.addAttribute("apiKaKaoMapServiceKey", apiKaKaoMapServiceKey);
		return "index";
	}
	
}
