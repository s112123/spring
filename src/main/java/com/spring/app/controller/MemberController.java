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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.app.entity.Member;
import com.spring.app.entity.Pagenation;
import com.spring.app.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	//약관동의 페이지
	@GetMapping("/agree")
	public String agree() {
		return "home.register.agree";
	}
	
	//회원가입 페이지
	@GetMapping("/register")
	public String register(Model model, String agree) {
		model.addAttribute("agree", agree);
		return "home.register.register";
	}
	
	//회원가입 처리
	@PostMapping("/register")
	@ResponseBody
	public Map<String, Boolean> register(@RequestBody Member _member) {
		System.out.println(_member.getEmail());
		Member member = memberService.getMemberByEmail(_member.getEmail());
		
		Boolean isDuplicated = false;
		if(member != null) 
			isDuplicated = true;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isDuplicated", isDuplicated);
		
		return map;
	}

	
	
	
	
	
	
	
	
	
	//전체회원목록
	@GetMapping("/list")
	public String list(
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
		
		return "admin.member.list";
	}
	
	//회원정보
	@GetMapping("/view")
	public String view(int id, Model model) {
		Member member = memberService.getMemberById(id);
		model.addAttribute("member", member);
		return "admin.member.view";
	}
	
	//회원등록
	@PostMapping("/insert")
	public String insertMember(Member member) {
		memberService.insertMember(member);
		return "redirect:/";
	}
	
	//회원수정
	@PostMapping("/update")
	public String updateMember(Model model, Member member) {
		if(member.getAgree() == null) {
			member.setAgree("N");
		} else if(member.getAgree().equals("on")) {
			member.setAgree("Y");
		}

		memberService.updateMember(member);
		return "redirect:/member/view?id=" + member.getId();
	}
	
	//회원삭제
	@GetMapping("/delete")
	public String deleteMember(int id) {
		memberService.deleteMember(id);
		return "redirect:/member/list";
	}
	
}
