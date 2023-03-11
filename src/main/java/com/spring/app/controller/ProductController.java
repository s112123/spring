package com.spring.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Product;
import com.spring.app.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	//상품 페이지
	@GetMapping("/product")
	public String productGET() {
		return "home.product.productlist";
	}
	
	//전체상품목록
	@GetMapping("/product/list")
	public String productListGET(
			Model model,
			@RequestParam(value="page", required=false) String page,
			Pagenation pagenation) {
		
		//페이징 처리
		int total = productService.getTotalProducts();
		pagenation.setTotal(total);
		if (page == null) page = "1";
		pagenation.setPage(Integer.parseInt(page));
		
		//페이징 처리에 따른 목록 조회
		List<Product> products = productService.getAllProducts(pagenation);
		
		model.addAttribute("products", products);
		model.addAttribute("pagenation", pagenation);

		return "admin.product.productlist";
	}
	
	//상품정보
	@GetMapping("/product/info")
	public String productInfoGET(Model model, @RequestParam(value="id", required=false) String _id) {
		System.out.println(_id);
		int id = 0;
		if(_id != null) {
			id = Integer.parseInt(_id);
			Product product = productService.getProductById(id);
			model.addAttribute("product", product);
		}
		//상품정보 페이지에서 등록버튼인지 수정버튼인지 판단하기 위해 값 전달
		model.addAttribute("id", id);
		return "admin.product.productinfo";
	}
	
	//상품등록
	@PostMapping("/product/insert")
	public String insertProduct(Product product) {
		productService.insertProduct(product);
		return "redirect:/product/list";
	}
	
	//상품수정
	@PostMapping("/product/update")
	public String updateProduct(Product product) {
		productService.updateProduct(product);
		return "redirect:/product/info?id=" + product.getId();
	}	
	
	//상품삭제
	@GetMapping("/product/delete")
	public String deleteProduct(int id) {
		productService.deleteProduct(id);
		return "redirect:/product/list";		
	}
	
}
