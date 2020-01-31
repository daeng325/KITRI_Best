package com.example.demo.board.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.service.MemberService;

@Controller
public class MemberController {

	@Resource
	MemberService mService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	private String joinPage() {
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	private String joinComplete(HttpServletRequest request) throws Exception {
		MemberVO member = new MemberVO();
		member.setID("\'" + request.getParameter("ID") + "\'");
		member.setPwd("\'" + request.getParameter("pwd") + "\'");
		member.setAddress("\'" + request.getParameter("address") + "\'");
		member.setAge(request.getParameter("age"));
		member.setAgree("\'" + request.getParameter("agree") + "\'");
		member.setAgree2("\'" + request.getParameter("agree2") + "\'");

		member.setEmail("\'" + request.getParameter("email") + "\'");
		member.setGender("\'" + request.getParameter("gender") + "\'");
		member.setLikeit("\'" + request.getParameter("likeit") + "\'");
		member.setName("\'" + request.getParameter("name") + "\'");
		member.setPhone("\'" + request.getParameter("phone") + "\'");

		mService.memberInsertService(member);

		return "redirect:";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	private String loginPage(Model model, @CookieValue(value = "loginCookie", required = false) Cookie storeIdCookie) {
		if (storeIdCookie != null) {
			model.addAttribute("loginInfo", storeIdCookie.getValue());
			model.addAttribute("storeID", true);
			return "login";
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	private String loginComplete(@RequestParam("ID") String id, @RequestParam("password") String pwd, @RequestParam(value="remember",required = false) String remember, HttpSession session, HttpServletResponse response,
			ModelMap model) throws Exception {

		// 기존에 "login"이란 세션이 존재한다면 기존값 제거
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}

//		String id = "\'" + request.getParameter("ID") + "\'";
//		String pwd = "\'" + request.getParameter("password") + "\'";

		List<MemberVO> member = mService.login(id, pwd);
		// 로그인 성공
		if (member.size() != 0) {
			MemberVO mem = member.get(0);

			model.addAttribute("msg", "welcome");
			session.setAttribute("login", mem);
			
			// 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청 왔는지 확인
			if (remember != null) { // request.getParameter("remember").equals("on")
				System.out.println("remember input on");
				System.out.println(session.getId());

				// 쿠키 생성 및 설정
				int amount = 60;
				Cookie cookie = new Cookie("loginCookie", session.getId());
				cookie.setPath("/");
				cookie.setMaxAge(amount);
				response.addCookie(cookie);

				// currentTimeMillis()가 1/1000초 단위 -> 1000 곱한 후 더함
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				System.out.println(sessionLimit);

				// 현재 세션 id와 유효시간을 사용자 테이블에 저장
				String memId = "\'" + mem.getID() + "\'";
				String sessionId = "\'" + session.getId() + "\'";
				mService.keepLogin(memId, sessionId, sessionLimit);
			}
			return "redirect:";
		}
		session.setAttribute("login", null);
		model.addAttribute("msg", "try again");
		return "loginFail";
	}

	/*
	 * @RequestMapping("/logout") public String logout(HttpSession session) {
	 * //session.invalidate(); // 세션 전체 날림 session.removeAttribute("login"); // 세선
	 * 하나씩 날릴 때 return "main"; }
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			// null이 아닐 경우 제거
			MemberVO member = (MemberVO) obj;
			member = sessionExpire(session, request, response, member);
		}

		return "redirect:";

	}

	@RequestMapping("/mypage")
	public String myPage() {
		return "mypage";
	}

	@RequestMapping(value = "/selfuseredit", method = RequestMethod.GET)
	public String selfUserEdit(HttpSession session, HttpServletRequest request, Model model) {

		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO) obj;

		model.addAttribute("member", member);

		return "selfuseredit";
	}

	@RequestMapping(value = "/selfuseredit", method = RequestMethod.POST)
	public String selfUserEditComplete(HttpSession session, HttpServletRequest request) {
		Object obj = session.getAttribute("login");
		MemberVO member = (MemberVO) obj;

		member.setAddress("\'" + request.getParameter("address") + "\'");
		member.setAge(request.getParameter("age"));
		member.setAgree("\'" + request.getParameter("agree") + "\'");
		member.setAgree2("\'" + request.getParameter("agree2") + "\'");
		member.setEmail("\'" + request.getParameter("email") + "\'");
		member.setLikeit("\'" + request.getParameter("likeit") + "\'");
		member.setName("\'" + request.getParameter("name") + "\'");
		member.setPhone("\'" + request.getParameter("phone") + "\'");
		member.setPwd("\'" + request.getParameter("password") + "\'");
		member.setID("\'" + member.getID() + "\'");
		member.setGender("\'" + member.getGender() + "\'");

		mService.selfuseredit(member);

		return "redirect:/mypage";
	}
	
	@RequestMapping(value="/selfuserout")
	public String selfUserOut(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		if (member != null) {
			// null이 아닐 경우 제거
			member = sessionExpire(session, request, response, member);
		}
		
		mService.selfuserout("\'" + member.getID() + "\'");
		return "redirect:";
	}
	
	
	public MemberVO sessionExpire(HttpSession session, HttpServletRequest request, HttpServletResponse response, MemberVO member) {

		session.removeAttribute("login");
		session.invalidate();

		// 쿠키 확인
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

		if (loginCookie != null) {
			// null이 아니면 (존재)
			loginCookie.setPath("/");
			// 쿠키는 없앨 때 유효시간을 0으로 설정
			loginCookie.setMaxAge(0);
			// 쿠키 설정 적용
			response.addCookie(loginCookie);

			String memId = "\'" + member.getID() + "\'";
			String sessionId = "\'" + session.getId() + "\'";
			// 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅
			Date date = new Date(System.currentTimeMillis());
			mService.keepLogin(memId, sessionId, date);
		}
		return member;	
	}
	
}
