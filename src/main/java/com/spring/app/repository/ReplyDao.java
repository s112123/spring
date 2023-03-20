package com.spring.app.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Reply;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//전체댓글수
	public int countAll(int bid) {
		return sqlSession.selectOne("reply.countAll", bid);
	}
	
	//전체댓글목록
	public List<Reply> selectAllByBoardId(Map<String, Object> map) {
		List<Reply> replies = sqlSession.selectList("reply.selectAllByBoardId", map);
		return replies;
	}
	
	//댓글 등록
	public int insertOne(Reply reply) {
		int result = sqlSession.insert("reply.insertOne", reply);	
		return result;
	}
	
	//댓글 삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("reply.deleteOne", id);	
		return result;
	}
	
}
