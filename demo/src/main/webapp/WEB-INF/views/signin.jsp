<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.example.demo.board.controller.MemberController" %>
<%@ page import="com.example.demo.board.domain.MemberVO" %>
<%@ page import="com.example.demo.board.service.MemberService" %>

<%@ page import="java.sql.*" %>

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
	
		Connection conn = null;
    	PreparedStatement pstmt = null;		

		
		
		
	    try{
			String jdbcUrl="jdbc:mariadb://localhost:3306/testdb";
			String user = "root";
			String passwd = "1234";
			
			 Class.forName("oracle.jdbc.driver.OracleDriver");
		     conn = DriverManager.getConnection(jdbcUrl, user, passwd);
		     
		     System.out.println(conn + "  <--conn");
		     System.out.println(conn.getClass() + "  <-- conn.getClass()");
		     
		     String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?)";
		     pstmt = conn.prepareStatement(sql);
		     
		     
		     System.out.println(pstmt + "  <-- pstmt 1");
		     System.out.println(pstmt.getClass() + "  <-- pstmt.getClass() 1");
		     
		     pstmt.setString(1,name);
		     pstmt.setString(2,gender);
		     pstmt.setString(3,age);
		     pstmt.setString(4,phone);
		     pstmt.setString(5,address);
		     pstmt.setString(6,email);
		     pstmt.setString(7,ID);
		     pstmt.setString(8,pwd);
		     pstmt.setString(9,likeit);
		     pstmt.setString(10,agree);
		     pstmt.setString(11,agree2);
		     
		     System.out.println(pstmt + "  <-- pstmt 2");
		     
		     pstmt.executeUpdate();
		     
	    } catch(Exception e){
	    	e.printStackTrace();
	    }finally{
	    	if(pstmt!=null){
	    		try{
	    			pstmt.close();
	    		}
	    		catch(SQLException sqle){}
	    	}
	    	if(conn != null) {
	    		try{
	    			conn.close();
	    		}
	    		catch(SQLException sqle){}
	    	}
	    }
	   
     	/*
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
		*/
		
		out.println(ID);
		out.println(name);
		


		
	%>
	
	

	<form action="main.html" type="post">	 
	<button type="submit" class="btn btn-primary">ok</button>

</body>
</html>