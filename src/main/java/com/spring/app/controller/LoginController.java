package com.spring.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
	public String login(Model model, @CookieValue(value="remember", required=false) Cookie cookie) {
		if(cookie != null) {
			model.addAttribute("remember", cookie.getValue());
		}
		return "home.login.login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	@ResponseBody
	public Map<String, String> login(
			@RequestBody Map<String, Object> json, 
			HttpSession session,
			HttpServletResponse response) {	
		String email = (String) json.get("email");
		String passwd = (String) json.get("passwd");
		boolean isSaved = (boolean) json.get("isSaved");
		
		Member member = memberService.getMemberByEmail(email);
		Map<String, String> map = validateLogin(email, passwd, member);
		
		//session
		if(map.get("message").equals("success")) {
			session.setAttribute("login", member);
		}
		
		//cookie
		Cookie cookie = new Cookie("remember", email);
		if(isSaved) {
			cookie.setMaxAge(60 * 60);		//1시간
		} else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		
		return map;		
	}
	
	//유효성 검사
	public Map<String, String> validateLogin(String email, String passwd, Member member) {
		String message = null;
		
		if(email.trim().length() == 0) 
			message = "emptyE";		//이메일 입력 X
		else if(passwd.trim().length() == 0) 
			message = "emptyP";		//비밀번호 입력 X
		else if(member == null) 
			message = "notFound";	//존재하지 않는 이메일	
		else if(!member.getPasswd().equals(passwd)) 				
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
