package com.spring.app.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;

public interface StoreService {
	
	//전체 글 개수
	public int getTotalStores();
	
	//매장목록
	public List<Store> getStores(Pagenation pagenation);
	
	//매장조회
	public Store getStore(int id);
	
	//매장등록
	public void insertStore(Store store, MultipartFile attachedFile);
	
	//매장정보수정
	public void updateStore(Store store, MultipartFile attachedFile);
	
	//매장삭제
	public void deleteStore(int id);
	
}
