<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>Beautycloset</title>
		<link rel="stylesheet" href="./css/bootstrap.css">
	</head>
	<body>
		<style type="text/css">
			.jumbotron{
				background-image: url('./jpg/flower.jpg');
				background-size: cover;
				text-shadow: black 0.2px 0.2px 0.2px;
				color: blue;
				font-weight: bold;
				opacity: 0.5;
				filter: alpha(opacity=50);
			}

			.logo{
				font-family : 'Segoe Print';
				font-size : 100px;
				margin-top : 100px;
				margin-bottom : 100px;
			}

			* a{
				text-decoration: none;
				color: black;
			}

		</style>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="main">Home</a>
				</li>
				<li class="nav-item">
				<li class="nav-item">
					<c:if test = "${login eq null }">
						<a class="nav-link" href="user/login">Login</a>
					</c:if>
					<c:if test = "${login ne null }">			
						<a class="nav-link" href="user/logout">Logout</a>
					</c:if>					
				</li>
				<li class="nav-item">
					<c:if test = "${login eq null }">
						<a class="nav-link" href="user/join">Join</a>
					</c:if>
					<c:if test = "${login ne null }">
						<a class="nav-link" href="user/mypage">Mypage</a>
					</c:if>
				</li>
			</ul>
		<form class="form-inline" action="<% request.getContextPath(); %>/product/search" method="post">
			<input class="form-control mr-sm-2" type="text" placeholder="Search" name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
		</nav>
		<div class="container">
			<div class="logo">
				<h1 class = "text-center"><a href="main">Beautycloset</a></h1>
			</div>
		</div>
		<div class="container-fluid">
			<ul class="nav justify-content-center">
				<li class="nav-item">
					<a class="nav-link" href="top">Top</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="bottom">Bottom</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="bags">Bags & Shoes</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="acce">Accesories</a>
				</li>
			</ul>
		</nav>
		<br>
		<br>
		<h1 class="text-center">Bags & Shoes</h1>
		<div class="container-fluid">
				<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="nav-link" href="">신상품순</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">낮은가격순</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">높은가격순</a>
				</li>
				</ul>
		</div>
		<br>
		<br>
		<div class="row" align=center>
				<c:forEach var="item" items="${products}">
					<div class="col-md-3">
						<a href="productDetail?id=${item.key.id }"><img class="img1" width="175" height="250"  src='data:image/jpg;base64,${ item.value }' alt="${ item.key.name }">
							<a href="productDetail?id=${item.key.id }"><p>${ item.key.name }</p>
								<p>${ item.key.price }</p> 
							</a>
						</a>
					</div>
				</c:forEach>
		</div>
		
		<footer style="background-color: #000000; color:#FFFFFF">
			<div class="container">
				<br>
				<div class="row">
					<div class="col col-lg-6" style="border:1px solid black; text-align: left; font-family:'ariel'">Copyright &copy; 2020<br>KITRI침해대응20기우리조가짱이조<br>All rights reserved</div>
					<div class="col-md auto" style="border:1px solid black; text-align: left; font-family:'ariel'">Contact Us<br>tel : 010-4022-3241<br>e-mail : wsm91@naver.com</div>
				</div>
			</div>
		</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	</body>
</html>