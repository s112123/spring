package com.spring.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Reply;
import com.spring.app.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	//댓글 등록
	@PostMapping("/insert")
	public String insertReply(Reply reply, int bid) {
		replyService.insertReply(reply);
		return "redirect:/board/view?id=" + bid;
	}
	
	//댓글 삭제
	@GetMapping("/delete")
	public String deleteReply(int id, int bid) {
		replyService.deleteReply(id);
		return "redirect:/board/view?id=" + bid;
	}
	
}
