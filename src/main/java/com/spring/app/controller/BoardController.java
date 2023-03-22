package com.spring.app.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Board;
import com.spring.app.entity.LinkParam;
import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Reply;
import com.spring.app.service.BoardService;
import com.spring.app.service.ReplyService;

@Controller
@RequestMapping("/customer/board")
public class BoardController {
	
	Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	//전체글목록
	@GetMapping("/list")
	public String list(Model model, Pagenation pagenation, LinkParam linkParam) {
		List<Map<String, Object>> boards = boardService.getBoards(pagenation, linkParam);
		model.addAttribute("boards", boards);
		model.addAttribute("linkParam", linkParam);
		model.addAttribute("pagenation", pagenation);
		return "home.customer.board.list";
	}
	
	//글 보기
	@GetMapping("/view")
	public String view(Model model, int id, Pagenation pagenation, LinkParam linkParam) {
		//게시물 정보 조회
		Board board = boardService.getBoardById(id);
		
		//댓글 수 및 댓글 목록
		int totalReplies = replyService.getTotalReplies(id);
		List<Reply> replies = replyService.getRepliesByBoardId(id);
		
		model.addAttribute("board", board);					//글 내용
		model.addAttribute("linkParam", linkParam);			//RequestURL 파라미터
		model.addAttribute("totalReplies", totalReplies);	//댓글 수
		model.addAttribute("replies", replies);				//댓글 목록
		
		return "home.customer.board.view";
	}	
	
	//글 등록
	@GetMapping("/write")
	public String writeForm() {
		return "home.customer.board.write";
	}
	
	@PostMapping("/insert")
	public String write(HttpSession session, Board board) {
		String requestURL = boardService.insertBoard(session, board);
		return "redirect:" + requestURL;
	}
	
	//글 수정
	@PostMapping("/update")
	public String update(Board board, Pagenation pagenation, LinkParam linkParam) {
		String requestURL = boardService.updateBoard(board, pagenation, linkParam);
		return "redirect:" + requestURL;
	}
	
	//글 삭제
	@PostMapping("/delete")
	public String delete(int id, Pagenation pagenation, LinkParam linkParam) {
		String requestURL = boardService.deleteBoard(id, pagenation, linkParam);
		return "redirect:" + requestURL;
	}

}
