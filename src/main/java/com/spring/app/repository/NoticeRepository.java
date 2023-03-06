package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;

@Repository
public class NoticeRepository {

	@Autowired
	private SqlSession sqlSession;
	
	//전체 글 개수
	public int countAll() {
		return sqlSession.selectOne("notice.countAll");
	}
	
	//전체목록
	public List<Notice> selectAll(Pagenation pagenation) {
		List<Notice> notices = sqlSession.selectList("notice.selectAll", pagenation);
		return notices;
	}
	
	//등록
	public int insertOne(Notice notice) {
		int result = sqlSession.insert("notice.insertOne", notice);
		return result;
	}
	
	//상세보기: id
	public Notice selectOneById(int id) {
		Notice notice = sqlSession.selectOne("notice.selectOneById", id);
		return notice;
	}
	
	//수정: 구분, 제목, 내용
	public int updateOne(Notice notice) {
		int result = sqlSession.update("notice.updateOne", notice);
		return result;
	}
	
	//수정: 조회수
	public int updateOneForHits(Notice notice) {
		int result = sqlSession.update("notice.updateOneForHits", notice);
		return result;
	}
	
	//삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("notice.deleteOne", id);
		return result;
	}
	
}
