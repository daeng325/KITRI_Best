package com.kitri.shop.db.controller;

import java.util.List;
import java.util.Map;

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
import com.kitri.shop.db.domain.*;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.MemberRepository;
import com.kitri.shop.db.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	MemberService mService;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String viewJoin(Model model) throws Exception{
		return "join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String singinComplete(@ModelAttribute Member member, RedirectAttributes rttr) throws Exception {
		if(mService.findByUid(member.getId()).isPresent()) { // 중복되는 ID
			rttr.addFlashAttribute("msg", "Duplicate").addFlashAttribute("member", member);
			return "redirect:/user/join";
		}
		
		boolean result = mService.insertMember(member);
		if (result) { // 회원가입 성공
			rttr.addFlashAttribute("msg", "Registered");
			return "redirect:/user/login";
		} else { // 비밀번호 제한
			rttr.addFlashAttribute("msg", "Fail").addFlashAttribute("member", member);
			return "redirect:/user/join";
		}
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
    public String selfUserEdit(@AuthenticationPrincipal SecurityMember secMember, Model model) throws Exception {		
    	Member member = mService.findByUid(secMember.getUsername()).get();
    	model.addAttribute("member", member);	
		return "selfuseredit";	
	}
    

    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute Member member, @RequestParam("pre_pwd") String pre_pwd, @RequestParam("chk_pwd") String chk_pwd,RedirectAttributes rttr) throws Exception{
    	
    	if(!mService.checkPwd(member.getId(), pre_pwd)) { // 이전 패스워드 불일치
    		rttr.addFlashAttribute("msg", "Wrong Password");
    	}else if(pre_pwd.equals(chk_pwd)) { // 이전 패스워드와 변경할 패스워드가 같을 때
    		rttr.addFlashAttribute("msg", "Same");
    	}else if (!member.getPwd().equals(chk_pwd)){ // 변경할 패스워드 체크 시 불일치
    		rttr.addFlashAttribute("msg", "Check");
    	}else { // 회원정보 수정 성공
    		mService.updateMember(member);
        	rttr.addFlashAttribute("msg", "Updated");
    		return "redirect:/user/mypage";
    	}
    	return "redirect:/user/selfuseredit";
	}
    
    @RequestMapping(value="/selfuserout", method = RequestMethod.GET)
	public String selfUserOut() throws Exception {
		return "checkPassword";
	}
    
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public String deleteUser(@AuthenticationPrincipal SecurityMember secMember, @RequestParam("pwd") String pwd, RedirectAttributes rttr) throws Exception {
    	String result = mService.deleteMember(secMember, pwd);
    	if (result == "Deleted") {
    		rttr.addFlashAttribute("msg", result);
    	} else if (result == "Wrong Password") {
    		rttr.addFlashAttribute("msg", result);
    		return "redirect:/user/selfuserout";
    	}
    	return "redirect:/";
    }
    
    @RequestMapping(value="/orderedlist", method = RequestMethod.GET)
    public String userOrderList(@AuthenticationPrincipal SecurityMember secMember, Model model) throws Exception {
    	Map<Order, Product> orders = mService.selectOrderByUid(secMember.getUsername());
    	Member member = mService.findByUid(secMember.getUsername()).get();
    	model.addAttribute("member", member);
    	model.addAttribute("orders", orders);
    	return "orderedlist";
    }
}

