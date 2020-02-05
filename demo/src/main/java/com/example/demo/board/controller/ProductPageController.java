package com.example.demo.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.board.domain.ProductVO;
import com.example.demo.board.service.ProductService;
import com.example.demo.board.service.ReviewService;

@Controller
public class ProductPageController {
	
	@Resource
	ProductService pService;	
	@Resource
	ReviewService reviewService;
	
	@RequestMapping(value = "/top")
	public String topPageLoad(Model model) throws Exception {
		Map<ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.printProductsByType("top");
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
				
		model.addAttribute("products", products);	
		return "top";
	}

	@RequestMapping(value = "/bottom")
	public String bottomPageLoad(Model model) throws Exception {		
		Map<ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.printProductsByType("bottom");
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
				
		model.addAttribute("products", products);		
		
		return "bottom";
	}

	@RequestMapping(value = "/bags")
	public String bag_shoesPageLoad(Model model) throws Exception {
		Map<ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.printProductsByType("bags");
		productList.addAll(pService.printProductsByType("shoes"));
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
		
		model.addAttribute("products", products);		
		return "bags";
	}	
	
	@RequestMapping(value = "/acce")
	public String AccesoriesPageLoad(Model model) throws Exception {
		Map<ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.printProductsByType("accesorie");
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
				
		model.addAttribute("products", products);		
		return "acce";
	}	
	
	// 상품 상세 보기
	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
	public String productDetailPage(@RequestParam String id, Model model) throws Exception {
		ProductVO product = pService.findById(id);
		
		model.addAttribute("products", product);		
		model.addAttribute("reviews", reviewService.readAllReview());
		try {			
			byte[] encoded = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encodedString = new String(encoded);		
			model.addAttribute("resultimage", encodedString);			
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
		
		
		/*
		ModelAndView mov = new ModelAndView();
		
		mov.setViewName("productDetail");
		mov.addObject("products",pService.findById(id));
		mov.addObject("reviews",reviewService.readAllReview());
		
		return mov;
		*/
		return "productDetail";
	}
}
