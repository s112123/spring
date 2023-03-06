package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.NoticeRepository;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeRepository noticeRepository;
	
	//전체 글 개수
	public int getTotalNotices() {
		return noticeRepository.countAll();
	}
	
	//전체목록
	public List<Notice> getNotices(Pagenation pagenation) {
		return noticeRepository.selectAll(pagenation);
	}
	
	//등록
	public void addNotice(Notice notice) {
		noticeRepository.insertOne(notice);
	}
	
	//상세보기: id
	public Notice getNoticeById(int id) {
		return noticeRepository.selectOneById(id);
	}
	
	//수정: 구분, 제목, 내용
	public void modifyNotice(Notice notice) {
		noticeRepository.updateOne(notice);
	}
	
	//수정: 조회수
	public void modifyNoticeForHits(Notice notice) {
		noticeRepository.updateOneForHits(notice);
	}
	
	//삭제
	public void removeNotice(int id) {
		noticeRepository.deleteOne(id);
	}
	
}
