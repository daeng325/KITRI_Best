package com.kitri.shop.db.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.shop.db.domain.Order;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.MemberRepository;
import com.kitri.shop.db.repository.OrderRepository;
import com.kitri.shop.db.repository.ProductRepository;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	ProductRepository proRepo;
	@Autowired
	MemberRepository memRepo;
	@Autowired
	OrderRepository orderRepo;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String viewOrderPage(Model model, @AuthenticationPrincipal SecurityMember secMember, @RequestParam("or") long id) {
		model.addAttribute("member", memRepo.findById(secMember.getUsername()).get());
		model.addAttribute("product", proRepo.findProductDetail(id));		
		return "order";
	}
	
	@RequestMapping(value="/purchase", method=RequestMethod.POST)
	public String completeOrderPage(@ModelAttribute Order order, Model model) {
		orderRepo.save(order);
		// model.addAttribute("order",order);
		// return "purchase";
		return "redirect:/";
	}
	
	@RequestMapping(value="/complete", method = RequestMethod.POST)
	public String complete(@ModelAttribute Order order, HttpServletRequest req) {
		for(int i=0;i<5;i++)System.out.println();
		System.out.println(order==null);
		for(int i=0;i<5;i++)System.out.println();
		
		return "";
	}
}
