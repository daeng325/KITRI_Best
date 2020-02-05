package com.example.demo.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.FilenameUtils;
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
	
	@RequestMapping(value="/edit")
	public String editReview(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO)obj;
		
		if(obj == null) {
			return "login";
		}
		
		model.addAttribute("member", member);
		return "revieweditform";
	}
	
	@RequestMapping(value="/complete", method=RequestMethod.POST)
	public String reviewUploadComplete(HttpSession session, MultipartHttpServletRequest request, Model model) throws Exception {
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
		review.setExt(image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".")+1));
		
		
		try {
			image.transferTo(new File("C:\\Users\\한국정보기술\\Documents\\GitHub\\KITRI_Best\\demo\\src\\main\\resources\\image\\"+image.getOriginalFilename()));
		}catch(IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		reviewService.reviewInsert(review);
			
		return "redirect:/";
	}
		
	// 리뷰 상세 보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String reviewDetailPage(@RequestParam String id, Model model) throws Exception {
		model.addAttribute("review", reviewService.printDetailReview(id));		
		try {			
			byte[] encoded = org.apache.commons.codec.binary.Base64.encodeBase64(reviewService.printDetailReview(id).getImage_1());

			String encodedString = new String(encoded);		
			model.addAttribute("resultimage", encodedString);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "reviewDetail";		
	}

}