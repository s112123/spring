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
		model.addAttribute("cart", cart);
		return "home.cart.list";
	}
	
	//제품추가
	@PostMapping("/insert")
	@ResponseBody
	public String insertItem(HttpSession session, String productId) {
		//전송할 결과메세지
		String message = "";
		Member member = (Member) session.getAttribute("login");
		
		//로그인 되었는지 확인
		if(member == null) { 
			message = "notLogin";
		} else {
			//현재 장바구니에 같은 제품이 있는지 확인
			Cart _cart = cartService.getItemByPid(Integer.parseInt(productId));
			if(_cart == null) {
				Product product = productService.getProductById(Integer.parseInt(productId));
				
				Cart cart = new Cart();
				cart.setPid(product.getId());
				cart.setEmail(member.getEmail());
				cart.setPname(product.getPname());
				cart.setPrice(product.getPrice());
				cart.setImg(product.getImg());
				
				cartService.insertItemInCart(cart);
				message = "success";
			} else {
				message = "duplicated";
			}
		}
	
		return message;
	}	
	
	//수량수정
	@GetMapping("/update")
	@ResponseBody
	public String updateItemForQty(Integer id, Integer qty) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("id", id);
		map.put("qty", qty);
		cartService.updateItemForQty(map);
		return "updated";
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
