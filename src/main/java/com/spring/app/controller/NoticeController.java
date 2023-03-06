package com.spring.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;
import com.spring.app.service.NoticeService;

@Controller
@RequestMapping("/customer")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	//전체목록
	@GetMapping("/notices")
	public String notices(
			Model model, 
			@RequestParam(value="page", required=false) String page, 
			Pagenation pagenation) {
		
		//페이징 처리
		int total = noticeService.getTotalNotices();
		pagenation.setTotal(total);
		if (page == null) page = "1";
		pagenation.setPage(Integer.parseInt(page));
		
		//페이징 처리에 따른 목록 조회
		List<Notice> notices = noticeService.getNotices(pagenation);
		
		model.addAttribute("notices", notices);
		model.addAttribute("pagenation", pagenation);
		
		return "home.customer.notice.notices";
	}
	
	//글쓰기 페이지
	@GetMapping("/notice/write")
	public String writeNotice() {
		return "home.customer.notice.write";
	}
	
	//등록
	@PostMapping("/notice/add")
	public String addNotice(Notice notice) {
		notice.setWriter("박땡땡");
		noticeService.addNotice(notice);
		return "redirect:/customer/notices";
	}
	
	//상세보기: id
	@GetMapping("/notice")
	public String notice(Model model, int id) {
		Notice notice = noticeService.getNoticeById(id);
		model.addAttribute("notice", notice);
		
		//수정: 조회수
		notice.setHits(notice.getHits() + 1);
		noticeService.modifyNoticeForHits(notice);
		
		return "home.customer.notice.notice";
	}
	
	//수정: 구분, 제목, 내용
	@PostMapping("/notice/modify")
	public String modifyNotice(Notice notice) {
		noticeService.modifyNotice(notice);
		return "redirect:/customer/notices";
	}
	
	//삭제
	@GetMapping("/notice/remove")
	public String removeNotice(int id) {
		noticeService.removeNotice(id);
		return "redirect:/customer/notices";
	}
	
}
