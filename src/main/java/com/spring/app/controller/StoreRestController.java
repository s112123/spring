package com.spring.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;
import com.spring.app.service.StoreService;

@RestController
@RequestMapping("/api/store")
public class StoreRestController {
	
	Logger log = LoggerFactory.getLogger(StoreRestController.class);
	
	@Autowired
	private StoreService storeService;
	
	//매장목록
	@GetMapping("/list/{area}/{page}")
	public Map<String, Object> listStore(@PathVariable("area") String area, @PathVariable("page") int page) {
		//스토어 목록 조회
		Pagenation pagenation = new Pagenation();
		int total = storeService.getTotalStoresByArea(area);
		pagenation.setSize(5);
		pagenation.setPage(page);
		pagenation.setTotal(total);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("area", area);
		params.put("pagenation", pagenation);	
		List<Store> stores = storeService.getStoresByArea(params);
		
		//결과 데이터 넘김
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("stores", stores);
		result.put("pagenation", pagenation);	
		
		return result;
	}	
	
	/* ----- ADMIN PAGE ---- */
	//매장보기
	@GetMapping("/view/{id}")
	public Map<String, Object> viewStore(@PathVariable("id") int id) {
		Store store = storeService.getStore(id);

		//전송 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "success");
		resultMap.put("store", store);
		
		return resultMap;
	}
	
	//매장등록
	@PostMapping("/insert")
	public Map<String, Object> insertStore(Store store, @RequestParam(value="attached", required=false) MultipartFile attachedFile) {
		storeService.insertStore(store, attachedFile);
		
		//전송 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "inserted");
		
		return resultMap;
	}
	
	//매장정보수정
	@PostMapping("/update")
	public Map<String, Object> updateStore(Store store, @RequestParam(value="attached", required=false) MultipartFile attachedFile) {	
		storeService.updateStore(store, attachedFile);	
		
		//전송 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "updated");		

		return resultMap;
	}
	
	//매장삭제
	@GetMapping("/delete/{id}")
	public Map<String, Object> delete(@PathVariable("id") int id) {
		storeService.deleteStore(id);
		
		//전송 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "deleted");		

		return resultMap;
	}
	
}
