package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Reply;

public interface ReplyService {
	
	//전체댓글수
	public int getTotalReplies(int bid);
	
	//전체댓글목록
	public List<Reply> getRepliesByBoardId(int bid) ;
	
	//댓글 등록
	public void insertReply(Reply reply);
		
	//댓글 삭제
	public void deleteReply(int id);
	
}
