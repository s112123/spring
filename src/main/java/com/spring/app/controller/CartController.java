package com.spring.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.app.entity.Cart;
import com.spring.app.entity.Member;
import com.spring.app.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	//장바구니 페이지 이동
	@GetMapping("/cart")
	public String cart(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("login");
		List<Cart> cart = cartService.getCartByEmail(member.getEmail());
		model.addAttribute("cart", cart);
		return "home.cart.cart";
	}
	
	//수량수정
	@GetMapping("/cart/modify")
	public String modifyProductForQty(Cart cart) {
		cartService.modifyCartForQty(cart);
		return "redirect:/cart";
	}
	
	//제품개별삭제
	@GetMapping("/cart/remove")
	public String removeItemInCart(int id) {
		cartService.removeCart(id);
		return "redirect:/cart";
	}
	
	//제품일괄삭제
	@GetMapping("/cart/removeItems")
	public void removeItemsInCart(boolean[] selectItem) {
		System.out.println("aa");
	}
	
	
}
