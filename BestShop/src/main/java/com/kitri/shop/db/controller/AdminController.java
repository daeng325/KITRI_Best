package com.kitri.shop.db.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.shop.db.repository.ProductRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	ProductRepository proRepo;
	

	@RequestMapping("/")
	public String adminPage() {
		return "admin";
	}
	
	@RequestMapping("/main")
	public String returnAdminPage() {
		return "admin";
	}
	
	@RequestMapping("/productmanage")
	public String returnProductManagePage(Model model) {
		model.addAttribute("products", proRepo.printAllProducts());
		return "productmanage";
	}
	
}

