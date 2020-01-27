package com.kitri.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {

    @RequestMapping("/")
    public String root_test() throws Exception{
        return "main";
    }
    
//    @RequestMapping(value="/signin", method=RequestMethod.GET)
//    public String signinView(Model model) throws Exception{
//    	return "signin";
//    }
 
}

