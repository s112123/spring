package com.spring.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LogoutController {

	//๋ก๊ทธ์์
	@GetMapping("/logout")
	public String logoutGET(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
