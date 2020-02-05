<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Beautycloset</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
	integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="./js/quantity.jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
			<li class="nav-item"><a class="nav-link" href="main">Home</a></li>
			<li class="nav-item"><c:if test="${login eq null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/login">Login</a>
				</c:if> <c:if test="${login ne null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/logout">Logout</a>
				</c:if></li>
			<li class="nav-item"><c:if test="${login eq null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/join">Join</a>
				</c:if> <c:if test="${login ne null }">
					<a class="nav-link"
						href="<% request.getContextPath(); %>/user/mypage">Mypage</a>
				</c:if></li>
		</ul>
		<form class="form-inline"
			action="<% request.getContextPath(); %>/product/search" method="post">
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
			<li class="nav-item"><a class="nav-link" href="top">Top</a></li>
			<li class="nav-item"><a class="nav-link" href="bottom">Bottom</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="bags">Bags &
					Shoes</a></li>
			<li class="nav-item"><a class="nav-link" href="acce">Accesories</a>
			</li>
		</ul>
		</nav>
		<div class="row">
			<div class="col-md-7">
				<img class="img1-1" width="175" height="250" src='data:image/jpg;base64,${resultimage}' alt="${products.name}">
			</div>
			<div class="col-md-4" style="margin-top: 40px">
				<div class="card">
					<div class="card-header">${products.name}</div>
					<div class="card-body">
						<div class="container mt-3">
							<div class="row">
								<div class="col-sm-12"></div>
								<div class="col-sm-12 col-sm-offset-5">
									<div class="input-group mb-5">
										수량 :
										<div class="input-group-prepend">
											<button class="btn btn-dark btn-sm" id="minus-btn">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<input type="number" id="qty_input"
											class="form-control form-control-sm" value="1" min="1">
										<div class="input-group-prepend">
											<button class="btn btn-dark btn-sm" id="plus-btn">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer"></div>
							<div class="col-sm-2"></div>
							<p class="text-center">
								<a class="btn btn-primary btn-lg" href="" role="button">주문하기</a>
							</p>
							<div class="col-sm-1"></div>
							<p class="text-center">
								<a class="btn btn-primary btn-lg" href="" role="button">장바구니담기</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<ul class="nav nav-tabs nav-justified">
		<li class="nav-item active"><a class="nav-link" data-toggle="tab"
			href="#상품정보">상품정보</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#qna">Q & A</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#Review">Review</a></li>
	</ul>
	<div class="tab-content">

		<div class="tab-pane fade" id="qna">
			<br>
			<div class="container">
				<h2 style="text-align: center">Q & A</h2>
				<br>
				<p style="text-align: center">상품 배송, 사이즈, 환불 등 다양한 질문에 대해 관리자가
					친절하게 대답해 드립니다.</p>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>이름</th>
							<th>상품명</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>


				<form name="qnaForm" method="get">
					
					<div class="row justify-content-center" style="margin-bottom: 50px">
					<input type="hidden" name="productId" value="id">
						<input type="button" class="btn btn-primary" value="수정"
							onclick="location.href='q&aeditform'" style="margin-right: 10px">
						<input type="button" class="btn btn-primary" value="추가" onclick="location.href='qna/upload'"
							style="margin-right: 10px"> <input type="reset"
							class="btn btn-primary" value="삭제" onclick="">
					</div>
				</form>
			</div>
		</div>

		<div class="tab-pane fade in active" id="상품정보">
			<br> ${products.description} <br> 가격 : ${products.price } <br>
		</div>

		<div class="tab-pane fade" id="Review">
			<br>
			<div class="container">
				<h2 style="text-align: center">Review</h2>
				<br>

				<p style="text-align: center">상품에 대해 리뷰 올려주시면 적립금 드립니다.</p>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>이름</th>
							<th>상품명</th>
							<th>내용</th>
						</tr>
					</thead>
					<c:forEach items="${reviews }" var="rev">
						<tbody>
							<tr>
								<td><a href="review/detail?id=${rev.id }">${rev.id }</a></td>
								<td>${rev.id }</td>
								<td>${rev.content }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

				<div class="row justify-content-center" style="margin-bottom: 50px">
					<input type="button" class="btn btn-primary" value="수정"
						onclick="location.href='review/edit'" style="margin-right: 10px">
					<input type="button" class="btn btn-primary" value="추가"
						onclick="location.href='review/upload'" style="margin-right: 10px">
					<input type="reset" class="btn btn-primary" value="삭제" onclick="location.href='review/delete'">
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
</body>
</html>