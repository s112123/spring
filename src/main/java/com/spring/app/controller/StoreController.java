package com.spring.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;
import com.spring.app.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	Logger log = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreService storeService;	
	
	//스토어 페이지
	@GetMapping
	public String store(Model model, Pagenation pagenation, String area) {
		
		if(area == null || area.trim().equals("")) {
			area = "서울";
		}
		
		int total = storeService.getTotalStoresByArea(area);
		pagenation.setSize(5);
		pagenation.setTotal(total);
		log.info(pagenation.toString());
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("area", area);
		params.put("pagenation", pagenation);
		
		
		List<Store> stores = storeService.getStoresByArea(params);
		model.addAttribute("stores", stores);
		model.addAttribute("pagenation", pagenation);
		
		return "home.store.list";
	}
	
	//매장목록
	@GetMapping("/list")
	public String list(Model model, Pagenation pagenation) {
		int total = storeService.getTotalStores();
		pagenation.setTotal(total);
		List<Store> stores = storeService.getStores(pagenation);
		
		model.addAttribute("stores", stores);
		model.addAttribute("pagenation", pagenation);		
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
