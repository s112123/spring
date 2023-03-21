package com.spring.app.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.app.entity.Board;
import com.spring.app.entity.LinkParam;
import com.spring.app.entity.Pagenation;

public interface BoardService {
	
	//전체 글 개수
	public int getTotalBoards(Map<String, Object> params);	
	
	//전체글목록
	public List<Map<String, Object>> getBoards(Pagenation pagenation, LinkParam linkParam);	
	
	//글 보기
	public Board getBoardById(int id);
	
	//글 등록
	public String insertBoard(HttpSession session, Board board);
	
	//글 수정
	public String updateBoard(Board board, Pagenation pagenation, LinkParam linkParam);
	
	//글 조회수 수정
	public void updateBoardForHits(Board board);	
	
	//글 삭제
	public String deleteBoard(int id, Pagenation pagenation, LinkParam linkParam);

}
