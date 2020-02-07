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
		<h2 style="text-align:center;text-decoration:bold">계정 정보 추가</h2>
		<br>
<div class="cotainer" style="margin-bottom:50px">
     <div class="row justify-content-center">
	<div class="card">
		<form action="" method="post">
	<table class="table">
		<tbody>
			<tr>
				<td>이름</td>
				<td><input type="text" id="username" name="username" class="form-control" autofocus required></td>
				<!--DB에 있는 회원 이름이 표시되도록 ${}부분을 수정-->
			</tr>
			<tr>
				<td>계정형태</td>
				<td>
					<select class="form-control" id="usertype" required>
						<option>관리자</option>
						<option>일반 회원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디 입력" required>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="number" id="price" name="price" class="form-control" placeholder="비밀번호 입력" required></td>
			</tr>
			<tr>
				<td>생성날짜</td>
				<td><script>
						let today = new Date();   // 현재 날짜를 표시함(특정한 포맷 없이)

						let year = today.getFullYear(); // 년도
						let month = today.getMonth()  // 월
						let date = today.getDate();  // 날짜

						document.write(year + '-' + month + '-' + date) // 년-월-일 형식으로 표현
					</script></td>
				<!-- 현재 날짜가 자동으로 표시되도록 바꿈-->
			</tr>
		</tbody>
	</table>
<div class="row justify-content-center" style="margin-bottom:50px">
<input type="button" class="btn btn-primary" value="완료" onclick="" style="margin-right:10px">
<input type="button" class="btn btn-primary" value="취소" onclick="location.href='history.back()'" style="margin-right:10px">
<input type="reset" class="btn btn-primary" value="초기화">
</div>
</form>
</div>
</div>
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