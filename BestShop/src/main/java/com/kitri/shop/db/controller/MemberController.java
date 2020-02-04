package com.kitri.shop.db.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.db.dto.MemberRole;
import com.kitri.shop.db.repository.MemberRepository;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	MemberRepository memRepo;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String viewJoin(Model model) throws Exception{
		return "join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String singinComplete(@ModelAttribute Member member) throws Exception {
		System.out.println("hello world");
		MemberRole role = new MemberRole();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		role.setRoleName("BASIC");
		member.setRoles(Arrays.asList(role));
		memRepo.save(member);
		return "redirect:/";
	}
		
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLogin(Model model) throws Exception{
		return "login";
	}
    
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginComplete(
			@RequestParam(value="ID") String id,
			@RequestParam(value="password") String pwd,
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

