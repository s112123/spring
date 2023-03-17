package com.spring.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;
import com.spring.app.service.StoreService;

@RestController
@RequestMapping("/api/store")
public class StoreRestController {
	
	@Autowired
	StoreService storeService;
	
	//매장목록
	@GetMapping("/list")
	public List<Store> list(@RequestParam(value="page", required=false) String page, Pagenation pagenation) {
		//페이징 처리: 수정 중
		int total = storeService.getTotalStores();
		pagenation.setTotal(total);
		if (page == null) page = "1";
		pagenation.setPage(Integer.parseInt(page));
		
		List<Store> stores = storeService.getStores(pagenation);
		return stores;
	}
	
	//매장보기
	@GetMapping("/view/{id}")
	public Store view(@PathVariable("id") int id) {
		Store store = storeService.getStore(id);
		return store;
	}
	
	//매장등록
	@PostMapping("/insert")
	public String insert(@RequestBody Store store) {
		storeService.insertStore(store);
		return "success";
	}
	
	//매장정보수정
	@PostMapping("/update")
	public String update(@RequestBody Store store) {
		storeService.updateStore(store);
		return "success";
	}
		
	//매장삭제
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		storeService.deleteStore(id);
		return "success";
	}
	
	
}
