package com.spring.app.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Product;
import com.spring.app.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	@Autowired
	ServletContext context;
	
	//상품페이지: 카테고리별
	@GetMapping("/product")
	public String productsByCategory(Model model) {
		Map<String, List<Product>> products = new HashMap<String, List<Product>>();
		String[] categories = {"STEAK", "PASTA", "BEVERAGE"};
		
		for(String category : categories) {
			List<Product> _products = productService.getProductsByCategory(category);
			products.put(category.toLowerCase(), _products);
		}
		
		model.addAttribute("products", products);		
		return "home.product.productlist";
	}
	
	//전체상품목록
	@GetMapping("/product/list")
	public String products(
			Model model,
			@RequestParam(value="page", required=false) String page,
			Pagenation pagenation) {
		
		//페이징 처리
		int total = productService.getTotalProducts();
		pagenation.setTotal(total);
		if (page == null) page = "1";
		pagenation.setPage(Integer.parseInt(page));
		
		//페이징 처리에 따른 목록 조회
		List<Product> products = productService.getProducts(pagenation);
		
		for(int i=0; i<products.size(); i++) {
			System.out.println(products.get(i).getRegdate());
		}
		
		model.addAttribute("products", products);
		model.addAttribute("pagenation", pagenation);

		return null;
	}
	
	//상품정보
	@GetMapping("/product/info")
	public String product(Model model, @RequestParam(value="id", required=false) String _id) {
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
	public String insertProduct(Product product, @RequestParam(value="attached", required=false) MultipartFile imgFile) {
		//업로드 폴더 경로
		//D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\app\
		String uploadDirPath = context.getRealPath("/") + "resources\\images\\products";
		
		//업로드 폴더 없으면 생성
		File uploadDir = new File(uploadDirPath);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		
		//파일 업로드
		String uploadFileName = UUID.randomUUID().toString() + "_" + imgFile.getOriginalFilename();
		if(imgFile.getSize() > 0) {
			try {
				imgFile.transferTo(new File(uploadDir, uploadFileName));
				product.setImg(uploadFileName);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
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
