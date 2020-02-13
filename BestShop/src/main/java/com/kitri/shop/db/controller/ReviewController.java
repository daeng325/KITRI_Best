package com.kitri.shop.db.controller;


import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.Order;
import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.domain.Review;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.service.MemberService;
import com.kitri.shop.db.service.OrderService;
import com.kitri.shop.db.service.ProductService;
import com.kitri.shop.db.service.ReviewService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService revService;
	
	@Autowired
	MemberService mService;
	
	@Autowired
	ProductService pService;
	
	@Autowired
	OrderService oService;
	
	@Secured("ROLE_BASIC")
	@GetMapping(value="upload")
//	public ModelAndView uploadReviewPage(Model model, @RequestParam("num") long id, @AuthenticationPrincipal SecurityMember secMember) throws Exception {
//		return revService.reviewForm(id, secMember.getUsername());
//	}
	public String viewReviewUploadPage(Model model, @AuthenticationPrincipal SecurityMember secMember, @RequestParam("num") long oid, RedirectAttributes rttr) throws Exception {
		
		Order order = oService.selectOrderByOid(oid);
		Member member = mService.findByUid(secMember.getUsername()).get();
		Product product = pService.selectProductByPid(order.getP_id());
		Review review = revService.selectReviewByOid(oid);
		
		if(revService.isExistReview(oid)) {			
			rttr.addFlashAttribute("msg", "Duplicate").addFlashAttribute("member", member);
			rttr.addFlashAttribute("review", review);
			return "redirect:/review/update";
		}
		
		model.addAttribute("order", order);
		model.addAttribute("member", member);
		model.addAttribute("product", product);
		return "reviewuploadform";
	}
	
	
	@PostMapping(value="complete")
	public String uploadComplete(@ModelAttribute Review review, @RequestParam("image0") MultipartFile image,
								@RequestParam("image1") MultipartFile image1, @RequestParam("image2") MultipartFile image2
								, @RequestParam("image3") MultipartFile image3, RedirectAttributes rttr) throws IOException {
		
		review = revService.setReview(review, image, image1, image2, image3);		
		revService.insertReview(review);
		return "redirect:/";
	}
	
	@GetMapping(value="update")
	public String editReveiwPage(@AuthenticationPrincipal SecurityMember secMember, Model model) throws Exception {
		return "revieweditform";
	}
	
	@GetMapping("delete")
	public String deleteReview() {
		return "";
	}

	
}

