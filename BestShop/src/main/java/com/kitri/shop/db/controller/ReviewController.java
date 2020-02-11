package com.kitri.shop.db.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.shop.db.domain.Review;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.ProductRepository;
import com.kitri.shop.db.repository.ReviewRepository;
import com.kitri.shop.db.service.MemberService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewRepository revRepo;
	@Autowired
	ProductRepository proRepo;
	@Autowired
	MemberService mService;
	
	@Secured("ROLE_BASIC")
	@GetMapping(value="upload")
	public String uploadReviewPage(Model model, @RequestParam("num") long id, @AuthenticationPrincipal SecurityMember secMember) throws Exception {
		model.addAttribute("product", proRepo.findProductDetail(id));
		model.addAttribute("member", mService.findByUid(secMember.getUsername()).get());
		return "reviewuploadform";
	}
	
	
	@PostMapping(value="complete")
	public String uploadComplete() {

		for(int i=0;i<5;i++)System.out.println();
		//System.out.println(review==null);
		for(int i=0;i<5;i++)System.out.println();
		
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
	

//	@RequestMapping(value="/reviewupload")
//	public String viewUploadProduct(HttpSession session, HttpServletRequest request, Model model) throws IOException {
//		
//		Object obj = session.getAttribute("login");
//		MemberVO member = (MemberVO)obj;
//		
//		if(obj == null) {
//			return "login";
//		}
//		
//		model.addAttribute("member", member);
//		return "reviewuploadform";
//	}
	
//	@RequestMapping(value="/upload", method=RequestMethod.GET)
//	public String viewUploadReview(HttpSession session, @ModelAttribute Review review_obj, Model model) throws Exception{
//		revRepo.save(review_obj);
//		return "reviewuploadform";
//	}
	
	
	
//	@RequestMapping(value="/reviewcomplete", method=RequestMethod.POST)
//	public String viewUploadComplete(HttpSession session, MultipartHttpServletRequest request) throws Exception {
//		ReviewVO review = new ReviewVO();
//		
//		Object obj = session.getAttribute("login");
//		MemberVO member = (MemberVO)obj;
//
//		MultipartFile image = request.getFile("image");
//		
//		review.setId("\'"+request.getParameter("boardtitle")+"\'");
//		review.setO_id("\'order01\'");
//		review.setU_id("\'" + member.getID() + "\'");
//		review.setContent("\'" +request.getParameter("content") + "\'");
//		review.setImage_1(image.getBytes());
//		
//		
//		review.setRev_price(Double.parseDouble(request.getParameter("revprice")));
//		review.setRev_agv(Double.parseDouble(request.getParameter("revagv")));
//		review.setRev_quality(Double.parseDouble(request.getParameter("revquality")));
//		review.setRev_ship(Double.parseDouble(request.getParameter("revship")));
//		
//		System.out.println(review.getId());
//		System.out.println(review.getO_id());
//		System.out.println(review.getU_id());
//		System.out.println(review.getContent());
//		System.out.println(review.getImage_1());
//		
//		System.out.println(review.getRev_agv());
//		System.out.println(review.getRev_price());
//		System.out.println(review.getRev_quality());
//		System.out.println(review.getRev_ship());
//		
//		
//		reviewService.reviewInsert(review);
//		
//
//		
//		return "redirect:/";
//	}
	
	
	

//	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
//	public ModelAndView productDetailPage(@RequestParam String id) throws Exception {
//		ModelAndView mov = new ModelAndView();
//		
//		mov.setViewName("reviewDetail");
//		mov.addObject("reviews",reviewService.printDetailReview("\'"+id+"\'"));
//		
//		return mov;
//	}
	
}

