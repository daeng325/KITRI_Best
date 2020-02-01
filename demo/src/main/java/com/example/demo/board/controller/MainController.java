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
public class MainController {
	
	@Resource
	ProductService pService;
	
	@RequestMapping("/")
	private String homePate(Model model) throws Exception{
		List<ProductVO> products = pService.printAllProducts();		
		model.addAttribute("products", products);
		return "main";
	}
	
	@RequestMapping("/main")
	private String homePage(Model model) throws Exception{
		List<ProductVO> products = pService.printAllProducts();		
		model.addAttribute("products", products);
		return "main";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String viewUploadProduct() {
		return "uploadProduct";
	}

}
