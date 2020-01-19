package com.example.demo.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.service.MemberService;

@Controller
public class MemberController {
	
	@Resource(name="com.example.demo.board.service.MemberService")
	MemberService mService;
	
	@RequestMapping("/signin")
	private String singinComplete() {
		return "signin";

	}
	
	
	@RequestMapping("/insertmember")
    private String boardInsertProc(HttpServletRequest request) throws Exception{
        
        MemberVO member = new MemberVO();
        
        member.setName(request.getParameter("name"));
        member.setAge(request.getParameter("age"));
        member.setAgree(request.getParameter("agree"));
        member.setAgree2(request.getParameter("agree2"));
        member.setAddress(request.getParameter("address"));
        member.setEmail(request.getParameter("email"));
        member.setGender(request.getParameter("gender"));
        member.setID(request.getParameter("ID"));
        member.setLikeit(request.getParameter("likeit"));
        member.setName(request.getParameter("name"));
        member.setPhone(request.getParameter("phone"));
        member.setPwd(request.getParameter("pwd"));

        mService.memberInsertService(member);
        
        return "redirect:/main.html";
    }
	
}
