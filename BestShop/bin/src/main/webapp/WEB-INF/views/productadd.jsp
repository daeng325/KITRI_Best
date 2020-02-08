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
		<h2 style="text-align:center;text-decoration:bold">ìí ì ë³´ ì¶ê°</h2>
		<br>
<div class="cotainer" style="margin-bottom:50px">
     <div class="row justify-content-center">
	<div class="card">
		<form action="" method="post">
	<table class="table">
		<tbody>
			<tr>
				<td>ê´ë¦¬ì</td>
				<td>id</td>
				<!--DBì ìë íì ì´ë¦ì´ íìëëë¡ ¶ë¶ì ìì -->
			</tr>
			<tr>
				<td>ìíë²í¸/ìì´ë</td>
				<td><input type="text" id="product_id" name="product_id" class="form-control" placeholder="ìíë²í¸ ìë ¥" autofocus required></td>
			</tr>
			<tr>
				<td>ì¢ë¥</td>
				<td>
					<select class="form-control" id="type" required>
						<option>Top</option>
						<option>Bottom</option>
						<option>Bag</option>
						<option>Shoes</option>
						<option>Accesories</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>ê°ê²©</td>
				<td><input type="number" id="price" name="price" class="form-control" placeholder="ìíê°ê²© ìë ¥" required></td>
			</tr>
			<tr>
				<td>ì¤ëª</td>
				<td><textarea rows="10" cols="50" placeholder="ìí ìì¸ì ë³´ ìë ¥" class="form-control" required></textarea>
				</td>
			</tr>
			<tr>
				<td>ìíì´ë¯¸ì§</td>
				<td><input type="file" id="fileup" name="fileup" class="form-control">
				</td>
			</tr>
			<tr>
				<td>ìì±ë ì§</td>
				<td><script>
						let today = new Date();   // íì¬ ë ì§ë¥¼ íìí¨(í¹ì í í¬ë§· ìì´)

						let year = today.getFullYear(); // ëë
						let month = today.getMonth()  // ì
						let date = today.getDate();  // ë ì§

						document.write(year + '-' + month + '-' + date) // ë-ì-ì¼ íìì¼ë¡ íí
					</script></td>
				<!-- íì¬ ë ì§ê° ìëì¼ë¡ íìëëë¡ ë°ê¿-->
			</tr>
		</tbody>
	</table>
<div class="row justify-content-center" style="margin-bottom:50px">
<input type="button" class="btn btn-primary" value="ìë£" onclick="" style="margin-right:10px">
<input type="button" class="btn btn-primary" value="ì·¨ì" onclick="location.href='history.back()'" style="margin-right:10px">
<input type="reset" class="btn btn-primary" value="ì´ê¸°í">
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