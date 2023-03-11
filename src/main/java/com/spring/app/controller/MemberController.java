package com.spring.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	//약관동의 페이지
	@GetMapping("/agree")
	public String agreeGET() {
		return "home.register.agree";
	}
	
	//회원가입 페이지
	@GetMapping("/register")
	public String registerGET(Model model, String agree) {
		model.addAttribute("agree", agree);
		return "home.register.register";
	}
	
	//전체회원조회
	@GetMapping("/member/list")
	public String memberListGET(
			Model model,
			@RequestParam(value="page", required=false) String page,
			Pagenation pagenation) {
		
		//페이징 처리
		int total = memberService.getTotalMembers();
		pagenation.setTotal(total);
		if (page == null) page = "1";
		pagenation.setPage(Integer.parseInt(page));
		
		//페이징 처리에 따른 목록 조회
		List<Member> members = memberService.getMembers(pagenation);
		
		model.addAttribute("members", members);
		model.addAttribute("pagenation", pagenation);
		
		return "admin.member.memberlist";
	}
	
	//회원정보
	@GetMapping("/member/info")
	public String memberInfoGET() {
		return "admin.member.memberinfo";
	}
	
	//회원삭제
	@GetMapping("/member/delete")
	public String deleteMemberGET(int id) {
		memberService.deleteMember(id);
		return "redirect:/member/list";
	}
	
	/*
	//등록
	@PostMapping("/member/add")
	public String addMember(Member member) {
		memberService.addMember(member);
		return "redirect:/";
	}
	
	//상세보기: id
	@PostMapping("/member")
	@ResponseBody
	public Map<String, Member> getMemberById(@RequestBody Member _member) {
		//Ajax로 보내온 JSON 데이터(id) -> @RequestBody로 MemberDto의 id값에 자동저장
		Member member = memberService.getMemberById(_member.getId());
		Map<String, Member> map = new HashMap<>();
		map.put("member", member);
		return map;
	}
	
	//수정
	@PostMapping("/member/modify")
	public String modifyMember(Model model, Member member) {
		memberService.modifyMember(member);
		model.addAttribute("member", member);
		return "redirect:/member";
	}
	*/
	
}
