package com.kitri.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.shop.db.dto.Product;
import com.kitri.shop.repository.ProductRepository;

@Controller
public class CommonController {
	
	@Autowired
	ProductRepository productRepo;
	
    @RequestMapping("/")
    public String root_test() throws Exception{
        return "main";
    }
    
    @RequestMapping(value="/main", method=RequestMethod.GET)
	public String viewMain(ModelMap model) throws IOException {

    	List<Product> products = (List<Product>) productRepo.findAll();
		model.addAttribute("products",products);  	
    	
		return "main";
	}
    
    @RequestMapping(value="/join", method=RequestMethod.GET)
	public String viewJoin() {
		return "join";
	}
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLogin() {
		return "login";
	}
    
    @RequestMapping(value="/top", method=RequestMethod.GET)
	public String viewTop() {
		return "top";
	}
    
    @RequestMapping(value="/bottom", method=RequestMethod.GET)
	public String viewBottom() {
		return "bottom";
	}
    
    @RequestMapping(value="/bags", method=RequestMethod.GET)
	public String viewBags() {
		return "bags";
	}
    
    @RequestMapping(value="/acce", method=RequestMethod.GET)
	public String viewSignin() {
		return "acce";
	}
    
    @RequestMapping(value="/upload", method=RequestMethod.GET)
   	public String viewUpload() {
   		return "upload";
   	}
    
    @RequestMapping(value="/admin")
    public String admin_home() throws Exception{
        return "admin";
    }

}

