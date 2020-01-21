<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
			<form action="<%= request.getContextPath() %>/signin" method="post">
			<fieldset>
				<legend class="join">회원가입</legend>
					<label for="name">이름</label>
					<input type="text" name="name" placeholder="이름을 입력하세요"><br>
					<label for="sex">성별</label>
					<input type="radio" name="man">남자
					<input type="radio" name="woman">여자<br>
					<label for="age">나이</label>
					<input type="text" name="age" placeholder="만 나이를 입력하세요"><br>
					<label for="phonenum">전화번호</label>
					<input type="tel" name="phone" placeholder="-없이 입력하세요"><br>
					<label for="address">집 주소</label>
					<input type="text" name="address" placeholder="정확한 주소를 입력하세요"><br>
					<label for="emailadd">이메일 주소</label>
					<input type="email" name="email" placeholder="유효한 이메일 주소를 입력하세요"><br>
					<label for="id">아이디</label>
					<input type="text" name="ID" placeholder="아이디를 입력하세요"><br>
					<label for="password">패스워드</label>
					<input type="password" name="pwd" placeholder="패스워드를 입력하세요"><br>
			</fieldset>
			<fieldset>
				<legend class="addinfo">부가정보</legend>
					<p><label for="items">관심있는 아이템</label>
					<input type="checkbox" name="likeit">상의
					<input type="checkbox" name="likeit">하의
					<input type="checkbox" name="likeit">가방
					<input type="checkbox" name="likeit">신발
					<input type="checkbox" name="likeit">액세서리</p>
					<!--type=checkbox : 여러 값을 동시에 선택할 수 있음-->
					<p><label for="agr">개인정보 제공에 동의합니까?</label>
					<input type="radio" name="agree">예
					<input type="radio" name="agree">아니오</p>
					<!--type=radio : 여러 값 중 하나를 선택할 수 있음-->
					<p><label for="agr2">이메일, 문자 수신에 동의합니까?</label>
					<input type="radio" name="agree2">예
					<input type="radio" name="agree2">아니오</p>
			</fieldset>
			<fieldset>
					<span><label for="name"><input type="submit" value="가입"></label><br>
			  		<label for="name"><input type="reset" value="내용 초기화"></label></span>
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