package com.spring.app.controller;


import java.util.HashMap;
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
import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Reply;
import com.spring.app.entity.LinkParam;
import com.spring.app.service.BoardService;
import com.spring.app.service.ReplyService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	//전체글목록
	@GetMapping("/list")
	public String list(Model model, Pagenation pagenation, LinkParam linkParam) {
		//Pagenation과 SearchParam을 넣어 데이터 가져옴
		Map<String, Object> params = new HashMap<>();
		params.put("linkParam", linkParam);
		
		int total = boardService.getTotalBoards(params);
		pagenation.setTotal(total);
		params.put("pagenation", pagenation);
		
		//Mapper에서 GROUP BY를 사용하여 댓글 수(cnt)를 구해서 List<Board> 대신 List<Map>으로 받아오고 있다
		List<Map<String, Object>> boards = boardService.getBoards(params);

		model.addAttribute("boards", boards);
		model.addAttribute("linkParam", linkParam);
		model.addAttribute("pagenation", pagenation);
		return "home.customer.board.list";
	}
	
	//글 보기
	@GetMapping("/view")
	public String view(Model model, int id, Pagenation pagenation) {
		Board board = boardService.getBoardById(id);
		model.addAttribute("board", board);

		//댓글 수
		int totalReplies = replyService.getTotalReplies(id);
		pagenation.setTotal(totalReplies);
		
		//댓글목록
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bid", id);
		map.put("pagenation", pagenation);
		
		List<Reply> replies = replyService.getRepliesByBoardId(map);
		
		model.addAttribute("totalReplies", totalReplies);
		model.addAttribute("replies", replies);
		
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
