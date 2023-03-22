package com.spring.app.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;

@Repository
public class StoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체 매장 개수
	public int countAll() {
		return sqlSession.selectOne("store.countAll");
	}	
	
	//지역별 매장 개수
	public int countAllByArea(String area) {
		return sqlSession.selectOne("store.countAllByArea", area);
	}
	
	//매장목록
	public List<Store> selectAll(Pagenation pagenation) {
		List<Store> stores = sqlSession.selectList("store.selectAll", pagenation);
		return stores;
	}
	
	//지역별 매장목록
	public List<Store> selectAllByArea(Map<String, Object> params) {
		List<Store> stores = sqlSession.selectList("store.selectAllByArea", params);
		return stores;
	}	
	
	//매장조회
	public Store selectOne(int id) {
		Store store = sqlSession.selectOne("store.selectOne", id);
		return store;
	}
	
	//매장등록
	public int insertOne(Store store) {
		int result = sqlSession.insert("store.insertOne", store);
		return result;
	}
	
	//매장정보수정
	public int updateOne(Store store) {
		int result = sqlSession.update("store.updateOne", store);
		return result;
	}	
	
	//매장삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("store.deleteOne", id);
		return result;
	}
	
}
