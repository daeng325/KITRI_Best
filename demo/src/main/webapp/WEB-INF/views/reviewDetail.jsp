<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Beautycloset</title>
<link rel="stylesheet" href="./css/bootstrap.css">
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
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/main">Home</a></li>
			<li class="nav-item"><c:if test="${login eq null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/login">Login</a>
				</c:if> <c:if test="${login ne null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/logout">Logout</a>
				</c:if></li>
			<li class="nav-item"><c:if test="${login eq null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/join">Join</a>
				</c:if> <c:if test="${login ne null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/mypage">Mypage</a>
				</c:if></li>
		</ul>
		<form class="form-inline"
			action="<% request.getContextPath(); %>/product/search" method="post">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
	</nav>
	<div class="container">
		<div class="logo">
			<h1 class="text-center">
				<a href="<% request.getContextPath(); %>/">Beautycloset</a>
			</h1>
		</div>
	</div>
	<div class="container-fluid">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/top">Top</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/bottom">Bottom</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/bags">Bags & Shoes</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/acce">Accesories</a></li>
		</ul>
		</nav>

		id : ${review.id } <br> 
		u_id : ${review.u_id } <br> 
		price : ${review.rev_price} <br> 
		quality : ${review.rev_quality} <br>
		ship : ${review.rev_ship} <br> 
		agv : ${review.rev_agv} <br>
		내용 : ${review.content }<br> 
		이미지 : <img class="img1-1" src='data:image/${review.ext };base64,${resultimage}' alt="${review.id}"> <br>
		data:image/${review.ext };base64,${resultimage }
</body>
</html>