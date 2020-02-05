package com.example.demo.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.board.domain.MemberVO;

@Controller
@RequestMapping("/qna")
public class QnAController {
	
	@RequestMapping("upload")
	public String QnAUpload(HttpSession session, HttpServletRequest request, Model model) {
		
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO)obj;
		
		if(obj == null) {
			return "login";
		}
		
		model.addAttribute("member", member);
		
		System.out.println("Product Id"+": "+request.getParameter("productId"));
		
		return "q&auploadform";
	}
}
