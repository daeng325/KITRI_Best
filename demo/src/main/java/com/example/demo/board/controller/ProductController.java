package com.example.demo.board.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

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

		product.setId(request.getParameter("id"));
		product.setName(request.getParameter("name"));
		product.setType(request.getParameter("type"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setDescription(request.getParameter("description"));
		product.setImage(image.getBytes());
		
		System.out.println(image.getBytes());
		
		product.setStatus(request.getParameter("status"));
		
		System.out.println(product.getImage());
		
		pService.productInsertService(product);
		model.addAttribute("msg", "product upload complete");
		return "redirect:/";
	}


	
	// 상품 검색
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchProduct(@RequestParam("search") String search_name, RedirectAttributes redirect) throws Exception{
		Map <ProductVO, String> products = new HashMap<ProductVO, String>();
		List<ProductVO> productList = pService.findByName(search_name);
		
		for(int i=0;i<productList.size();i++) {
			ProductVO product = productList.get(i);
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(product.getImage());
			String encoded = new String(byteImage);
			products.put(product, encoded);
		}
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

}
