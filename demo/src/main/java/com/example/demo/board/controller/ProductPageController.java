package com.example.demo.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.board.domain.ProductVO;
import com.example.demo.board.service.ProductService;

@Controller
public class ProductPageController {
	
	@Resource
	ProductService pService;	
	
	@RequestMapping(value = "/top")
	public String topPageLoad(Model model) throws Exception {
		List<ProductVO> products = pService.printProductsByType("\"top\"");				
		model.addAttribute("products", products);		
		return "top";
	}

	@RequestMapping(value = "/bottom")
	public String bottomPageLoad(Model model) throws Exception {
		List<ProductVO> products = pService.printProductsByType("\"bottom\"");				
		model.addAttribute("products", products);		
		return "bottom";
	}

	@RequestMapping(value = "/bags")
	public String bag_shoesPageLoad(Model model) throws Exception {
		List<ProductVO> products = pService.printProductsByType("\"bag\"");
		products.addAll(pService.printProductsByType("\"shoes\""));
		model.addAttribute("products", products);		
		return "bags";
	}	
	
	@RequestMapping(value = "/acce")
	public String AccesoriesPageLoad(Model model) throws Exception {
		List<ProductVO> products = pService.printProductsByType("\"Accesorie\"");				
		model.addAttribute("products", products);		
		return "acce";
	}	
	
}
