package com.kitri.shop.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.repository.ProductRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
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
		List<Product> products = proRepo.printAllProducts();
		model.addAttribute("products", products);
		return "productmanage";
	}
	
}

