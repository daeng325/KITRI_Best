<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" , initial-scale="1">
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
		var msg = "${msg}"
		if(msg=="Duplicate"){
			alert("이미 사용 중인 ID입니다.")
		}
		if(msg=="Fail"){
			alert("비밀번호를 하나 이상의 알파벳,숫자,특수문자를 이용한 8글자 이상으로 설정해주세요.")
		}

	</script>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="<%request.getContextPath();%>/">Home</a></li>
			<li class="nav-item"><sec:authorize access="isAnonymous()">
					<a class="nav-link" href="login">Login</a>
				</sec:authorize> <sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="logout">Logout</a>
				</sec:authorize></li>
			<li class="nav-item"><sec:authorize access="isAnonymous()">
					<a class="nav-link" href="join">Join</a>
				</sec:authorize> <sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="mypage">Mypage</a>
				</sec:authorize></li>

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
				<a href="main">Beautycloset</a>
			</h1>
		</div>
	</div>
	<div class="container-fluid">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/top">Top</a></li>
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/bottom">Bottom</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/bag">Bags &
					Shoes</a></li>
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/accesorie">Accesories</a>
			</li>
		</ul>
		</nav>
		<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				</div>
			</div>
		</nav>

		<main class="login-form">
			<div class="cotainer">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="card">
							<div class="card-header" text-align=center>회원가입</div>
							<div class="card-body">
								<form action="<%=request.getContextPath()%>/user/join"
									method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="form-group row">
										<label for="name"
											class="col-md-4 col-form-label text-md-right">이름</label>
										<div class="col-md-6">
											<input type="text" id="name" class="form-control" name="name"
												value="${member.name }"required autofocus>
										</div>
									</div>
									<div class="form-group row">
										<label for="sex" class="col-md-4 col-form-label text-md-right">성별</label>
										<div class="col-md-6">
											<c:choose>
												<c:when test="${member.gender eq 'man'}">
													<input type="radio" name="gender" value="man" checked="checked" required>남자
													<input type="radio" name="gender" value="woman" required>여자
												</c:when>
												<c:when test="${member.gender eq 'woman'}">
													<input type="radio" name="gender" value="man" required>남자
													<input type="radio" name="gender" value="woman" checked="checked" required>여자
												</c:when>
												<c:otherwise>
													<input type="radio" name="gender" value="man" required>남자
													<input type="radio" name="gender" value="woman" required>여자
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="form-group row">
										<label for="age" class="col-md-4 col-form-label text-md-right">나이</label>
										<div class="col-md-6">
											<input type="text" id="age" class="form-control" name="age"
												value="${member.age }" required>
										</div>
									</div>
									<div class="form-group row">
										<label for="phonenum"
											class="col-md-4 col-form-label text-md-right">전화번호</label>
										<div class="col-md-6">
											<c:if test="${member.phone eq null}">
												<input type="tel" id="phone" class="form-control"
														name="phone" onKeyup="inputTelNumber(this);" maxlength="13" style="text-align:center;" required>
											</c:if>
											<c:if test="${member.gender ne null}">
												<input type="tel" id="phone" class="form-control"
														name="phone" maxlength="13" style="text-align:center;" value="${member.phone }" required>
											</c:if>
											
										</div>
									</div>
									<script>
									var autoHypenPhone = function(str){
									      str = str.replace(/[^0-9]/g, '');
									      var tmp = '';
									      if( str.length < 4){
									          return str;
									      }else if(str.length < 7){
									          tmp += str.substr(0, 3);
									          tmp += '-';
									          tmp += str.substr(3);
									          return tmp;
									      }else if(str.length < 11){
									          tmp += str.substr(0, 3);
									          tmp += '-';
									          tmp += str.substr(3, 3);
									          tmp += '-';
									          tmp += str.substr(6);
									          return tmp;
									      }else{              
									          tmp += str.substr(0, 3);
									          tmp += '-';
									          tmp += str.substr(3, 4);
									          tmp += '-';
									          tmp += str.substr(7);
									          return tmp;
									      }
									  
									      return str;
									}


									var phoneNum = document.getElementById('phone');

									phoneNum.onkeyup = function(){
									  console.log(this.value);
									  this.value = autoHypenPhone( this.value ) ;  
									}
									</script>
									<div class="form-group row">
										<label for="address"
											class="col-md-4 col-form-label text-md-right">집 주소</label>
										<div class="col-md-6">
											<input type="text" id="address" class="form-control"
												name="address" value="${member.address }" required>
										</div>
									</div>
									<div class="form-group row">
										<label for="emailadd"
											class="col-md-4 col-form-label text-md-right">이메일 주소</label>
										<div class="col-md-6">
											<input type="email" id="email" class="form-control"
												name="email" value="${member.email }" required>
										</div>
									</div>
									<div class="form-group row">
										<label for="ID" class="col-md-4 col-form-label text-md-right">아이디</label>
										<div class="col-md-6">
											<input type="text" id="id" class="form-control" name="id"
												required autofocus>
										</div>
									</div>
									<div class="form-group row">
										<label for="password"
											class="col-md-4 col-form-label text-md-right">패스워드</label>
										<div class="col-md-6">
											<input type="password" id="pwd" class="form-control"
												name="pwd" required>
										</div>
									</div>
									<div class="form-group row">
										<label for="items"
											class="col-md-4 col-form-label text-md-right">관심 아이템</label>
										<div class="col-md-6">
											<input type="checkbox" name="likeit" value="top">상의 <input
												type="checkbox" name="likeit" value="bottom">하의 <input
												type="checkbox" name="likeit" value="bags">가방 <input
												type="checkbox" name="likeit" value="shoes">신발 <input
												type="checkbox" name="likeit" value="accesories">악세사리
										</div>
									</div>
									<div class="form-group row">
										<label for="sex" class="col-md-4 col-form-label text-md-right">개인정보
											제공에 동의합니까?</label>
										<div class="col-md-6">
											<c:choose>
												<c:when test="${member.agree eq 'yes'}">
													<input type="radio" name="agree" value="yes" checked="checked" required>예
													<input type="radio" name="agree" value="no" required>아니오
												</c:when>
												<c:when test="${member.agree eq 'no'}">
													<input type="radio" name="agree" value="yes" required>예
													<input type="radio" name="agree" value="no" checked="checked" required>아니오
												</c:when>
												<c:otherwise>
													<input type="radio" name="agree" value="yes" required>예
													<input type="radio" name="agree" value="no" required>아니오
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="form-group row">
										<label for="sex" class="col-md-4 col-form-label text-md-right">이메일,
											문자 수신에 동의합니까?</label>
										<div class="col-md-6">
											<input type="radio" name="agree2" value="yes" required>예
											<input type="radio" name="agree2" value="no" required>아니오
										</div>
									</div>

									<div class="col-md-6 offset-md-4">
										<button type="submit" class="btn btn-primary">회원가입</button>
										<br> <br> <a href="#" class="btn btn-link">
											아이디/비밀번호 찾기 </a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
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