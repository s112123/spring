package com.spring.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Reply;
import com.spring.app.repository.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDao replyDao;
	
	//전체댓글수
	@Override
	public int getTotalReplies(int bid) {
		return replyDao.countAll(bid);
	}
	
	//전체댓글목록
	@Override
	public List<Reply> getRepliesByBoardId(Map<String, Object> map) {
		List<Reply> replies = replyDao.selectAllByBoardId(map);
		return replies;
	}
	
	//댓글 등록
	@Override
	public void insertReply(Reply reply) {
		replyDao.insertOne(reply);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(int id) {
		replyDao.deleteOne(id);
	}
	
}

