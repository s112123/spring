package com.spring.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.app.entity.Member;
import com.spring.app.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	//로그인 페이지
	@GetMapping("/login")
	public String loginGET() {
		return "home.login.login";
	}	
	
	//로그인 처리
	@PostMapping("/login")
	@ResponseBody
	public Map<String, String> loginPOST(@RequestBody Member _member, HttpSession session, boolean isSave) {	
		System.out.println(isSave);
		
		Member member = memberService.getMemberByEmail(_member.getEmail());
		Map<String, String> map = validateLogin(_member, member);
		
		//유효성 검사가 모두 통과되면 session 생성
		if(map.get("message").equals("success")) 
			session.setAttribute("login", member);

		return map;		
	}
	
	//유효성 검사
	public Map<String, String> validateLogin(Member _member, Member member) {
		String message = null;
		
		if(_member.getEmail().trim().length() == 0) 
			message = "emptyE";		//이메일 입력 X
		else if(_member.getPasswd().trim().length() == 0) 
			message = "emptyP";		//비밀번호 입력 X
		else if(member == null) 
			message = "notFound";	//존재하지 않는 이메일	
		else if(!member.getPasswd().equals(_member.getPasswd())) 				
			message = "notMatch";	//비밀번호 불일치
		else
			message = "success";	//로그인 성공	
		
		return setMessage(message);
	}
	
	//전송 메시지 저장
	public Map<String, String> setMessage(String message) {
		Map<String, String> map = new HashMap<>();
		map.put("message", message);
		return map;
	}	
	
}
