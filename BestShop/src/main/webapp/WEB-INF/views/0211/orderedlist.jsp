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
		<h2 style="text-align:center;text-decoration:bold">주문내역</h2>
		<h3 style="text-align:center;text-decoration:bold;margin-bottom:50px">${users.id}님의 주문내역입니다</h3>
			<div class="container" style="margin-bottom:50px">
     <div class="row justify-content-center" style="border-bottom : 2px solid black">
	<div class="card">
		<form action="" method="post">
	<table class="table-dark" class="table-bordered">
		<thead>
			<tr>
				<th>이미지</th>
				<th>상품번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>주문날짜</th>
				<th>배송상태</th>
				<th>입금상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan = "3" rowspan = "4">${products.image}</td>
				<td colspan = "3" rowspan = "4">${orders.p_id}</td>
				<td colspan = "5" rowspan = "4">${products.name}</td>
				<td colspan = "2" rowspan = "4">${.count}<br><input type="number" id="qty_input" class="form-control form-control-sm" value="1" min="1"><br><button type="button" value="수량변경" class="btn btn-primary btn-xs" onclick=""></button></td><!--추후 order 테이블에 수량 컬럼 등록되면 수정-->
				<td colspan = "2" rowspan = "4">${order.createTime}</td>
				<td colspan = "2" rowspan = "4">${order.status}</td>
				<td colspan = "2" rowspan = "4"><!--만약 입금이 되어있으면 입금완료라고 뜨고, 입금이 안되어있으면 입금바람이라고 뜸--></td>
			</tr>
		</tbody>
	</table>
	<br>
</form>
</div>
</div>
</div>
	<input type="button" class="btn btn-primary" value="마이페이지로" onclick="location.href='mypage'" style="margin-right:10px">
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