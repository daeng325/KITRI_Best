package com.kitri.shop.db.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/")
	public String adminPage() {
		return "admin";
	}
	
	@RequestMapping("/main")
	public String returnAdminPage() {
		return "admin";
	}
	
	@RequestMapping("/productmanage")
	public String returnProductManagePage() {
		return "productmanage";
	}
	
}

