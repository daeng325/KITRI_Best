package com.kitri.shop.db.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.repository.ProductRepository;
import com.kitri.shop.response.ApiResponseMessage;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductRepository proRepo;
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/upload", method=RequestMethod.GET)
   	public String viewUpload() throws Exception{
   		return "productadd";
   	}
	
	// 
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadProduct(@RequestParam("id") Long id, @RequestParam("name") String name,
			@RequestParam("type") String type, @RequestParam("price") int price,
			@RequestParam("description") String description, @RequestParam("image") MultipartFile file,
			@RequestParam("status") String status) throws Exception {

		Product product = new Product(id, name, type, price, description, file.getBytes(), status);
		proRepo.save(product);
		return "redirect:/";
	}


	// 
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchProduct(@RequestParam("search") String search_name, RedirectAttributes redirect) throws Exception{
		
		List<Product> products = proRepo.findByName(search_name);
		redirect.addFlashAttribute("product", products);
		return "redirect:/";
	}

	// 
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody ApiResponseMessage deleteProduct(@ModelAttribute @Valid Product product, Model model) {
		if (proRepo.existsById(product.getId().toString())) {
			proRepo.deleteById(product.getId().toString());
			System.out.println("delete");
			return new ApiResponseMessage("200", "delete");
		}
		else {
			return new ApiResponseMessage("200", "delete", "PDE" ,"Product Doesn't Exist");
		}
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String updateProductPage() {
		return "";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateProduct(@RequestParam("id") Long id, @RequestParam("name") String name,
			@RequestParam("type") String type, @RequestParam("price") int price,
			@RequestParam("description") String description, @RequestParam("image") MultipartFile file,
			@RequestParam("status") String status, Model model) throws Exception {
		if (proRepo.existsById(id.toString())) {
			Product product = new Product(id, name, type, price, description, file.getBytes(), status);
			proRepo.save(product);
			ApiResponseMessage result = new ApiResponseMessage("200", "update");
			model.addAttribute("result", result);
			return "redirect:/";
		}
		else {
			ApiResponseMessage result = new ApiResponseMessage("200", "update", "PDE" ,"Product Doesn't Exist");
			model.addAttribute("result", result);
			return "redirect:/";
		}
	}
}
