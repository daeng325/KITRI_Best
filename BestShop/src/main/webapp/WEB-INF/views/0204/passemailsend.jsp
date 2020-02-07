<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c-rt" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt-rt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>Beautycloset</title>
		<link rel="stylesheet" href="./css/bootstrap.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
					<a class="nav-link" href="login">Login</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="join">Join</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="mypage">Mypage</a>
				</li>
			</ul>
			<form class="form-inline" action="" method="post">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
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
		</div>
		<br>
		<br>
		<h2 style="text-align:center;text-decoration:bold">아이디 / 비밀번호 찾기</h2>
		<br>
		<br>
		<main class="login-form">
    	<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card" style="width:auto;margin-bottom:50px;margin-left:auto; margin-right:auto">
                	<div class="card-header">
                		<img src="mail.png" alt="이메일" style="width:300px;height:300px;margin-left:100px">
                	</div>
                	<div class="card-body" style="text-align:center;width:400px;height:150px;margin-left:70px">
                		회원님의 이메일 주소로 메일이 발송되었습니다.<br>
                		확인 후 다시 로그인을 시도해보세요.
                		<input type="button" class="btn btn-primary" value="로그인하러 가기" onclick="location.href='login'" style="margin-top:20px">
                	</div>
                </div>
            </div>
        </div>
    </div>
</main>
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

