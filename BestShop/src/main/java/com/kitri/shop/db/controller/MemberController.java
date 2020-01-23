package com.kitri.shop.db.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.repository.MemberRepository;

@Controller
public class MemberController {
	
	@Autowired
	MemberRepository memRepo;
	
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String viewSignin() {
		return "signin";
	}
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String singinComplete(@ModelAttribute("memberInfo") Member member) throws Exception {
		System.out.println(member.getName());
		System.out.println(member.getID());
		// try-catch문 필요
		memRepo.save(member);
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLogin() {
		return "login";
	}
		
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginComplete(
			@RequestParam(value="loginid") String id,
			@RequestParam(value="loginpwd") String pwd,
			HttpServletRequest request,
			ModelMap model){
		
		if(memRepo.existsById(id)) {
			Member member = memRepo.findById(id).get();
			
			if(pwd.equals(member.getPwd())) {
				model.addAttribute("msg","welcome" );
				return "loginSuccess";
			}
			else {
				model.addAttribute("msg","incorrect pw" );
				return "loginFail";
			}
		}
		else {
			model.addAttribute("msg","no id" );	
			return "loginFail";
		}
	}
}

