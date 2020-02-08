package com.kitri.shop.db.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.MemberRole;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.MemberRepository;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	MemberRepository memRepo;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String viewJoin(Model model) throws Exception{
		return "join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String singinComplete(@ModelAttribute Member member, RedirectAttributes rttr) throws Exception {
		MemberRole role = new MemberRole();
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		role.setRoleName("BASIC");
		member.setRoles(Arrays.asList(role));
		memRepo.save(member);
		rttr.addFlashAttribute("msg", "Registered");
		return "redirect:/user/login";
	}
		
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLoginForm(HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		req.getSession().setAttribute("prevPage", referer);
		return "login";
	}
    
    @RequestMapping(value="/loginFail", method=RequestMethod.GET)
	public String loginFail() {
		return "loginFail";
	}
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
    	return "logout";
	}
    
    @RequestMapping(value="/denied", method=RequestMethod.GET)
    public String accessDenied() {
    	return "accessDenied";
    }
    
    @RequestMapping("/mypage")
	public String myPage(){
		return "mypage";
	}
    
    @RequestMapping(value = "/selfuseredit", method = RequestMethod.GET)
	public String viewUpdateUser() {
    	return "selfuseredit";
	}
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute @Valid Member member) throws Exception{
    	member.setPwd(passwordEncoder.encode(member.getPwd()));
    	memRepo.updateMember(member);
		return "redirect:/user/mypage";
	}
    
    @RequestMapping(value="/selfuserout", method = RequestMethod.GET)
	public String selfUserOut() throws Exception {
		return "checkPassword";
	}
    
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public String deleteUser(@AuthenticationPrincipal SecurityMember secMember, @RequestParam("pwd") String pwd, RedirectAttributes rttr) {
    	if(memRepo.existsById(secMember.getUsername())) {
    		if(passwordEncoder.matches(pwd, memRepo.checkPassword(secMember.getUsername()))) {
    			memRepo.deleteById(secMember.getUsername());
    			rttr.addFlashAttribute("msg", "Deleted");
    		}
    		else {
    			rttr.addFlashAttribute("msg", "Wrong Password");
    			return "redirect:/user/selfuserout";
    		}
    	}
    	return "redirect:/";
    }
}

