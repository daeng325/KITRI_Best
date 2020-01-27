package com.kitri.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {

    @RequestMapping("/")
    public String root_test() throws Exception{
        return "main";
    }
    
    @RequestMapping(value="/main", method=RequestMethod.GET)
	public String viewMain() {
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
}

