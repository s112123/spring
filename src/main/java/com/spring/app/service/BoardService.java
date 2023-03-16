package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Board;
import com.spring.app.entity.Pagenation;

public interface BoardService {
	
	//전체 글 개수
	public int getTotalBoards();	
	
	//전체글목록
	public List<Board> getBoards(Pagenation pagenation);

	//글 보기
	public Board getBoardById(int id);
	
	//글 등록
	public void insertBoard(Board board);
	
	//글 수정
	public void updateBoard(Board board);
	
	//글 조회수 수정
	public void updateBoardForHits(Board board);	
	
	//글 삭제
	public void deleteBoard(int id);

}
