package com.example.demo.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.service.MemberService;

@Controller
public class MemberController {
	
	@Resource
	MemberService mService;
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	private String joinPage() {
		return "join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	private String joinComplete(HttpServletRequest request) throws Exception {
		MemberVO member= new MemberVO();
		member.setID("\'"+request.getParameter("ID")+"\'");
		member.setPwd("\'"+request.getParameter("pwd")+"\'");
		member.setAddress("\'"+request.getParameter("address")+"\'");
		member.setAge(request.getParameter("age"));
		member.setAgree("\'"+request.getParameter("agree")+"\'");
		member.setAgree2("\'"+request.getParameter("agree2")+"\'");
		
		member.setEmail("\'"+request.getParameter("email")+"\'");
		member.setGender("\'"+request.getParameter("gender")+"\'");
		member.setLikeit("\'"+request.getParameter("likeit")+"\'");
		member.setName("\'"+request.getParameter("name")+"\'");
		member.setPhone("\'"+request.getParameter("phone")+"\'");
		
		mService.memberInsertService(member);
				
		return "main";
	}
		
	@RequestMapping(value="/login", method=RequestMethod.GET)
	private String loginPage() {
		return "login";
	}
	
	@RequestMapping(value ="/login", method=RequestMethod.POST)
	private String loginComplete(HttpServletRequest request, ModelMap model) {
		String id = "\'" + request.getParameter("ID")+"\'";
		String pwd = "\'" + request.getParameter("password")+"\'";
		
		List<MemberVO> member = mService.login(id, pwd);
		
		System.out.println(member.size());
		
		if(member.size() != 0) {
			model.addAttribute("msg","welcome" );
			
			
			
			return "loginSuccess";
		}
		model.addAttribute("msg","try again" );
		return "loginFail";
	}	
	
}
