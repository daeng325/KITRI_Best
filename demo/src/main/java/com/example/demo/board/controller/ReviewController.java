package com.example.demo.board.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.domain.ReviewVO;
import com.example.demo.board.service.ReviewService;

@Controller
public class ReviewController {
	@Resource
	ReviewService reviewService;

	@RequestMapping(value="/reviewupload")
	public String viewUploadProduct(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO)obj;
		
		if(obj == null) {
			return "login";
		}
		
		model.addAttribute("member", member);
		return "reviewuploadform";
	}
	
	@RequestMapping(value="/reviewcomplete", method=RequestMethod.POST)
	public String viewUploadComplete(HttpSession session, MultipartHttpServletRequest request) throws Exception {
		ReviewVO review = new ReviewVO();
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO)obj;

		MultipartFile image = request.getFile("image");
		
		review.setId("\'"+request.getParameter("boardtitle")+"\'");
		review.setO_id("\'top_01\'");
		review.setU_id("\'" + member.getID() + "\'");
		review.setContent("\'" +request.getParameter("content") + "\'");
		review.setImage_1(image.getBytes());
		
		
		review.setRev_price(Double.parseDouble(request.getParameter("revprice")));
		review.setRev_agv(Double.parseDouble(request.getParameter("revagv")));
		review.setRev_quality(Double.parseDouble(request.getParameter("revquality")));
		review.setRev_ship(Double.parseDouble(request.getParameter("revship")));
		
		System.out.println(review.getId());
		System.out.println(review.getO_id());
		System.out.println(review.getU_id());
		System.out.println(review.getContent());
		System.out.println(review.getImage_1());
		
		System.out.println(review.getRev_agv());
		System.out.println(review.getRev_price());
		System.out.println(review.getRev_quality());
		System.out.println(review.getRev_ship());
		
		
		reviewService.reviewInsert(review);
		

		
		return "redirect:/";
	}
}
