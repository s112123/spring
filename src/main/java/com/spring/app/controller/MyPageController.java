package com.spring.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Member;
import com.spring.app.entity.Order;
import com.spring.app.service.OrderService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	OrderService orderService;
	
	@GetMapping
	public String mypage() {
		return "redirect:/mypage/myinfo";
	}
	
	@GetMapping("/myinfo")
	public String myinfo() {
		return "home.mypage.myinfo.view";
	}
	
	//전체주문목록
	@GetMapping("/myorder/list")
	public String orderlist(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("login");
		System.out.println(member.getEmail());
		List<Order> orders = orderService.getOrdersByEmail(member.getEmail());
		
		for(int i=0; i<orders.size(); i++) {
			System.out.println(orders.get(i).toString());
		}
		
		
		
		model.addAttribute("orders", orders);
		return "home.mypage.myorder.list";
	}
	
	
	/*
	
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
	*/
	
	
	
	@GetMapping("/myqna/list")
	public String qnalist() {
		return "home.mypage.myqna.list";
	}
	
}
