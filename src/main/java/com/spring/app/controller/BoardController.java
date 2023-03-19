package com.spring.app.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Board;
import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//전체글목록
	@GetMapping("/list")
	public String list(Model model, Pagenation pagenation) {
		int total = boardService.getTotalBoards();
		pagenation.setTotal(total);
		List<Board> boards = boardService.getBoards(pagenation);
		
		model.addAttribute("boards", boards);
		model.addAttribute("pagenation", pagenation);
		return "home.customer.board.list";
	}
	
	//글 보기
	@GetMapping("/view")
	public String view(Model model, int id) {
		Board board = boardService.getBoardById(id);
		model.addAttribute("board", board);
		
		//조회수 수정
		board.setHits(board.getHits() + 1);
		boardService.updateBoardForHits(board);
		
		return "home.customer.board.view";
	}	
	
	//글 등록
	@GetMapping("/write")
	public String write() {
		return "home.customer.board.write";
	}	
	@PostMapping("/insert")
	public String write(HttpSession session, Board board) {
		//email, username
		Member member = (Member) session.getAttribute("login");
		board.setEmail(member.getEmail());
		board.setWriter(member.getUsername());
		
		//글 등록
		boardService.insertBoard(board);
		return "redirect:/board/list";
	}
	
	//글 수정
	@PostMapping("/update")
	public String update(Board board) {
		boardService.updateBoard(board);
		return "redirect:/board/view?id=" + board.getId();
	}
	
	//글 삭제
	@PostMapping("/delete")
	public String delete(int id) {
		boardService.deleteBoard(id);
		return "redirect:/board/list";
	}
	
}
