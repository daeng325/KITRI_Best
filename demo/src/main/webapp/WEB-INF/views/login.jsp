<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.example.demo.board.controller.MemberController" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<%
		String id = request.getParameter("loginid");
		String pwd = request.getParameter("loginpwd");
		
		out.println(id);
		out.println(pwd);
		
		String jdbcUrl="jdbc:mariadb://localhost:3306/testdb";
		String user = "root";
		String passwd = "1234";
		
		// JDBC 참조변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		

		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 2. DB연결
		conn = DriverManager.getConnection(jdbcUrl, user, passwd);
		// 3. id에 해당하는 passwd 가져오기
		String sql = "SELECT pwd FROM members WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		if (rs.next()) {
			System.out.println(rs.getString("pwd"));
			System.out.println(pwd);
			System.out.println(pwd.equals(rs.getString("pwd")));
			// 아이디있음
			if (pwd.equals(rs.getString("pwd"))) {
				System.out.println("Success");
				// 로그인인증 main.jsp로 이동
				session.setAttribute("id", id);
				response.sendRedirect("main.html");
			} 
			else {
				%>
				<script>
					alert('패스워드 틀림');
					history.back();
				</script>		
				<%	
			}
		} else {
			// 아이디없음  뒤로이동
			%>
			<script>
				alert('아이디 없음');
				//location.href = 'loginForm.jsp';  // 서버가 요청을 받는다.
				history.back();  // history.go(-1);  // 서버에 요청없이 브라우저에서 자체적으로 처리
			</script>
			<%
		}
	%>


	<form action="main.html" type="post">	 
	<button type="submit" class="btn btn-primary">ok</button>
</body>

</html>