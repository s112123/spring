package com.spring.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Member;
import com.spring.app.entity.Notice;
import com.spring.app.entity.Pagenation;
import com.spring.app.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 페이지: 전체목록
	@GetMapping("/list")
	public String list(Model model, Pagenation pagenation) {
		int total = noticeService.getTotalNotices();
		pagenation.setTotal(total);
		List<Notice> notices = noticeService.getNotices(pagenation);
		
		model.addAttribute("notices", notices);
		model.addAttribute("pagenation", pagenation);
	
		return "home.customer.notice.list";
	}
	
	//글쓰기 페이지
	@GetMapping("/write")
	public String writeNotice() {
		return "home.customer.notice.write";
	}
	
	//상세보기: id
	@GetMapping("/view")
	public String notice(Model model, int id) {
		Notice notice = noticeService.getNoticeById(id);
		model.addAttribute("notice", notice);
		
		//조회수 수정
		notice.setHits(notice.getHits() + 1);
		noticeService.updateNoticeForHits(notice);
		
		return "home.customer.notice.view";
	}
	
	//공지사항 등록
	@PostMapping("/insert")
	public String insertNotice(HttpSession session, Notice notice, Model model) {
		Member member = (Member) session.getAttribute("login");
		notice.setEmail(member.getEmail());
		notice.setWriter(member.getUsername());
		
		noticeService.insertNotice(notice);
		return "redirect:/notice/list";
	}	
	
	//공지사항 수정
	@PostMapping("/update")
	public String updateNotice(Notice notice) {
		noticeService.updateNotice(notice);
		return "redirect:/notice/view?id=" + notice.getId();
	}
		
	//공지사항 삭제
	@PostMapping("/delete")
	public String deleteNotice(int id) {
		noticeService.deleteNotice(id);
		return "redirect:/notice/list";
	}
	
}