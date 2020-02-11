package com.kitri.shop.db.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnAController {
	
	@Secured("ROLE_BASIC")
	@GetMapping("upload")
	public String insertQuestion() {
		return "q&auploadform";
	}
	
	@GetMapping("update")
	public String updateQuestion() {
		return "q&aeditform";
	}
	
	@PostMapping("complete")
	public String updateComplete() {
		return "";
	}
	
}
