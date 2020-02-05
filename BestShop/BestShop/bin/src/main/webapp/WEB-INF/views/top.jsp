<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<title>Beautycloset</title>
		<link rel="stylesheet" href="./css/bootstrap.css">
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
		<br>
		<br>
		<h1 class="text-center">Top</h1>
		<div class="container-fluid">
				<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="nav-link" href="">신상품순</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">낮은가격순</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">높은가격순</a>
				</li>
				</ul>
		</div>
		<br>
		<br>
		<div class="row" align=center>
			<div class="col-md-3">
				<a href="top1.html"><img class="img1" src="./jpg/1.jpg" alt="코튼티셔츠"><a href="top1.html"><p>코튼 티셔츠</p><p>10000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="top2.html"><img class="img2" src="./jpg/2.jpg" alt="레이스블라우스"><a href="top2.html"><p>화이트 레이스 블라우스<span class="badge badge-secondary">New</span></p><p>25000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="bags1.html"><img class="img14" src="./jpg/14.jpg" alt="노란가죽가방"><a href="bag1.html"><p>미니 숄더백</p><p>40000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="bags2.html"><img class="img12" src="./jpg/12.jpg" alt="화이트펀칭슈즈"><a href="shoes2.html"><p>화이트 펀칭 슈즈</p><p>50000원</p></a></a>
			</div>
		</div>
		<div class="row" align=center>
			<div class="col-md-3">
				<a href="top1.html"><img class="img1" src="./jpg/1.jpg" alt="코튼티셔츠"><a href="top1.html"><p>코튼 티셔츠</p><p>10000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="top2.html"><img class="img2" src="./jpg/2.jpg" alt="레이스블라우스"><a href="top2.html"><p>화이트 레이스 블라우스</p><p>25000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="bags1.html"><img class="img14" src="./jpg/14.jpg" alt="노란가죽가방"><a href="bag1.html"><p>미니 숄더백</p><p>40000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="bags2.html"><img class="img12" src="./jpg/12.jpg" alt="화이트펀칭슈즈"><a href="shoes2.html"><p>화이트 펀칭 슈즈<span class="badge badge-secondary">New</span></p><p>50000원</p></a></a>
			</div>
		</div>
		<div class="row" align=center>
			<div class="col-md-3">
				<a href="bottom1.html"><img class="img11" src="./jpg/11.jpg" alt="블랙롱스커트"><a href="bottom2.html"><p>블랙 롱 스커트</p><p>30000원</p></a></a>
			</div>
			<div class="col-md-3">
				<a href="bottom2.html"><img class="img13" src="./jpg/13.jpg" alt="블랙레이스스커트"><a href="bags2.html"><p>블랙 레이스 스커트</p><p>45000원</p></a></a>
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
	<script src="../js/bootstrap.js"></script>
	</body>
</html>