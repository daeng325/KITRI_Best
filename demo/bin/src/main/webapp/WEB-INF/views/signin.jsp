<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.example.demo.board.controller.MemberController" %>
<%@ page import="com.example.demo.board.domain.MemberVO" %>
<%@ page import="com.example.demo.board.service.MemberService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원가입 완료</title>
</head>
<body>
	<h1>회원가입</h1>
	 

	
	<%
	
		request.setCharacterEncoding("UTF-8");
		
		/*
		String name = request.getParameter("name");		
		String age = request.getParameter("age");
		String agree = request.getParameter("agree");
		String agree2=request.getParameter("agree2");
		String address=request.getParameter("address");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String ID = request.getParameter("ID");
		String likeit = request.getParameter("likeit");
		String phone = request.getParameter("phone");
		String pwd = request.getParameter("pwd");
		*/
		String ID = request.getParameter("ID");
		String name = request.getParameter("name");		
		
		
     
		MemberVO member = new MemberVO();
		MemberService mService = new MemberService();		

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
		
		
		out.println(ID);
		out.println(name);
		


		
	%>
	
	

	<form action="main.html" type="post">	 
	<button type="submit" class="btn btn-primary">ok</button>

</body>
</html>