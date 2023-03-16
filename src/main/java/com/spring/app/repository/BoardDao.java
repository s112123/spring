package com.spring.app.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.app.entity.Board;
import com.spring.app.entity.Pagenation;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//전체 글 개수
	public int countAll() {
		return sqlSession.selectOne("board.countAll");
	}	
	
	//전체글목록
	public List<Board> selectAll(Pagenation pagenation) {
		List<Board> boards = sqlSession.selectList("board.selectAll", pagenation);
		return boards;
	}
	
	//글 보기
	public Board selectOneById(int id) {
		Board board = sqlSession.selectOne("board.selectOneById", id);
		return board;
	}	
	
	//글 등록
	public int insertOne(Board board) {
		int result = sqlSession.insert("board.insertOne", board);
		return result;
	}
	
	//글 수정
	public int updateOne(Board board) {
		int result = sqlSession.update("board.updateOne", board);
		return result;
	}
	
	//글 조회수 수정
	public int updateOneForHits(Board board) {
		int result = sqlSession.update("board.updateOneForHits", board);
		return result;
	}	
	
	//글 삭제
	public int deleteOne(int id) {
		int result = sqlSession.delete("board.deleteOne", id);
		return result;
	}
	
}
