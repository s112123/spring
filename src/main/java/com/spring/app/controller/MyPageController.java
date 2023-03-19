package com.spring.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.app.entity.Board;
import com.spring.app.entity.Member;
import com.spring.app.entity.Order;
import com.spring.app.entity.OrderProduct;
import com.spring.app.entity.Pagenation;
import com.spring.app.service.MemberService;
import com.spring.app.service.MyPageService;
import com.spring.app.service.OrderService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MyPageService myPageService;
	
	//마이 페이지
	@GetMapping
	public String mypage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("login");
		return "redirect:/mypage/myinfo/view?id=" + member.getId();
	}
	
	/* ----- 내 정보 ----- */
	//내정보
	@GetMapping("/myinfo/view")
	public String viewMyInfo(int id, Model model) {
		Member member = memberService.getMemberById(id);
		model.addAttribute("member", member);
		return "home.mypage.myinfo.view";
	}
	
	//내정보 수정
	@PostMapping("/myinfo/update")
	public String updateMyInfo(Member member) {
		if(member.getAgree() == null) {
			member.setAgree("N");
		} else if(member.getAgree().equals("on")) {
			member.setAgree("Y");
		}

		memberService.updateMember(member);
		return "redirect:/mypage/myinfo/view?id=" + member.getId();
	}
	
	/* ----- 주문내역 ----- */
	//주문목록
	@GetMapping("/order/list")
	public String listMyOrder(HttpSession session, Model model, Pagenation pagenation) {
		//해당 사용자의 이메일을 가져오기 위해 세션정보 가져오기
		Member member = (Member) session.getAttribute("login");
		
		int total = myPageService.getTotalMyOrders(member.getEmail());
		pagenation.setTotal(total);
		
		//Map에 email, Pagenation을 넣어 SQL의 조건으로 넣는다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", member.getEmail());
		map.put("pagenation", pagenation);
		
		List<Order> orders = myPageService.getMyOrdersByEmail(map);
		model.addAttribute("orders", orders);
		model.addAttribute("pagenation", pagenation);
		
		return "home.mypage.order.list";
	}
	
	//주문정보
	@GetMapping("/order/view")
	public String viewMyOrder(String code, Model model) {
		Order order = orderService.getOrderByCode(code);
		List<OrderProduct> orderProducts = orderService.getOrderProductsByCode(code);
		model.addAttribute("order", order);
		model.addAttribute("orderProducts", orderProducts);
		return "home.mypage.order.view";
	}	
	
	//주문삭제
	@GetMapping("/order/delete")
	public String deleteOrder(int id) {
		orderService.deleteOrder(id);
		return "redirect:/mypage/order/list";
	}
	
	/* ----- 글 내역 ----- */
	//작성 글 목록
	@GetMapping("/board/list")
	public String listMyBoard(HttpSession session, Model model, Pagenation pagenation) {
		//해당 사용자의 이메일을 가져오기 위해 세션정보 가져오기
		Member member = (Member) session.getAttribute("login");
	
		int total = myPageService.getTotalMyBoards(member.getEmail());
		pagenation.setTotal(total);
		
		//Map에 email, Pagenation을 넣어 SQL의 조건으로 넣는다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", member.getEmail());
		map.put("pagenation", pagenation);
	
		List<Board> boards = myPageService.getMyBoardsByEmail(map);
		model.addAttribute("boards", boards);
		model.addAttribute("pagenation", pagenation);
		
		return "home.mypage.board.list";
	}
	
}
