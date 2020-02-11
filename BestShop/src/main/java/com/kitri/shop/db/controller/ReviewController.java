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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.shop.db.domain.Review;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.ReviewRepository;
import com.kitri.shop.db.service.ReviewService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewRepository revRepo;
	@Autowired
	ReviewService revService;
	
	
	@Secured("ROLE_BASIC")
	@GetMapping(value="upload")
	public ModelAndView uploadReviewPage(Model model, @RequestParam("num") long id, @AuthenticationPrincipal SecurityMember secMember) throws Exception {
		return revService.reviewForm(id, secMember.getUsername());
	}
	
	
	@PostMapping(value="complete")
	public String uploadComplete(@ModelAttribute Review review, @RequestParam("image0") MultipartFile image,
								@RequestParam("image1") MultipartFile image1, @RequestParam("image2") MultipartFile image2
								, @RequestParam("image3") MultipartFile image3, RedirectAttributes rttr) throws IOException {
		
		review = revService.setReview(review, image, image1, image2, image3);			
		revRepo.save(review);
		return "redirect:/";
	}
	
	@GetMapping(value="update")
	public String editReveiwPage(Model model, @RequestParam("rev") long id) {
		
		return "reviewedit";
	}
	
	@GetMapping("delete")
	public String deleteReview() {
		return "";
	}

	
}

