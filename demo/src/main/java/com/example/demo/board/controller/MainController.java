package com.example.demo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping("/")
	private String homePate() throws Exception{
		return "main";
	}
	
	@RequestMapping("/main")
	private String homePage() throws Exception{
		return "main";
	}
	
	@RequestMapping(value="upload", method=RequestMethod.GET)
	public String viewUploadProduct() {
		return "uploadProduct";
	}

}
