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
		<h2 style="text-align:center;text-decoration:bold;margin-bottom:50px">주문하기</h2>
			<div class="cotainer" style="margin-bottom:50px">
     <div class="row justify-content-center" style="border-bottom : 1px solid black">
	<div class="card">
		<form action="" method="post">
	<table class="table-dark" class="table-bordered">
		<thead style="text-align:center">
			<tr>
				<th colspan = "3">이미지</th>
				<th colspan = "3">상품번호</th>
				<th colspan = "5">상품명</th>
				<th colspan = "2">수량</th>
				<th colspan = "2">날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach var="image" items="${products.image}">
				<td colspan = "3" rowspan = "5">${image}</td>
				</c:forEach>
				<c:forEach var="p_id" items="${baskets.p_id}">
				<td colspan = "3" rowspan = "5">${p_id}</td>
				</c:forEach>
				<c:forEach var="name" items="${products.name}">
				<td colspan = "5" rowspan = "5">${name}</td>
				</c:forEach>
				<td colspan = "3" rowspan = "5"><br><input type="number" id="qty_input" class="form-control form-control-sm" value="1" min="1"></td>
				<c:forEach var="createTime" items="${baskets.createTime}">
				<td colspan = "2" rowspan = "5">${createTime}</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<br>
</form>
</div>
</div>
</div>
</div>
	<div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header" text-align=center>배송 정보 수정</div>
                    <div class="card-body">
                        <form action="" method="post">
                        	<div class="form-group row">
                        		<div class="col-md-2">
                        		<input type="radio" value="old" id="oldadd" name="addchoice" checked>기존 배송지
                        	</div>
                        	<div class="form-group row">
                        		<div class="col-md-4">
                        		<input type="radio" value="new" id="newadd" name="addchoice">신규 배송지
                        	</div>
                        	<script>
                        		//기존 배송지를 클릭하면 기존에 DB에 저장되어 있던 회원 정보가 로딩되고, 신규 배송지를 클릭하면 빈칸에 새로 입력해서 주문할 수 있도록 기능 구현
                        	</script>
                        	<div class="card-body">
                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">이름</label>
                                <div class="col-md-6">
                                    <input type="text" id="ID" class="form-control" name="ID" required autofocus>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="phonenum" class="col-md-4 col-form-label text-md-right">전화번호</label>
                                <div class="col-md-6">
                                    <input type="tel" id="phone" class="form-control" name="phone" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="address" class="col-md-4 col-form-label text-md-right">집 주소</label>
                                <div class="col-md-6">
                                    <input type="text" id="add" class="form-control" name="add" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="emailadd" class="col-md-4 col-form-label text-md-right">택배 기사 메시지</label>
                                <div class="col-md-6">
                                    <select class="form-control form-control-md" id="deliverymsg">
                                    	<option name="choicemes">선택하세요</option>
                                    	<option name="choicemes">부재시 경비실에 맡겨주세요</option>
                                    	<option name="choicemes">빠른 배송 부탁드립니다</option>
                                    </select>
                                </div>
                            </div>
	<input type="button" class="btn btn-primary" value="결제하기" onclick="location.href='purchase'" style="margin-left:150px;margin-right:10px">
<input type="button" class="btn btn-primary" value="계속 쇼핑하기" onclick="location.href='main'" style="margin-right:10px">
</div>
</form>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
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