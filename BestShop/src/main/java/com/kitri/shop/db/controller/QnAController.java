package com.kitri.shop.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.domain.Question;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.ProductRepository;
import com.kitri.shop.db.service.MemberService;
import com.kitri.shop.db.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QnAController {
	
	@Autowired
	QuestionService qService;
	
	@Autowired
	ProductRepository pRepo;
	
	@Autowired
	MemberService mService;
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detailQuestion(@RequestParam("id") Long qid, Model model) throws Exception {
		List<Question> questions = qService.selectByQid(qid);
		model.addAttribute("questions", questions);
		return "";
	}
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String insertQuestion(@RequestParam("num") Long pid, @AuthenticationPrincipal SecurityMember secMember, Model model) throws Exception {
		Product product = pRepo.findProductDetail(pid);
		Member member = mService.findByUid(secMember.getUsername()).get();
		model.addAttribute("product", product);
		model.addAttribute("member", member);
		return "q&auploadform";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String uploadQuestion(@RequestParam("num") Long pid, @ModelAttribute Question question) throws Exception {
		qService.insertQuestion(question);
		return "redirect:/product/detail?num="+pid;
	}
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String viewUpdateQuestion() {
		return "q&aeditform";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateQuestion() {
		return "";
	}
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteQuestion() {
		return "";
	}
	
}
