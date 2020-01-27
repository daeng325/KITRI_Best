package com.kitri.shop.db.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.db.service.MemberService;

@Controller
public class MemberController {
	
	@Resource(name="com.kitri.shop.db.service.MemberService")
	MemberService mService;
	
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String viewSignin() {
		return "signin";
	}
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String singinComplete(@ModelAttribute("memberInfo") Member member) throws Exception {
		System.out.println(member.getName());
		System.out.println(member.getID());
		System.out.println(member.getPwd());
		mService.memberInsertService(member);
		return "login";
	}
		
	@RequestMapping("/login")
	public String loginComplete() {
		return "login";
	}	
	
}