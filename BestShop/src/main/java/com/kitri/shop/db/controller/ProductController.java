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
import com.kitri.shop.db.domain.Question;
import com.kitri.shop.db.domain.Review;
import com.kitri.shop.db.repository.OrderRepository;
import com.kitri.shop.db.repository.ProductRepository;
import com.kitri.shop.db.service.QuestionService;
import com.kitri.shop.db.service.ReviewService;
import com.kitri.shop.response.ApiResponseMessage;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductRepository proRepo;
	@Autowired
	ReviewService rService;
	@Autowired
	OrderRepository orderRepo;
	@Autowired
	QuestionService qService;
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/upload", method=RequestMethod.GET)
   	public String viewUpload() throws Exception{
   		return "productadd";
   	}
	
	// 
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadProduct(@RequestParam("name") String name,
			@RequestParam("type") String type, @RequestParam("price") int price,
			@RequestParam("description") String description, @RequestParam("image_thumbnail") MultipartFile image_thumbnail, 
			@RequestParam("image_detail") MultipartFile image_detail, @RequestParam("count") int count,
			@RequestParam("image") MultipartFile image, @RequestParam("status") String status) throws Exception {

		
		byte[] byteThumbnailImage = org.apache.commons.codec.binary.Base64.encodeBase64(image_thumbnail.getBytes());
		String encodedThumbnailImage = new String(byteThumbnailImage);

		byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(image.getBytes());
		String encodedImage = new String(byteImage);
		
		byte[] byteDetailImage = org.apache.commons.codec.binary.Base64.encodeBase64(image_detail.getBytes());
		String encodedDetailImage = new String(byteDetailImage);	
		
		Product product = new Product(name, type, price, description, encodedThumbnailImage, encodedDetailImage, count, encodedImage, status);
		String s1 = product.getImage();
		String s2 = product.getImage_thumbnail();
		
		System.out.println(s1.length());
		System.out.println(s2.length());
		System.out.println(s1.equals(s2));
		
		proRepo.save(product);
		return "redirect:/admin/productmanage";
	}


	// 
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchProduct(@RequestParam("search") String search_name, RedirectAttributes redirect) throws Exception{
		
		List<Product> products = proRepo.selectProductByName(search_name);
		redirect.addFlashAttribute("product", products);
		return "redirect:/";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detailProduct(@RequestParam("num") long id, Model model) throws Exception {
		Product product = proRepo.findProductDetail(id);

		
		List<Review> reviews = rService.prouctsReviews(id);
		List<Question> questions = qService.selectByPid(id);
		
		model.addAttribute("products",product);
		model.addAttribute("reviews",reviews);
		model.addAttribute("questions", questions);
		
		return "productDetail";
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
	
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String updateProduct(Model model, @RequestParam("product_name") String name,
//			@RequestParam("type") String type, @RequestParam("price") int price,
//			@RequestParam("description") String description, @RequestParam("image_thumbnail") MultipartFile image_thumbnail, 
//			@RequestParam("image_detail") MultipartFile image_detail, @RequestParam("count") int count,
//			@RequestParam("image") MultipartFile image, @RequestParam("status") String status) {
//			Product product = new Product(name, type, price, description, image_thumbnail.getBytes(), image_detail.getBytes(), count, image.getBytes(), status);
//
//			proRepo.save(product);
//			ApiResponseMessage result = new ApiResponseMessage("200", "update");
//			model.addAttribute("result", result);
//			return "redirect:/";
//		}
//		else {
//			ApiResponseMessage result = new ApiResponseMessage("200", "update", "PDE" ,"Product Doesn't Exist");
//			model.addAttribute("result", result);
//			return "redirect:/";
//		}
//	}
}
