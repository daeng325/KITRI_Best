package com.kitri.shop.db.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.repository.MemberRepository;

@Controller
public class AdminController {

	
	@Autowired
	MemberRepository memRepo;
	
	
	@RequestMapping(value="/usermanage", method=RequestMethod.GET)
	public String userManage1(ModelMap model) {
		List<Member> members = (List<Member>) memRepo.findAll();		
		model.addAttribute("users", members);
		return "usermanage";
	}
		
	@RequestMapping(value="/usermanage", method=RequestMethod.POST)
	public String userManage() {		
		return "usermanage";
	}
		
	@RequestMapping(value="/searchUser", method=RequestMethod.POST)
	public String searchUser(HttpServletRequest request, ModelMap model) {
		String userID = request.getParameter("userId");		
		Member member = memRepo.findById(userID).get();
		model.addAttribute("user", member);
		return "searchUser";
	}
	
	
	@RequestMapping(value="/editUser", method=RequestMethod.POST)
	public String editUserDB(HttpServletRequest request, ModelMap model) {		
		
		String userID = request.getParameter("userId");
		Member member = memRepo.findById(userID).get();
		model.addAttribute("user", member);
		return "editUser";
	}

	
	@RequestMapping(value="/deleteUser", method=RequestMethod.GET)
	public String deleteUser() {		
		return "deleteUser";
	}	
	
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	public String deleteUserDB(HttpServletRequest request, ModelMap model) {
		String userID = request.getParameter("userId");
		memRepo.deleteById(userID);
		System.out.println("delete");
		return "usermanage";
	}
	
	
	@RequestMapping(value="/addUser", method=RequestMethod.GET)
	public String addUser() {		
		return "addUser";
	}
	
	@RequestMapping(value="/addUser", method=RequestMethod.POST)
	public String addUsertoDB(@ModelAttribute("memberInfo") Member member) throws Exception {
		
		System.out.println(member.getName());
		System.out.println(member.getID());
		memRepo.save(member);
		
		return "usermanage";
	}
}
