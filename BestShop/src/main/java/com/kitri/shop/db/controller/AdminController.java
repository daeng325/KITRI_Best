package com.kitri.shop.db.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/main")
	public String returnAdminPage() {
		return "admin";
	}
	
	//public String
	
}

