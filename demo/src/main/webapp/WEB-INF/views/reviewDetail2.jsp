<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
				<c:if test = "${login eq null }">
					<a class="nav-link" href="user/login">Login</a>
				</c:if>
				<c:if test = "${login ne null }">			
					<a class="nav-link" href="user/logout">Logout</a>
				</c:if>					
			</li>
			<li class="nav-item">
				<c:if test = "${login eq null }">
					<a class="nav-link" href="user/join">Join</a>
				</c:if>
				<c:if test = "${login ne null }">
					<a class="nav-link" href="user/mypage">Mypage</a>
				</c:if>
			</li>
      </ul>
      <form class="form-inline" action="<% request.getContextPath(); %>/product/search" method="post">
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

	id : ${reviews.id } <br>
	u_id : ${reviews.u_id } <br>
	price : ${reviews.rev_price} <br>
	quality : ${reviews.rev_quality} <br>
	ship : ${reviews.rev_ship} <br>
	agv : ${reviews.rev_agv} <br>
	내용 : ${reviews.content }<br>
	이미지 : <img class="img1-1" src="${reviews.image_1 }" alt="${reviews.id}">
	
	
</body>
</html>