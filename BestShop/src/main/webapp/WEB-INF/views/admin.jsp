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
					<a class="nav-link" href="<% request.getContextPath(); %>/main">Home</a>
				</li>
				 <li class="nav-item">
					<a class="nav-link" href="main">Admin</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<% request.getContextPath(); %>/logout">logout</a>
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
        </nav>
    </div>

<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header" text-align=center>관리자 페이지</div>
                    <div class="card-body">
                        <form action="" method="post">
                        <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="location.href='productmanage'">
                                상품관리</button>
                        </div>
                        </form>
                        <br>
                        <form action="" method="post">
                        <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="location.href='usermanage'">
                                계정관리</button>
                        </div>
                        </form>
                        <br>
                        <form action="" method="post">
                        <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="location.href='ordermanage'">
                                주문정보관리</button>
                        </div>
                        </form>
                        <form action="" method="post">
                        <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="location.href='q&aanswermanage'">
                                Q&A관리</button>
                        </div>
                        </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</main>

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