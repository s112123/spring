package com.spring.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	StoreService storeService;	
	
	//스토어 페이지
	@GetMapping
	public String store() {
		return "home.store.list";
	}
	
	//매장목록
	@GetMapping("/list")
	public String list() {
		return "admin.store.list";
	}
	
	//매장조회
	@GetMapping("/view")
	public String view(Model model, int id) {
		model.addAttribute("id", id);
		return "admin.store.view";
	}
	
	//매장등록
	@GetMapping("/write")
	public String storeForm() {
		return "admin.store.write";
	}
	
}
