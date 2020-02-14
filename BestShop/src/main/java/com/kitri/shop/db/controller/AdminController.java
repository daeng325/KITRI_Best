package com.kitri.shop.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.repository.ProductRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	ProductRepository proRepo;

	@RequestMapping("")
	public String viewAdminPage() {
		return "admin";
	}
	
	@RequestMapping(value="/productmanage", method=RequestMethod.GET)
	public String viewProductManagePage(Model model) {
		List<Product> products = proRepo.printAllProducts();
		model.addAttribute("products", products);
		return "productmanage";
	}
	
	@RequestMapping(value="/usermanage", method=RequestMethod.GET)
    public String viewUserManagePage() throws Exception{
    	return "usermanage";
    }
	
	@RequestMapping(value="/ordermanage", method=RequestMethod.GET)
	public String viewOrderManagePage() {
		return "ordermanage";
	}
	
	@RequestMapping(value="/questmanage", method=RequestMethod.GET)
	public String viewQnAManagePage() {
		return "q&aanswermanage";
	}
	
	@RequestMapping(value="/answer/upload", method=RequestMethod.GET)
	public String viewQnAUploadForm() {
		return "q&aanswer";
	}
	

}

