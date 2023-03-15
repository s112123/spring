package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;

public interface NoticeService {
	
	//전체 글 개수
	public int getTotalNotices();
	
	//전체목록
	public List<Notice> getNotices(Pagenation pagenation);
	
	//공지사항 등록
	public void insertNotice(Notice notice);
	
	//상세보기: id
	public Notice getNoticeById(int id);
	
	//공지사항 수정
	public void updateNotice(Notice notice);
	
	//공지사항 조회수 수정
	public void updateNoticeForHits(Notice notice);
	
	//공지사항 삭제
	public void deleteNotice(int id);
	
}
