<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" , initial-scale="1">
	<title>Beautycloset</title>
	<link rel="stylesheet" href="./css/bootstrap.css">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<link rel="dns-prefetch" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
		rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="css/style.css">
	
	<link rel="icon" href="Favicon.png">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<script>
		var msg = "${msg}";
		if (msg === "Registered") {
			alert("회원가입이 완료되었습니다. 로그인해주세요.")
		}
	</script>
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
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<%request.getContextPath();%>/">Home</a></li>
			<li class="nav-item">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link" href="login">Login</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="logout">Logout</a>
				</sec:authorize>
			</li>
			<li class="nav-item">
				<sec:authorize access="isAnonymous()">
					<a class="nav-link" href="join">Join</a>
				</sec:authorize> 
				<sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="mypage">Mypage</a>
				</sec:authorize>
			</li>

		</ul>
		<form class="form-inline" action="<% request.getContextPath(); %>/product/search" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input class="form-control mr-sm-2"	type="text" placeholder="Search" name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
	</nav>

	<br>
	<br>
	<br>
	<br>
	<br>
	<main class="login-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">로그인</div>
						<div class="card-body">
							<form action="<% request.getContextPath(); %>/user/login" method="post"> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<c:if test="${loginInfo eq null }">
									<div class="form-group row">
										<label for="ID" class="col-md-4 col-form-label text-md-right">아이디</label>
										<div class="col-md-6">
											<input type="text" id="id" class="form-control" name="id"
												required autofocus>
										</div>
									</div>
								</c:if>

								<c:if test="${loginInfo ne null }">
									<div class="form-group row">
										<label for="ID" class="col-md-4 col-form-label text-md-right">아이디</label>
										<div class="col-md-6">
											<input type="text" id="id" class="form-control" name="id"
												value="${loginInfo}" required autofocus>
										</div>
									</div>
								</c:if>

								<div class="form-group row">
									<label for="password"
										class="col-md-4 col-form-label text-md-right">패스워드</label>
									<div class="col-md-6">
										<input type="password" id="password" class="form-control"
											name="password" required>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="checkbox">
											<label> <input type="checkbox" name="id_remember"
												value=""> 아이디 저장
											</label>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6 offset-md-4">
										<div class="checkbox">
											<label> <input type="checkbox" id="chk_cookie"
												name="remember-me"> 로그인 상태 유지
											</label>
										</div>
									</div>
								</div>

								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary">로그인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</main>
	<br>
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
	<script src="../js/bootstrap.js"></script>
</body>
</html>