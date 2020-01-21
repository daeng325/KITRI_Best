<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
function login_button() {
	alert("login 완료");
}
</script>

<html lang = "ko"/>
	<head>
		<title>Beautycloset</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
		<meta name="viewport" content="width=1260" user-scalable="yes"/>
		<meta name="description" content="아름다움을 선망하는 모든 남녀의 로망, 뷰티클로젯"/>
		<meta name="keywords" content="여성의류, 남성의류, 상의, 하의, 가방, 신발, 악세사리, 패션"/>
		<meta property="og:type" content="website"/>
		<meta property="og:title" content="beautycloset"/>
		<link rel="stylesheet" href="../css/formain.css" type="text/css"/>
		<link rel="stylesheet" href="" type="text/css"/>
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
		<link rel="stylesheet" href="" type="text/css">
	</head>
	<body>
		<header>
			<div><h1 class="header"><a href="main.html">Beautycloset</a></h1></div>
			<div class="menu">
				<nav class="navbar">
					<a href="top.html">Top</a>
					<a href="bottom.html">Bottom</a>
					<a href="bags.html">Bags&Shoes</a>
					<a href="acce.html">Accesories</a>
					<a href="signin.html">Singin</a>
					<a href="login.html">Login</a>
					<a href="q&a.html">Q&A</a>
					<a href="review.html">Review</a>
				</nav>
			</div>
		</header>
	<section>
		<form action="<%= request.getContextPath() %>/" method="post"> <!-- onsubmit="return LoginComplete();" -->
			<!-- action : 연결할 JSP 페이지, method : post는 해당 사이트에서 다른 페이지로 정보를 보낼때 사용--
				onsubmit : 제출 버튼을 눌렀을때 LoginComplete 기능 동작(반환)-->
			<fieldset>
				<legend class="login"><b>로그인</b></legend>
				<input type="hidden" name="loginhid" value=""/>
				<div class="logininfo" align=center>아이디  <input type="text" name="loginid" placeholder="아이디를 입력하세요"></div>
				<br>
				<div class="logininfo2" align=center>비밀번호 <input type="password" name="loginpwd" placeholder="비밀번호를 입력하세요"></div>
				<div class="loginok" align=center><input type="submit" name="loginok" value="로그인" onclick="login_button()">
				<!--로그인 버튼-->
				<div class="loginreset" align=center><input type="reset" name="loginreset" value="초기화" onclick="">
				<!--초기화 버튼 : 누르기만 하면 자동으로 폼 내용 초기화-->
			</fieldset>
		</form>
		<form action="" method="post">
			<fieldset>
				<legend class="loginforgot"><b>아이디 & 비밀번호 찾기</b></legend>
				<div class="findid" align=center><input type="button" name="findid" value="아이디 찾기" onclick=""></div>
				<!--아이디 찾기 버튼 : 누르면 아이디 찾는 페이지로 이동-->
				<br>
				<div class="findpwd" align=center><input type="button" name="findpwd" value="비밀번호 찾기" onclick=""></div>
				<!--패스워드 찾기 버튼 : 누르면 패스워드 찾는 페이지로 이동-->
			</fieldset>
		</form>
	</section>
	<footer class="bottom">
			<div class="bottom">
				<p id="contact">Contact Us<p>
				<p>Tel. : 010-4022-3241</p>
				<p>E-mail : wsm91@naver.com</p>
				<p>Address : 서울특별시 구로구 구로동 디지털로34길 43</p>
				<p>@Copyright 2020 KITRI 20기 침해대응 2조</p>
				<p>All rights reserved</p>
			</div>
		</footer>
	</body>
</html>