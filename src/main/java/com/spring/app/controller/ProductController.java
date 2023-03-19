package com.spring.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Product;
import com.spring.app.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	//상품페이지: 카테고리별
	@GetMapping
	public String listProductsInHome(Model model) {
		Map<String, List<Product>> products = new HashMap<String, List<Product>>();
		String[] categories = {"STEAK", "PASTA", "BEVERAGE"};
		
		for(String category : categories) {
			List<Product> _products = productService.getProductsByCategory(category);
			products.put(category.toLowerCase(), _products);
		}
		
		model.addAttribute("products", products);		
		return "home.product.list";
	}
	
	//전체상품목록
	@GetMapping("/list")
	public String listProductsInAdmin(Model model, Pagenation pagenation) {
		int total = productService.getTotalProducts();
		pagenation.setTotal(total);
		List<Product> products = productService.getProducts(pagenation);
		
		model.addAttribute("products", products);
		model.addAttribute("pagenation", pagenation);

		return "admin.product.list";
	}
	
	//상품정보
	@GetMapping("/view")
	public String viewProductInAdmin(Model model, @RequestParam(value="id", required=false) String _id) {
		int id = 0;
		if(_id != null) {
			id = Integer.parseInt(_id);
			Product product = productService.getProductById(id);
			model.addAttribute("product", product);
		}
		//상품정보 페이지에서 등록버튼인지 수정버튼인지 판단하기 위해 값 전달
		model.addAttribute("id", id);
		return "admin.product.view";
	}
	
	//상품등록
	@PostMapping("/insert")
	public String insertProduct(Product product, @RequestParam(value="attached", required=false) MultipartFile attachedFile) {
		productService.insertProduct(product, attachedFile);
		return "redirect:/product/list";
	}
	
	//상품수정
	@PostMapping("/update")
	public String updateProduct(
			Product product, 
			@RequestParam(value="attached", required=false) MultipartFile attachedFile,
			String filename) {	
		product.setImg(filename);
		productService.updateProduct(product, attachedFile);
		return "redirect:/product/view?id=" + product.getId();
	}	
	
}
