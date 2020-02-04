package com.example.demo.board.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.board.domain.ProductVO;
import com.example.demo.board.service.ProductService;

@Controller
public class MainController {
	
	@Resource
	ProductService pService;
	
	@RequestMapping("/")
	private String homePate(Model model) throws Exception{
		List<ProductVO> products = pService.printAllProducts();		
		model.addAttribute("products", products);
		return "main";
	}
	
	@RequestMapping("/main")
	private String homePage(Model model) throws Exception{
		List<ProductVO> products = pService.printAllProducts();		
		model.addAttribute("products", products);
		return "main";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String viewUploadProduct() {
		return "uploadProduct";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test(){
		return "test";
	}
	
	


}
