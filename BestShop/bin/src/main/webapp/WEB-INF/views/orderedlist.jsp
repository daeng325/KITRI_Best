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
		<script>
		var msg = "${msg}"
		if(msg=="Duplicate"){
			alert("이미 작성 하셨습니다.")
		}

	</script>
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
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/main">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="mypage">Mypage</a>
			</li>
		</ul>
		<form class="form-inline"
			action="<% request.getContextPath(); %>/product/search" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			 <input class="form-control mr-sm-2" type="text" placeholder="Search" name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
		</nav>
		<div class="container">
			<div class="logo">
				<h1 class="text-center">
					<a href=<% request.getContextPath(); %>/"main">Beautycloset</a>
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
		</div>
		<br>
		<br>
		<h2 style="text-align:center;text-decoration:bold">주문내역</h2>
		<h3 style="text-align:center;text-decoration:bold;margin-bottom:50px">${member.id}님의 주문내역입니다</h3>
			<div class="container" style="margin-bottom:50px">
     <div class="row justify-content-center" style="border-bottom : 2px solid black">
	<div class="card">
	
	<form method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<table class="table-dark" class="table-bordered">
		<thead>
			<tr>
				<th colspan = "3" rowspan = "4">이미지</th>
				<th colspan = "3" rowspan = "4">상품번호</th>
				<th colspan = "5" rowspan = "4">상품명</th>
				<th colspan = "2" rowspan = "4">수량</th>
				<th colspan = "2" rowspan = "4">주문날짜</th>
				<th colspan = "2" rowspan = "4">배송상태</th>
				<th colspan = "2" rowspan = "4">입금상태</th>
				<th colspan = "2" rowspan = "4">리뷰</th>
			</tr>
		</thead>
		<c:forEach  var="order" items="${orders}">
		<tbody>
			
			<tr>
				
				<input type="hidden" name="order" value="${order.key}"/>
				<input type="hidden" name="product" value="${order.value}"/>
				<td colspan = "3" rowspan = "4"><img class="img" width="175" height="250" src='data:image/jpg;base64,${order.value.image_thumbnail}' alt="${order.value.name}"></td>
				<td colspan = "3" rowspan = "4">${order.key.p_id}</td>
				<td colspan = "5" rowspan = "4">${order.value.name}</td>
				<td colspan = "2" rowspan = "4">${order.key.count}</td>
				<td colspan = "2" rowspan = "4">${order.key.id}</td>
				<td colspan = "2" rowspan = "4">${order.value.id}</td>
				<td colspan = "2" rowspan = "4"><!--만약 입금이 되어있으면 입금완료라고 뜨고, 입금이 안되어있으면 입금바람이라고 뜸--></td>
				<td colspan = "2" rowspan = "4"><a href="<% request.getContextPath(); %>/review/upload?num=${order.key.id}">작성</a></td>
			</tr>
			
		</tbody>
		</c:forEach>
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