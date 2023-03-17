package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;
import com.spring.app.repository.StoreDao;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao storeDao;
	
	//전체 글 개수
	@Override
	public int getTotalStores() {
		return storeDao.countAll();
	}
	
	//매장목록
	@Override
	public List<Store> getStores(Pagenation pagenation) {
		List<Store> stores = storeDao.selectAll(pagenation);
		return stores;
	}
	
	//매장조회
	@Override
	public Store getStore(int id) {
		Store store = storeDao.selectOne(id);
		return store;
	}
	
	//매장등록
	@Override
	public void insertStore(Store store) {
		storeDao.insertOne(store);
	}
	
	//매장정보수정
	@Override
	public void updateStore(Store store) {
		storeDao.updateOne(store);
	}
	
	//매장삭제
	@Override
	public void deleteStore(int id) {
		storeDao.deleteOne(id);
	}

}
