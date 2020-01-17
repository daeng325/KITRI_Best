<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	int age = integer.parseInt(request.getParameter("age"));
	int phone = integer.parseInt(request.getParameter("phone");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	String[] items = request.getParameterValues("items");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String agr = request.getParameter("agr");
	String agr2 = request.getParameter("agr2");

	Connection con = null;
	PreparedStatement pstmt = null;
	
	Class.forName("org.mariadb.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mariadb://100.100.100.7:3306/ESTDB","userId","password");

	String sql = "insert into member(name, gender, age, phone, address, email, items, id, password, agr, agr2) values (?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setInt(3, age);
	pstmt.setInt(4, phone);
	pstmt.setString(5, address);
	pstmt.setString(6, email);
	pstmt.setString(7, items);
	pstmt.setString(8, id);
	pstmt.setString(9, password);
	pstmt.setString(10, agr);
	pstmt.setString(11, agr2);

	pstmt.close();
	con.close();
%>
<script>
	alert('<%=name%>님, 회원가입을 축하합니다');
	location.href = "login.jsp";
</script>