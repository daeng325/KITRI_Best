package com.kitri.shop.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.shop.db.dto.Product;
import com.kitri.shop.repository.ProductRepository;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductRepository proRepo;
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String tmpuploadProduct() throws Exception {
		return "upload";
	}	
	
	// 상품 등록
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadProduct(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("price") int price, @RequestParam("description") String description,
			@RequestParam("image") MultipartFile file, @RequestParam("status") String status) throws Exception {
				
		Product product = new Product(id, name, price, description, file.getBytes(), status);
		proRepo.save(product);
		return "main";
	}
	
	// 상품 이미지 display (안 됨)
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public String displayImage(Model model) {
		String id = "test1";
		if(proRepo.existsById(id)) {
			Product product = proRepo.findById(id).get();
			model.addAttribute("img", product.getImage());
			return "display";
		}
		else {
			model.addAttribute("img","no image" );	
			return "display";
		}
	}
	
	// 상품 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public Model deleteProduct(@ModelAttribute Product product, Model model) {
		if (proRepo.existsById(product.getId())) {
			//model.addAttribute("delete", proRepo.deleteById(product.getId()));
		}
		return model;
	}
	
	// 상품 수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public Model updateProduct(@ModelAttribute Product product, Model model) {
		if (proRepo.existsById(product.getId())) {
			proRepo.save(product);
		}
		return model;
	}
	
	// 상품 검색
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String searchProduct(@RequestParam("name") String name) {
		return "main";
	}
	
	@RequestMapping("/detail/{id}")
	public String top_detail_page(@PathVariable("id") String id, Model model) {
		
		System.out.println(id);
		Product product = proRepo.findById(id).get();
		
		model.addAttribute("product",product);
		
		return "detail";
	}
}
