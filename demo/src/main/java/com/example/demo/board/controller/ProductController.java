package com.example.demo.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.example.demo.board.domain.ProductVO;
import com.example.demo.board.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource
	ProductService pService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	private String joinPage() {
		return "productDetail";
	}
	
	// 상품 등록
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadProduct(MultipartHttpServletRequest request, Model model) throws Exception {

		ProductVO product = new ProductVO();
		MultipartFile image = request.getFile("image");
		/*
		String originalFile = image.getOriginalFilename();
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		String filePath = "C:\\KITRIRepo\\KITRI_Best\\demo\\src\\main\\webapp\\WEB-INF\\resource\\";

		File file = new File(filePath + storedFileName);
		
		image.transferTo(file);
		*/
		
		
		
		
		product.setId(request.getParameter("id"));
		product.setName(request.getParameter("name"));
		product.setType(request.getParameter("type"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImage(image.getBytes());
		
		System.out.println(image.getBytes());
		
		product.setStatus(request.getParameter("status"));
		//proRepo.save(product);
		
		System.out.println(product.getImage());
		
		pService.productInsertService(product);
		model.addAttribute("msg", "product upload complete");
		return "redirect:/";
	}


	
	// 상품 검색
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchProduct(@RequestParam("search") String search_name, RedirectAttributes redirect) throws Exception{
		
		List<ProductVO> products = pService.findByName(search_name);
		
		System.out.println(products.toString());
//		mav.setViewName("main");
//		mav.addObject("products", products);
		redirect.addFlashAttribute("product", products);
		return "redirect:/";
	}
	


	// 상품 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteProduct(@ModelAttribute @Valid ProductVO product, Model model) throws Exception {
		if (pService.findById(product.getId()) != null) {
			pService.deleteById(product.getId());
			System.out.println("delete");
			model.addAttribute("msg", "delete");
			return "redirect:/";
		}
		model.addAttribute("msg", "no product id");
		return "redirect:/";
	}

	
	// 상품 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateProduct(MultipartHttpServletRequest request, Model model) throws Exception {

		ProductVO product = new ProductVO();
		MultipartFile image = request.getFile("image");
		
		System.out.println(image.getSize());
		System.out.println(image.getOriginalFilename());
		System.out.println(image.getContentType());
		System.out.println(image.getBytes().length);
		
		product.setId(request.getParameter("id"));
		product.setName(request.getParameter("name"));
		product.setType(request.getParameter("type"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImage(image.getBytes());
		product.setStatus(request.getParameter("status"));
		
		pService.updateProduct(product);
		model.addAttribute("msg", "product update complete");
		
		return "redirect:/";
	}
	
	// blob 출력
	public Map blobSave(MultipartFile file) {
		Map<String, Object> param = new HashMap<String, Object>();
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		
		byte[] bytes;
		try {
			bytes = file.getBytes();
			
			try {
				Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
				param.put("file", blob);
				param.put("file_name", fileName);
				param.put("file_size",blob.length());
				
			} catch(SerialException e1) {
				e1.printStackTrace();
			}
		}catch(SQLException e1) {
			e1.printStackTrace();
		}catch(IOException e2) {
			e2.printStackTrace();
		}
		return param;
	}

}
