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
			<li class="nav-item"><a class="nav-link"
				href="<%request.getContextPath();%>/main">Home</a></li>
			<li class="nav-item"><c:if test="${login eq null }">
					<a class="nav-link"
						href="<%request.getContextPath();%>/user/login">Login</a>
				</c:if> <c:if test="${login ne null }">
					<a class="nav-link"
						href="<%request.getContextPath();%>/user/logout">Logout</a>
				</c:if></li>
			<li class="nav-item"><c:if test="${login eq null }">
					<a class="nav-link"
						href="<%request.getContextPath();%>/user/join">Join</a>
				</c:if> <c:if test="${login ne null }">
					<a class="nav-link"
						href="<%request.getContextPath();%>/user/mypage">Mypage</a>
				</c:if></li>
		</ul>
		<form class="form-inline"
			action="<%request.getContextPath();%>/product/search" method="post">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				name="search">
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
			<li class="nav-item"><a class="nav-link"
				href="<%request.getContextPath();%>/top">Top</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%request.getContextPath();%>/bottom">Bottom</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%request.getContextPath();%>/bags">Bags & Shoes</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%request.getContextPath();%>/acce">Accesories</a></li>
		</ul>
	</div>
	<br>
	<br>
	<h2 style="text-align: center; text-decoration: bold">리뷰 수정</h2>
	<br>
	<div class="cotainer" style="margin-bottom: 50px">
		<div class="row justify-content-center">
			<div class="card">
				<form action="" method="post">
					<table class="table">
						<tbody>
							<tr>
								<td>작성자</td>
								<td></td>
								<!--DB에 있는 회원 이름이 표시되도록 ${}부분을 수정-->
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" id="boardtitle" name="boardtitle"
									class="form-control" value="" autofocus required></td>
								<!--제목에 해당하는 테이블 컬럼이 어떤것인지?-->
							</tr>
							<tr>
								<td>상품명</td>
								<td><input type="text" id="reviewprodname"
									name="reviewprodname" class="form-control" value="" required></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="10" cols="50" value=""
										class="form-control" required></textarea></td>
							</tr>
							<tr>
								<td>작성날짜</td>
								<td></td>
								<!-- 현재 날짜가 자동으로 표시되도록 바꿈-->
							</tr>
							<tr>
								<td>파일 업로드</td>
								<td><input type="file" id="image_1" name="image_1"
									class="form-control"></td>
							</tr>
						</tbody>
					</table>
					<div class="row justify-content-center" style="margin-bottom: 50px">
						<input type="button" class="btn btn-primary" value="완료"
							onclick="alert('리뷰 수정이 완료되었습니다')" style="margin-right: 10px">
						<input type="button" class="btn btn-primary" value="수정취소"
							onclick="location.href='history.back()'"
							style="margin-right: 10px">
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