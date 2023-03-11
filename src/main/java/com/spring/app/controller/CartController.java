package com.spring.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.app.entity.Cart;
import com.spring.app.entity.Member;
import com.spring.app.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	//장바구니 페이지
	@GetMapping("/cart")
	public String cart(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("login");
		List<Cart> cart = cartService.getItemsInCartByEmail(member.getEmail());
		model.addAttribute("cart", cart);
		return "home.cart.cartlist";
	}
	
	//제품추가
	@GetMapping("/cart/insert")
	public String insertItem(Cart cart) {
		//구현해야함
		return "redirect:/cart";
	}	
	
	//수량수정
	@GetMapping("/cart/update")
	public String updateItemForQty(Cart cart) {
		cartService.updateItemForQty(cart);
		return "redirect:/cart";
	}
	
	//제품개별삭제
	@GetMapping("/cart/delete")
	public String deleteItemInCart(int id) {
		cartService.deleteItemInCart(id);
		return "redirect:/cart";
	}
	
	//제품일괄삭제
	@PostMapping("/cart/deleteItems")
	public String deleteItemsInCart(@RequestParam(value="selectedItem", required=false) String[] ids) {
		cartService.deleteItemsInCart(ids);
		return "redirect:/cart";
	}
		
}
