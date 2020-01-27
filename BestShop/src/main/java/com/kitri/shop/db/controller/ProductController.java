package com.kitri.shop.db.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.db.dto.Product;
import com.kitri.shop.repository.ProductRepository;

@Controller
public class ProductController {

	@Autowired
	ProductRepository proRepo;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadComplete(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("price") int price, @RequestParam("description") String description,
			@RequestParam("image") MultipartFile file, @RequestParam("status") String status) throws Exception {

//		// 파일 정보
//		String originFilename = file.getOriginalFilename();
//		String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
//		Long size = file.getSize();
//
//		System.out.println("originFilename" + originFilename);
//		System.out.println("extName" + extName);
//		System.out.println("size" + size);
				
		Product product = new Product(id, name, price, description, file.getBytes(), status);
		proRepo.save(product);
		return "main";
	}
	
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public String displayImage(Model model) {
		String id = "test1";
		if(proRepo.existsById(id)) {
			Product product = proRepo.findById(id).get();
			
			model.addAttribute("img", product.getImage());
			return "display";
		}
		else {
			model.addAttribute("img","no image" );	
			return "display";
		}
	}
}
