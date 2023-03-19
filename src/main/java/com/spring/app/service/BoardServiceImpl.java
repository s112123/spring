package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Board;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;

	//전체 글 개수
	@Override
	public int getTotalBoards() {
		return boardDao.countAll();
	}	
	
	//전체글목록
	@Override
	public List<Board> getBoards(Pagenation pagenation) {
		List<Board> boards = boardDao.selectAll(pagenation);
		return boards;
	}
	
	//글 보기
	@Override
	public Board getBoardById(int id) {
		Board board = boardDao.selectOneById(id);
		return board;
	}
	
	//글 등록
	@Override
	public void insertBoard(Board board) {
		boardDao.insertOne(board);
	}
	
	//글 수정
	@Override
	public void updateBoard(Board board) {
		boardDao.updateOne(board);
	}
	
	//글 조회수 수정
	@Override
	public void updateBoardForHits(Board board) {
		boardDao.updateOneForHits(board);
	}
	
	//글 삭제
	@Override
	public void deleteBoard(int id) {
		boardDao.deleteOne(id);
	}

}
