<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.kitri.shop.db.controller.MemberController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원가입 완료</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="/insertmember" method="post">

	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		
		out.println(name);
		
		String gender = request.getParameter("man");
		out.println(gender);
		
		String ge = request.getParameter("woman");
		out.println(ge);
		
		String ID = request.getParameter("ID");
		out.println(ID);
		
		
	%>
	
	<input type=hidden name="name" value="name">
	<input type=hidden name="ID" value="id">
	<!-- 
	<input type=hidden name="ID" value=<%=ID %>> -->
	<button type="submit" class="btn btn-primary">ok</button>
</body>
</html>