package com.spring.app.service;

import java.util.List;

import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;

public interface NoticeService {
	
	//전체 글 개수
	public int getTotalNotices();
	
	//전체목록
	public List<Notice> getNotices(Pagenation pagenation);
	
	//등록
	public void addNotice(Notice notice);
	
	//상세보기: id
	public Notice getNoticeById(int id);
	
	//수정: 구분, 제목, 내용
	public void modifyNotice(Notice notice);
	
	//수정: 조회수
	public void modifyNoticeForHits(Notice notice);
	
	//삭제
	public void removeNotice(int id);
	
}
