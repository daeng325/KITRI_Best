<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c-rt" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt-rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Beautycloset</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<style type="text/css">
.jumbotron {
	background-image: url('./jpg/flower.jpg');
	background-size: cover;
	text-shadow: black 0.2px 0.2px 0.2px;
	color: blue;
	font-weight: bold;
	opacity: 0.5;
	filter: alpha(opacity = 50);
}

.logo {
	font-family: 'Segoe Print';
	font-size: 100px;
	margin-top: 100px;
	margin-bottom: 100px;
}

* a {
	text-decoration: none;
	color: black;
}
</style>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="">Home</a></li>
			<li class="nav-item">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link" href="user/login">Login</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="user/logout">Logout</a>
				</sec:authorize>
			</li>
			<li class="nav-item">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link" href="user/join">Join</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="user/mypage">Mypage</a>
				</sec:authorize>
			</li>
		</ul>
		<form class="form-inline"
			action="<% request.getContextPath(); %>/product/search" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input class="form-control mr-sm-2"
				type="text" placeholder="Search" name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
	</nav>
	<div class="container">
		<div class="logo">
			<h1 class="text-center">
				<a href="<% request.getContextPath(); %>/main">Beautycloset</a>
			</h1>
		</div>
	</div>
	<div class="container-fluid">
		<ul class="nav justify-content-center">
                <li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/top">Top</a></li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/bottom">Bottom</a></li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/bag">Bags & Shoes</a></li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/accesorie">Accesories</a></li>
		</ul>
	</div>
	<br>
	<br>
	<h2 style="text-align: center; text-decoration: bold">게시글 작성</h2>
	<br>
	<div class="cotainer" style="margin-bottom: 50px">
		<div class="row justify-content-center">
			<div class="card">
			
			
				<form action="" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" id="id" class="form-control" name="u_id" value="${member.id }"/>
					<input type="hidden" id="id" class="form-control" name="p_id" value="${product.id }"/>
					<table class="table">
						<tbody>
							<tr>
								<td>작성자</td>
								<td>${ member.name }</td>
							</tr>
							<tr>
								<td>질문종류</td>
								<td><select class="form-control" id="type" name="type" required>
										<option>상품문의</option>
										<option>배송문의</option>
										<option>환불문의</option>
								</select></td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" id="boardtitle" name="title"
									class="form-control" placeholder="제목을 입력하세요" autofocus required></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="10" cols="50" placeholder="내용을 입력하세요"
										class="form-control" name="content" required></textarea></td>
							</tr>
							<tr>
								<td>파일 업로드</td>
								<td><input type="file" id="fileup" name="image_file"
									class="form-control"></td>
							</tr>
						</tbody>
					</table>
					<div class="row justify-content-center" style="margin-bottom: 50px">
						<%-- <buttom type="submit" formaction="<% request.getContextPath(); %>/question/upload" style="margin-right: 10px">완료</buttom>
						<buttom type="submit" formaction="<% request.getContextPath(); %>" style="margin-right: 10px">취소</buttom>
						
						 --%>
						<button type="submit" formaction="<% request.getContextPath(); %>/question/upload?num=${product.id}">완료</button>
						<button type="submit" formaction="<% request.getContextPath(); %>/product/detail/?num=${product.id}">취소</button>
						
						<!--
						<input type="button" class="btn btn-primary" value="완료" onclick="location.href='이름'?id=값 넣어줘야함" style="margin-right: 10px"> 
						<input type="button" class="btn btn-primary" value="작성취소" onclick="location.href='history.go(-1)'" style="margin-right: 10px"> 
						-->
						
						<input type="reset" class="btn btn-primary" value="초기화">
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer style="background-color: #000000; color: #FFFFFF">
		<div class="container">
			<br>
			<div class="row">
				<div class="col col-lg-6"
					style="border: 1px solid black; text-align: left; font-family: 'ariel'">
					Copyright &copy; 2020<br>KITRI침해대응20기우리조가짱이조<br>All
					rights reserved
				</div>
				<div class="col-md auto"
					style="border: 1px solid black; text-align: left; font-family: 'ariel'">
					Contact Us<br>tel : 010-4022-3241<br>e-mail :
					wsm91@naver.com
				</div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>