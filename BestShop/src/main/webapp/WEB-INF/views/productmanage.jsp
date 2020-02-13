<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		th{
			white-space: nowrap;
		}
		
		td{
			white-space: nowrap;
		}
	</style>
	<title>Beautycloset</title>
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<link rel="dns-prefetch" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
		rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="../css/style.css">
	
	<link rel="icon" href="Favicon.png">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/main">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="main">Admin</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<% request.getContextPath(); %>/logout">logout</a></li>
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
				<a href="main">Beautycloset</a>
			</h1>
		</div>
	</div>
	<div class="container-fluid">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/top">Top</a></li>
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/bottom">Bottom</a></li>
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/bag">Bags & Shoes</a></li>
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/accesorie">Accesories</a></li>
		</ul>
		</nav>
	</div>
	
		<main class="login-form">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9">
						<div class="card">
							<div class="card-header" text-align=center>상품 관리</div>
								<div class="card-body">
									<div class="col-md-6 offset-md-4">
			                            <form class="form-inline" action="" method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <span class="glyphicon glyphicon-search" style="margin-right: 5px"></span>
			                                <input class="form-control mr-sm-2" type="text" placeholder="관리할 상품을 검색하세요">
			                                <button class="btn btn-success" type="submit">Search</button>
			                            </form> <br>
			                            </div>
			                            </div>
			                            <div class="container">
			                            <div class="col-offset-md-1">
			                            <table class="table">
			                                <thead class="thead-dark">
			                                    <tr>
			                                        <th></th>
			                                        <th>상품번호</th>
			                                        <th>상품명</th>
			                                        <th>상품종류</th>
			                                        <th>가격</th>
			                                        <th>상품설명</th>
			                                        <th>업로드날짜</th>
			                                    </tr>
			                                </thead>
			                                <c:forEach items="${products }" var="prod">
				                                <tbody>
				                                    <tr>
				                                        <td><input type="checkbox" name="productchk" value="productchk"></td>
				                                        <td>${prod.id }</td>
				                                        <td>${prod.name }</td>
				                                        <td>${prod.type }</td>
				                                        <td>${prod.price }</td>
				                                        <td>${prod.description }</td>
				                                        <%-- <td>${prod.createTime }</td> --%>
				                                    </tr>
				                                </tbody>
			                                </c:forEach>
			                            </table>
			                            </div>
			                            </div>
			                            <div class="container">
			                            <div class="col-md-6 offset-md-4">
			                            <form class="form-inline" action="" method="post">
			                            <button type="submit" class="btn btn-primary" value="edit" style="margin-left:15px;margin-right:10px" onclick="location.href='productedit'">수정</button>
			                            <button type="submit" class="btn btn-primary" value="delete" style="margin-right:10px" onclick="">삭제</button>
			                            <button type="submit" class="btn btn-primary" value="add" onclick="location.href='productadd'">상품추가</button>
			                            <br>
			                            </form>
			                            </div>
									</div>
								</div>
						</div>
					</div>
				</div>
		</main>
		<footer style="background-color: #000000; color: #FFFFFF">
			<div class="container" style="margin-top: 100px">
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
