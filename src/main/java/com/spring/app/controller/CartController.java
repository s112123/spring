package com.spring.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.app.entity.Cart;
import com.spring.app.entity.Member;
import com.spring.app.entity.Product;
import com.spring.app.service.CartService;
import com.spring.app.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	ProductService productService;
	@Autowired
	CartService cartService;
	
	//장바구니 페이지
	@GetMapping
	public String cart(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("login");
		List<Cart> cart = cartService.getItemsInCartByEmail(member.getEmail());
		
		//총 주문금액
		int total = 0;
		for(Cart c : cart) {
			total += (c.getQty() * c.getPrice());
		}
	
		model.addAttribute("cart", cart);
		model.addAttribute("total", total);
		return "home.cart.list";
	}
	
	//제품추가
	@PostMapping("/insert")
	@ResponseBody
	public String insertItem(HttpSession session, String productId) {
		Member member = (Member) session.getAttribute("login");
		Product product = productService.getProductById(Integer.parseInt(productId));
				
		Cart cart = new Cart();
		cart.setEmail(member.getEmail());
		cart.setPname(product.getPname());
		cart.setPrice(product.getPrice());
		cart.setImg(product.getImg());
		
		cartService.insertItemInCart(cart);
		return "seccess";
	}	
	
	//수량수정
	@GetMapping("/update")
	public String updateItemForQty(Cart cart) {
		cartService.updateItemForQty(cart);
		return "redirect:/cart";
	}
	
	//제품개별삭제
	@GetMapping("/delete")
	public String deleteItemInCart(int id) {
		cartService.deleteItemInCart(id);
		return "redirect:/cart";
	}
	
	//제품일괄삭제
	@PostMapping("/delete")
	public String deleteItemsInCart(@RequestParam(value="selectedItem", required=false) int[] ids) {
		cartService.deleteItemsInCart(ids);
		return "redirect:/cart";
	}
		
}
