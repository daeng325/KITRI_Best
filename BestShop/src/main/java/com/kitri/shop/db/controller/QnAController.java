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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String viewUploadQuestionForm(@RequestParam("num") Long pid, @AuthenticationPrincipal SecurityMember secMember, Model model) throws Exception {
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
			String encodedImage = new String(byteImage);
			question.setImage(encodedImage);
			question.setExt(image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".")+1));
		}
		qService.insertQuestion(question);
		return "redirect:/product/detail?num="+pid;
	}
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String viewUpdateQuestion(@RequestParam(value="num") Long pid, @RequestParam(value="checked", required = false) List<Long> qid, @AuthenticationPrincipal SecurityMember secMember ,Model model, RedirectAttributes rttr) throws Exception {
		
		if(qid == null) { // 선택된 항목이 없을 때
			rttr.addFlashAttribute("msg", "checkedNull");
			return "redirect:/product/detail?num="+pid;
		}
		else if(qid.size()!=1) { // 여러 개 선택되었을 때
			rttr.addFlashAttribute("msg", "checkOne");
			return "redirect:/product/detail?num="+pid;
		}
		
		Question question = qService.findByQid(qid.get(0)).get();
		
		if(!question.getU_id().equals(secMember.getUsername())) { //본인이 쓴 Question이 아닐 때
			rttr.addFlashAttribute("msg", "checkId");
			return "redirect:/product/detail?num="+pid;
		}
		
		model.addAttribute("question", question);
		return "q&aeditform";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateQuestion(@ModelAttribute Question question, @RequestParam("image_file") MultipartFile image) throws Exception {
		if (image != null) {
			byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(image.getBytes());
			String encodedImage = new String(byteImage);
			question.setImage(encodedImage);
			question.setExt(image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".")+1));
		}
		qService.updateQuestion(question);
		return "redirect:/product/detail?num="+question.getP_id();
	}
	
	@Secured("ROLE_BASIC")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteQuestion(@RequestParam("num")Long pid, @RequestParam("checked") List<Long> qid, @AuthenticationPrincipal SecurityMember secMember, RedirectAttributes rttr) throws Exception {
		for (Long i : qid) {
			if(!qService.deleteQuestion(i, secMember.getUsername())) {
				rttr.addFlashAttribute("msg", "NotAllowed");
			}
		}
		return "redirect:/product/detail?num="+pid;
	}
	
}
