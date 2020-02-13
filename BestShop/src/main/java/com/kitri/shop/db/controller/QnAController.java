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
import org.springframework.web.multipart.MultipartFile;

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
	public String uploadQuestion(@RequestParam("num") Long pid, @RequestParam("image_file") MultipartFile image, @ModelAttribute Question question) throws Exception {
		if(image != null) {
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(image.getBytes());
			question.setImage(byteImage);
		}
		qService.insertQuestion(question);
		return "redirect:/product/detail?num="+pid;
	}
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String viewUpdateQuestion(@RequestParam("checked") List<Long> qid, Model model) {
		System.out.println("--------------------=====================================");
		System.out.println(qid);
		System.out.println("--------------------=====================================");
		model.addAttribute("checked", qid);
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
