package com.spring.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;
import com.spring.app.repository.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	//전체 글 개수
	public int getTotalNotices() {
		return noticeDao.countAll();
	}
	
	//전체목록
	public List<Notice> getNotices(Pagenation pagenation) {
		return noticeDao.selectAll(pagenation);
	}
	
	//상세보기
	public Notice getNoticeById(int id) {
		return noticeDao.selectOneById(id);
	}	
	
	//공지사항 등록
	public void insertNotice(Notice notice) {
		noticeDao.insertOne(notice);
	}
	
	//공지사항 수정
	public void updateNotice(Notice notice) {
		noticeDao.updateOne(notice);
	}
	
	//공지사항 조회수 수정
	public void updateNoticeForHits(Notice notice) {
		noticeDao.updateOneForHits(notice);
	}
	
	//공지사항 삭제
	public void deleteNotice(int id) {
		noticeDao.deleteOne(id);
	}
	
}
