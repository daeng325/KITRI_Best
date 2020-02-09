<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>Beautycloset</title>
		<link rel="stylesheet" href="../css/bootstrap.css">
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
					<a class="nav-link" href="<% request.getContextPath(); %>/top">Top</a></li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/bottom">Bottom</a></li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/bag">Bags & Shoes</a></li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/Accesorie">Accesories</a></li>
			</ul>
		</div>
		<br>
		<br>
		<h2 style="text-align:center;text-decoration:bold">상품 정보 추가</h2>
		<br>
<div class="cotainer" style="margin-bottom:50px">
     <div class="row justify-content-center">
	<div class="card">
	<form method='post' enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<table class="table">
		<tbody>
			<tr>
				<td>상품명</td>
				<td><input type="text" id="name" name="name" class="form-control" placeholder="상품명 입력" autofocus required></td>
			</tr>
			<tr>
				<td>종류</td>
				<td>
					<select class="form-control" id="type" name="type" required>
						<option value="top">Top</option>
						<option value="bottom">Bottom</option>
						<option value="bag">Bag</option>
						<option value="shoes">Shoes</option>
						<option value="Accesorie">Accesories</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" id="price" name="price" class="form-control" placeholder="상품가격 입력" required></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><textarea id="description" name="description" rows="10" cols="50" placeholder="상품 상세정보 입력" class="form-control" required></textarea>
				</td>
			</tr>
			<tr>
				<td>대표 이미지</td>
				<td><input type="file" id="image_thumbnail" name="image_thumbnail" class="form-control" required> 
				</td>
			</tr>
			<tr>
				<td>상세 이미지</td>
				<td><input type="file" id="image_detail" name="image_detail" class="form-control" required>
				</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" id="image" name="image" class="form-control" required>
				</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" id="count" name="count" class="form-control" placeholder="재고량 입력" required></td>
			</tr>			
			<tr>
				<td>상태</td>
				<td>
					<select class="form-control" id="status" name="status" required>
						<option value="out_of_stock">out of stock</option>
						<option value="in_stock">in stock</option>
						<option value="running_low">running low</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>생성날짜</td>
				<td><script>
						let today = new Date();   // 현재 날짜를 표시함(특정한 포맷 없이) 

						let year = today.getFullYear(); // 년도
						let month = today.getMonth()  // 월
						let date = today.getDate();  // 날짜

						document.write(year + '-' + month + '-' + date) // 년-월-일 형식으로 표현
					</script></td>
				<!-- 현재 날짜가 자동으로 표시되도록 바꿈-->
			</tr>
		</tbody>
	</table>
<div class="row justify-content-center" style="margin-bottom:50px">
<button type="submit" class="btn btn-primary" formaction="<% request.getContextPath(); %>/product/upload" style="margin-right:10px">완료</button>
<button type="submit"  class="btn btn-primary" formaction="<% request.getContextPath(); %>admin/productmanage" style="margin-right:10px">취소</button>
<input type="reset" class="btn btn-primary" value="초기화">
</div>
</form>
</div>
</div>
</div>
<footer style="background-color: #000000; color:#FFFFFF">
			<div class="container">
				<br>
				<div class="row">
					<div class="col col-lg-6" style="border:1px solid black; text-align: left; font-family:'ariel'">Copyright &copy; 2020<br>KITRIì¹¨í´ëì20ê¸°ì°ë¦¬ì¡°ê°ì§±ì´ì¡°<br>All rights reserved</div>
					<div class="col-md auto" style="border:1px solid black; text-align: left; font-family:'ariel'">Contact Us<br>tel : 010-4022-3241<br>e-mail : wsm91@naver.com</div>
				</div>
			</div>
		</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	</body>
</html>