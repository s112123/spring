package com.spring.app.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Board;
import com.spring.app.entity.LinkParam;
import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardService boardService;

	//전체 글 개수
	@Override
	public int getTotalBoards(Map<String, Object> params) {
		return boardDao.countAll(params);
	}	

	//전체글목록
	@Override
	public List<Map<String, Object>> getBoards(Pagenation pagenation, LinkParam linkParam) {
		//Pagenation과 SearchParam을 넣어 데이터 가져옴
		Map<String, Object> params = new HashMap<>();
		params.put("linkParam", linkParam);
		
		int total = boardService.getTotalBoards(params);
		pagenation.setTotal(total);
		params.put("pagenation", pagenation);		
		
		//Mapper에서 GROUP BY를 사용하여 댓글 수(cnt)를 구해서 List<Board> 대신 List<Map>으로 받아오고 있다
		List<Map<String, Object>> boards = boardDao.selectAll(params);
		return boards;
	}	
	
	//글 보기
	@Override
	public Board getBoardById(int id) {
		Board board = boardDao.selectOneById(id);
		
		//조회수 수정
		board.setHits(board.getHits() + 1);
		boardService.updateBoardForHits(board);
		return board;
	}
	
	//글 등록
	@Override
	public String insertBoard(HttpSession session, Board board) {
		String requestURL = "/board/list";
		
		//email, username
		Member member = (Member) session.getAttribute("login");
		board.setEmail(member.getEmail());
		board.setWriter(member.getUsername());
		
		boardDao.insertOne(board);
		
		return requestURL;
	}
	
	//글 수정
	@Override
	public String updateBoard(Board board, Pagenation pagenation, LinkParam linkParam) {
		String requestURL = "/board/view?id=" + board.getId() + "&page=" + pagenation.getPage();
		requestURL += getLinkParam(linkParam);	
		boardDao.updateOne(board);
		return requestURL;
	}
	
	//글 조회수 수정
	@Override
	public void updateBoardForHits(Board board) {
		boardDao.updateOneForHits(board);
	}
	
	//글 삭제
	@Override
	public String deleteBoard(int id, Pagenation pagenation, LinkParam linkParam) {
		String requestURL = "/board/list?page=" + pagenation.getPage();
		requestURL += getLinkParam(linkParam);
		boardDao.deleteOne(id);
		return requestURL;
	}
	
	//LinkParam
	public String getLinkParam(LinkParam linkParam) {
		String addParams = "";
		
		if (!linkParam.getSearchKeyword().equals("")) {
			try {
				addParams += "&searchOption=" + URLEncoder.encode(linkParam.getSearchOption(), "UTF-8");
				addParams += "&searchKeyword=" + URLEncoder.encode(linkParam.getSearchKeyword(), "UTF-8");
			} catch(UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}	
		
		return addParams;
	}
	
}
