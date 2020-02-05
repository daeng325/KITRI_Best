<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>Beautycloset</title>
		<link rel="stylesheet" href="./css/bootstrap.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="./js/bootstrap.js"></script>
		<script src="./js/quantity.jquery.js"></script>
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
		</nav>
		<div class="row">
		<div class="col-md-7">
				<img class="img1-1" src="./jpg/1.jpg" alt="코튼티셔츠">
			</div>
			<div class="col-md-4" style="margin-top:40px">
				<div class="card">
				<div class="card-header">코튼티셔츠</div>
				<div class="card-body">
				<div class="container mt-3">
                     <div class="row">
                        <div class="col-sm-12"></div>
                        <div class="col-sm-12 col-sm-offset-5">
                            <div class="input-group mb-5">
                                수량 : <div class="input-group-prepend">
                                    <button class="btn btn-dark btn-sm" id="minus-btn"><i class="fa fa-minus"></i></button>
                                </div>
                                <input type="number" id="qty_input" class="form-control form-control-sm" value="1" min="1">
                                <div class="input-group-prepend">
                                    <button class="btn btn-dark btn-sm" id="plus-btn"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="card-footer"></div>
                        <div class="col-sm-2"></div>
                        <p class="text-center"><a class="btn btn-primary btn-lg" href="" role="button">주문하기</a></p>
                        <div class="col-sm-1"></div>
            			<p class="text-center"><a class="btn btn-primary btn-lg" href="" role="button">장바구니담기</a></p>
            		</div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <br>
        <div class="mention">통풍이 잘되는 코튼티셔츠입니다.<br>
					초봄~초가을까지 계속 착용하기 좋고<br>
					순면이라서 피부에도 자극이 없어요^^<br>
					현재 와인, 블루, 그린, 차콜 4가지 옵션이 있어요.<br>
					지금 빨리 주문하세요^^
					<br>
				<div class="cotton1" align="center"><img src="./jpg/21.jpg" alt="파란색"></div>
				<div class="productn1" align="center">블루</div>
				<br>
				<div class="cotton2" align="center"><img src="./jpg/22.jpg" alt="초록색"></div>
				<div class="productn2" align="center">그린</div>
				<br>
				<div class="cotton3" align="center"><img src="./jpg/23.jpg" alt="차콜"></div>
				<div class="productn3" align="center">차콜</div>
				<br>
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

	</body>
</html>