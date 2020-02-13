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

	@RequestMapping("")
	public String adminPage() {
		return "admin";
	}
	
	@RequestMapping("/usermanage")
    public String viewUserManage() throws Exception{
    	return "usermanage";
    }
	
	@RequestMapping("/manage")
	public String viewAdminQnA() {
		return "q&aanswermanage";
	}
	
	@RequestMapping("/upload")
	public String viewQnAUploadForm() {
		return "q&aanswer";
	}
	
	@RequestMapping("/ordermanage")
	public String orderManage() {
		return "ordermanage";
	}
	
	@RequestMapping("/questmanage")
	public String qanswerManage() {
		return "q&aanswermanage";
	}
	
//	@RequestMapping("/usermanage")
//	public String userManage() {
//		return "usermanage";
//	}
	
	@RequestMapping("/productmanage")
	public String returnProductManagePage(Model model) {
		List<Product> products = proRepo.printAllProducts();
		model.addAttribute("products", products);
		return "productmanage";
	}
	
}

