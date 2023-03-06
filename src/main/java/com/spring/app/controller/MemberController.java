package com.spring.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Member;
import com.spring.app.service.MemberService;

@Controller
@RequestMapping("/admin")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//전체회원조회
	@GetMapping("/members")
	public String members(Model model) {
		List<Member> members = memberService.getMembers();
		model.addAttribute("members", members);
		return "admin.members";
	}
	
	//회원등록
	@PostMapping("/member/add")
	public String addMember(Member member) {
		memberService.addMember(member);
		return "redirect:/";
	}
	
	//회원조회: id
	@GetMapping("/member")
	public String getMemberById(int id) {
		return "";
	}

}
