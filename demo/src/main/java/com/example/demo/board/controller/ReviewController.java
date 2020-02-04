package com.example.demo.board.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.domain.ReviewVO;
import com.example.demo.board.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Resource
	ReviewService reviewService;

	@RequestMapping(value="/upload")
	public String uploadReview(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO)obj;
		
		if(obj == null) {
			return "login";
		}
		
		model.addAttribute("member", member);
		return "reviewuploadform";
	}
	
	@RequestMapping(value="/complete", method=RequestMethod.POST)
	public String viewUploadComplete(HttpSession session, MultipartHttpServletRequest request) throws Exception {
		ReviewVO review = new ReviewVO();
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO)obj;

		MultipartFile image = request.getFile("image");
		
		review.setId(request.getParameter("boardtitle"));
		review.setO_id("order01");
		review.setU_id(member.getID());
		review.setContent(request.getParameter("content"));
		review.setImage_1(image.getBytes());
				
		review.setRev_price(Double.parseDouble(request.getParameter("revprice")));
		review.setRev_agv(Double.parseDouble(request.getParameter("revagv")));
		review.setRev_quality(Double.parseDouble(request.getParameter("revquality")));
		review.setRev_ship(Double.parseDouble(request.getParameter("revship")));
		
				
		reviewService.reviewInsert(review);
			
		return "redirect:/";
	}
	
	
	// 리뷰 상세 보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView reviewDetailPage(@RequestParam String id, Model model) throws Exception {

		ModelAndView mov = new ModelAndView();
		mov.setViewName("reviewDetail");
		mov.addObject("reviews",reviewService.printDetailReview(id));		
		return mov;
		/*
		ReviewVO review = reviewService.printDetailReview(id);
		model.addAttribute("reviews",review);
		
		return "reviewDetail";
		*/
	}
	
}