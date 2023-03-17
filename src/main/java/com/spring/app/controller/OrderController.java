package com.spring.app.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.app.entity.Cart;
import com.spring.app.entity.Member;
import com.spring.app.entity.Order;
import com.spring.app.entity.OrderProduct;
import com.spring.app.service.CartService;
import com.spring.app.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	
	
	//주문내역 페이지
	@GetMapping("/view")
	public String view(String code, Model model) {
		List<OrderProduct> orderProducts = orderService.getOrderProductsByCode(code);	
		model.addAttribute("orderProducts", orderProducts);
		model.addAttribute("code", code);
		return "home.order.view";
	}
	
	//주문등록
	@PostMapping("/insert")
	public String insertOrder(
			HttpSession session, 
			int total,
			@RequestParam(value="selectedItem", required=false) int[] ids,
			Model model) {
		
		//고객정보
		Member member = (Member) session.getAttribute("login");
		
		//Cart에서 선택된 id만 조회
		List<Cart> cart = cartService.getItemsByIds(ids);
		
		//주문등록
		String code = UUID.randomUUID().toString();
		String email = member.getEmail(); 	
		String title = cart.get(0).getPname();
		if(cart.size() > 1)
			title += (" 외 " + (cart.size() - 1) + "개");
		
		Order order = new Order();
		order.setCode(code);
		order.setEmail(email);
		order.setTitle(title);
		order.setTotal(total);
	
		orderService.insertOrder(order);
		
		//주문내역등록
		for(Cart c : cart) {
			OrderProduct orderProduct = new OrderProduct();
			
			orderProduct.setCode(order.getCode());
			orderProduct.setPname(c.getPname());
			orderProduct.setPrice(c.getPrice());
			orderProduct.setQty(c.getQty());
			orderProduct.setImg(c.getImg());	
			
			//주문상품으로 등록
			orderService.insertProductForOneOrder(orderProduct);
			//장바구니에서 삭제
			cartService.deleteItemInCart(c.getId());
		}
		
		//주문번호를 주문내역 페이지로 보냄
		model.addAttribute("code", code);
		return "redirect:/order/view";
	}
	
	
}
