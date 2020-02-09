package com.kitri.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(value= {"/top", "/bottom", "/bag", "/accesorie"}, method=RequestMethod.GET)
    public String veiwProductType(HttpServletRequest request, Model model) {
    	String type = request.getServletPath().substring(1);   	
    	List<Product> products = proRepo.printProductsByType(type);

    	if(type.equals("bag")) {
    		products.addAll(proRepo.printProductsByType("shoes"));
    		type = "Bags & Shoes";
    	}
	
    	model.addAttribute("products",products);
    	model.addAttribute("type",type.toUpperCase());
    	return "productPage";
    }

}

