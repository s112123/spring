package com.spring.app.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.app.entity.Reply;
import com.spring.app.service.ReplyService;

@RestController
@RequestMapping("/api/reply")
public class ReplyRestController {
	
	@Autowired
	private ReplyService replyService;
	
	//댓글등록
	@PostMapping("/insert")
	public Map<String, Object> insertReply(@RequestBody Reply reply) {
		//댓글등록
		replyService.insertReply(reply);
		
		//전송 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "inserted");
		
		return resultMap;
	}
	
	//댓글삭제
	@GetMapping("/delete/{id}")
	public Map<String, Object> deleteReply(@PathVariable("id") int id) {
		//댓글 삭제
		replyService.deleteReply(id);
		
		//전송 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("message", "deleted");
		
		return resultMap;
	}
	
}