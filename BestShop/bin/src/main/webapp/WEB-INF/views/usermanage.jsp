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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="css/style.css">

        <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
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
                <input class="form-control mr-sm-2" type="text" placeholder="Search" autofocus>
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
        </nav>
<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        </div>
    </div>
</nav>
<br>

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
                                        			<th>아이디</th>
                                        			<th>이름</th>
                                        			<th>성별</th>
                                        			<th>나이</th>
                                        			<th>전화번호</th>
                                        			<th>집 주소</th>
                                        			<th>이메일 주소</th>
                                        			<th>관심 아이템</th>
                                        			<th>수신동의</th>
			                                    </tr>
			                                </thead>
			                                <c:forEach items="${products }" var="prod">
				                                <tbody>
				                                    <tr>
				                                        <td><input type="checkbox" name="productchk" value="productchk"></td>
                                        				<td>${user.id }</td>
                                        				<td>${user.name }</td>
                                        				<td>${user.gender }</td>
                                        				<td>${user.age }</td>
                                        				<td>${user.phone }</td>
                                        				<td>${user.address }</td>
                                        				<td>${user.email }</td>
                                        				<td>${user.likeit }</td>
                                        				<td>${user.agree2}</td>
				                                    </tr>
				                                </tbody>
			                                </c:forEach>
			                            </table>
			                            </div>
			                            </div>
			                            <div class="container">
			                            <div class="col-md-6 offset-md-4">
			                            <form class="form-inline" action="" method="post">
			                            <button type="submit" class="btn btn-primary" value="edit" style="margin-left:15px;margin-right:10px" onclick="location.href='<% request.getContextPath(); %>/admin/usermanage/useredit'">수정</button>
			                            <button type="submit" class="btn btn-primary" value="delete" style="margin-right:10px" onclick="">삭제</button>
			                            <button type="submit" class="btn btn-primary" value="add" onclick="location.href='<% request.getContextPath(); %>/admin/usermanage/useradd'">계정추가</button>
			                            <br>
			                            </form>
			                            </div>
									</div>
								</div>
						</div>
					</div>
				</div>
		</main>


<!-- <main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header" text-align=center>계정관리</div>
                    <div class="card-body">
                        <div class="col-md-6 offset-md-4">
                            <form class="form-inline" action="" method="post">
                                <span class="glyphicon glyphicon-search" style="margin-right:5px"></span>
                                <input class="form-control mr-sm-2" type="text" placeholder="관리할 계정을 검색하세요">
                                <button class="btn btn-success" type="submit">Search</button>
                            </form>
                            <br>
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th></th>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>나이</th>
                                        <th>전화번호</th>
                                        <th>집 주소</th>
                                        <th>이메일 주소</th>
                                        <th>관심 아이템</th>
                                        <th>수신동의</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${users }" var="user">
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" name="productchk" value="productchk"></td>
                                        <td>${user.id }</td>
                                        <td>${user.name }</td>
                                        <td>${user.gender }</td>
                                        <td>${user.age }</td>
                                        <td>${user.phone }</td>
                                        <td>${user.address }</td>
                                        <td>${user.email }</td>
                                        <td>${user.likeit }</td>
                                        <td>${user.agree2}</td>
                                    </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                            <form class="form-inline" action="" method="post">
                            <span><button type="submit" class="btn btn-primary" value="edit" style="margin-left:15px;margin-right:10px" onclick="location.href='useredit'">수정</button></span>
                            <span><button type="submit" class="btn btn-primary" value="delete" style="margin-right:10px">삭제</button></span>
                            <span><button type="submit" class="btn btn-primary" value="add" onclick="location.href='useradd'">계정추가</button></span>
                            <br>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>-->
<footer style="background-color: #000000; color:#FFFFFF">
            <div class="container" style="margin-top:100px">
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
