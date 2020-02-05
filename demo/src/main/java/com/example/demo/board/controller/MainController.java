package com.example.demo.board.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
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
		Map<ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.printAllProducts();
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
				
		model.addAttribute("products", products);		
		return "main";
	}
	
	@RequestMapping("/main")
	private String homePage(Model model) throws Exception{
		Map<ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.printAllProducts();
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
				
		model.addAttribute("products", products);		
		return "main";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String viewUploadProduct() {
		return "uploadProduct";
	}

}
