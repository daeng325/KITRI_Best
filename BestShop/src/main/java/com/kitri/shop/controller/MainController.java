package com.kitri.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.repository.ProductRepository;

@Controller
public class MainController {
	
	@Autowired
	ProductRepository proRepo;

    @RequestMapping("/")
    public String root_test(Model model) throws Exception{
    	List<Product> products = proRepo.printAllProducts();
    	model.addAttribute("products", products);
        return "main";
    }
    
    @RequestMapping(value="/main", method=RequestMethod.GET)
	public String viewMain(Model model) throws Exception{
    	List<Product> products = proRepo.printAllProducts();
    	model.addAttribute("products", products);
		return "main";
	}
    
    @RequestMapping(value="/top", method=RequestMethod.GET)
	public String viewTop(Model model) throws Exception{
    	List<Product> products = proRepo.printProductsByType("top");				
		model.addAttribute("products", products);	
		return "top";
	}
    
    @RequestMapping(value="/bottom", method=RequestMethod.GET)
	public String viewBottom(Model model) throws Exception{
    	List<Product> products = proRepo.printProductsByType("bottom");				
		model.addAttribute("products", products);
		return "bottom";
	}
    
    @RequestMapping(value="/bags", method=RequestMethod.GET)
	public String viewBags(Model model) throws Exception{
    	List<Product> products = proRepo.printProductsByType("bag");				
		model.addAttribute("products", products);
		return "bags";
	}
    
    @RequestMapping(value="/acce", method=RequestMethod.GET)
	public String viewSignin(Model model) throws Exception{
    	List<Product> products = proRepo.printProductsByType("Accesorie");				
		model.addAttribute("products", products);
		return "acce";
	}
    
    @RequestMapping("/test") public String admin(@AuthenticationPrincipal Member user) {
    	System.out.println("================= " + user); 
    	return "admin"; 
    	}

}

