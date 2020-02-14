<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" , initial-scale="1">
	<title>Beautycloset</title>
	<link rel="stylesheet" href="./css/bootstrap.css">
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<link rel="dns-prefetch" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
		rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="css/style.css">
	
	<link rel="icon" href="Favicon.png">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
	<script>
		var msg = "${msg}";
		if (msg == "Updated"){
			alert("회원정보 수정이 완료되었습니다.")
		}
	</script>
	
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
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input class="form-control mr-sm-2"
				type="text" placeholder="Search" name="search">
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

			<h1 class="text-center">Mypage</h1>
			<table class="table-bordered" style="height:350px;margin-left:auto;margin-right:auto">
<tbody>
<tr>
    <td><div class="card" style="width: 300px; height: 400px"><br>
				<a href="selfuseredit"><img src="../icon/user.png" class="rounded"
					alt="개인정보관리" style="width: 100px; height: 100px; margin-left:100px;"></a>
				<div class="card-body"><br>
					<a href="selfuseredit"><h4 class="card-title"
							style="text-align: center">개인정보관리</h4></a> <a href="selfuseredit"><p
							class="card-text" style="text-align: center">
							회원님의 개인정보를 <br>수정할 수 있습니다.
						</p></a>
				</div>
			</div></td>
    <td></td>
    <td><div class="card" style="width: 300px; height: 400px"><br>
				<a href="selfuserbasket"><img src="../icon/money.jpg" class="rounded"
					alt="장바구니" style="width: 100px; height: 100px; margin-left:100px;"></a>
				<div class="card-body"><br>
					<a href="selfuseredit"><h4 class="card-title"
							style="text-align: center">장바구니</h4></a> <a href="selfuseredit"><p
							class="card-text" style="text-align: center">
							회원님의 장바구니에 담긴 <br>상품을 확인할 수 있습니다.
						</p></a>
				</div>
			</div>
		</td>
    <td></td>
    <td><div class="card" style="width: 300px; height: 400px"><br>
				<a href="selforderinfo"><img src="../icon/cart.png" class="rounded"
					alt="주문내역" align="center" style="width: 100px; height: 100px; margin-left:100px;"></a>
				<div class="card-body"><br>
					<a href="orderedlist"><h4 class="card-title"
							style="text-align: center">주문내역</h4></a> <a href="orderedlist"><p							
							class="card-text" style="text-align: center">
							회원님의 주문내역을 <br>확인할 수 있습니다.</p></a></div></div></td>
    <td></td>
    <td>			<div class="card" style="width: 300px; height: 400px"><br>
				<a href="selfuserout"><img src="../icon/delete.png" class="rounded"
					alt="회원탈퇴" style="width: 100px; height: 100px; margin-left:100px;"></a>
				<div class="card-body"><br>
					<a href="selfuserout"><h4 class="card-title"
							style="text-align: center">회원탈퇴</h4></a> <a href="selfuserout"><p
							class="card-text" style="text-align: center">
							회원님의 탈퇴 및 개인정보 <br>삭제를 진행할 수 있습니다.
						</p></a>
				</div>
			</div>
		</td>
</tr>
</tbody>
</table>
</div>
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
		<script src="./js/bootstrap.js"></script>
</body>
</html>