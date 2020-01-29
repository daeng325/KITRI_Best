package com.example.demo.board.interceptor;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.service.MemberService;

// 로그인처리 담당 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MemberService mService;
	
	// preHandle() : 컨트롤러보다 먼저 수행 - controller 요청으로 갈 수 있는지 판단
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		// session 객체 가져옴
		HttpSession session = request.getSession();
		
		// login 처리 담당 사용자 정보를 담고 있는 객체 가져옴
		Object obj = session.getAttribute("login");
		
		
		/*
		 * 로그인 된 세션이 없는 경우, 우리가 만든 쿠키 꺼내 옴
		 */
		if(obj == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {	// 쿠키가 존재하는 경우 (이전 로그인 때 생성된 쿠키가 존재)
				String sessionId = loginCookie.getValue();	// loginCookie의 값을 꺼내옴 (저장해논 세션ID)
				MemberVO member = mService.checkUserWithSessionKey(sessionId);	// 이전에 로그인한 적 있는지 체크
				
				if(member != null) {	// 있다면, 세션 생성
					session.setAttribute("login", member);
					return true;
				}
				
			}
			// 로그인 안되있음 && 쿠키도 존재하지 않음 - 다시 로그인 폼으로 돌려보냄
			response.sendRedirect("/login");
			return false;
		}
		return true;	// true : controller로 갈 수 있음 의미
	}

	
	// 컨트롤러가 수행되고 화면에 보여지기 직전 수행되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
