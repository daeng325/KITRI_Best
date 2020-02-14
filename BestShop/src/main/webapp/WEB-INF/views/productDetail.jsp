<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width" , initial-scale="1">
   
   <title>Beautycloset</title>
   <link rel="stylesheet" href="../css/bootstrap.css">
   <link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
      integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ"
      crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="../js/bootstrap.js"></script>
   <script src="../js/quantity.jquery.js"></script>
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
      
               body {
                    font-family: sans-serif;
               }
               .list {
                    list-style: none;
                    padding: 0;
               }
               details {
                    transition: height 1s;
                    width:1000px;
                    margin-left:100px;
                    text-align: center;
               }
               details:not([open]) {
                    height: auto;
               }
               details[open] {
                    height: auto;
               }
               details > summary {
                    list-style: none;
                    padding: 10px;
                    margin: 0;
                    border-top: 1px solid #ddd;
                    background: #f4f4f4;
                    cursor: pointer;
                    display: block;
               }
               details > summary::-webkit-details-marker {
                    display: none;
               }
   </style>  
   <script>
      var msg = "${msg}";
      if(msg == "NotAllowed"){
         alert("본인이 작성한 문의만 삭제가 가능합니다.");
      }
      if(msg=="checkedNull"){
         alert("수정할 문의사항을 선택해주세요.")
      }
      if(msg=="checkOne"){
         alert("수정은 한 개씩만 가능합니다. 한 개 항목만 골라주세요.")
      }
      if(msg=="checkId"){
         alert("본인이 작성한 문의사항만 수정이 가능합니다.")
      }
   </script>
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/main">Home</a></li>
         <li class="nav-item"><sec:authorize access="isAnonymous()">
               <a class="nav-link" href="<% request.getContextPath(); %>/user/login">Login</a>
            </sec:authorize> <sec:authorize access="isAuthenticated()">
               <a class="nav-link" href="<% request.getContextPath(); %>/user/logout">Logout</a>
            </sec:authorize></li>
         <li class="nav-item"><sec:authorize access="isAnonymous()">
               <a class="nav-link" href="<% request.getContextPath(); %>/user/join">Join</a>
            </sec:authorize> <sec:authorize access="isAuthenticated()">
               <a class="nav-link" href="<% request.getContextPath(); %>/user/mypage">Mypage</a>
            </sec:authorize></li>

      </ul>
      <form class="form-inline" action="search" method="post">
         <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" /> <input class="form-control mr-sm-2"
            type="text" placeholder="Search" name="search">
         <button class="btn btn-success" type="submit">Search</button>
      </form>
   </nav>
   <div class="container">
      <div class="logo">
         <h1 class="text-center">
            <a href="<% request.getContextPath(); %>/main">Beautycloset</a>
         </h1>
      </div>
   </div>
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="<% request.getContextPath(); %>/main">Home</a></li>
			<li class="nav-item"><sec:authorize access="isAnonymous()">
					<a class="nav-link" href="<% request.getContextPath(); %>/user/login">Login</a>
				</sec:authorize> <sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="<% request.getContextPath(); %>/user/logout">Logout</a>
				</sec:authorize></li>
			<li class="nav-item"><sec:authorize access="isAnonymous()">
					<a class="nav-link" href="<% request.getContextPath(); %>/user/join">Join</a>
				</sec:authorize> <sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="<% request.getContextPath(); %>/user/mypage">Mypage</a>
				</sec:authorize></li>

		</ul>
		<form class="form-inline" action="search" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input class="form-control mr-sm-2"
				type="text" placeholder="Search" name="search">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
	</nav>
	<div class="container">
		<div class="logo">
			<h1 class="text-center">
				<a href="<% request.getContextPath(); %>/main">Beautycloset</a>
			</h1>
		</div>
	</div>
	<div class="container-fluid">
		<ul class="nav justify-content-center">
                <li class="nav-item">
               <a class="nav-link" href="<% request.getContextPath(); %>/top">Top</a></li>
            <li class="nav-item">
               <a class="nav-link" href="<% request.getContextPath(); %>/bottom">Bottom</a></li>
            <li class="nav-item">
               <a class="nav-link" href="<% request.getContextPath(); %>/bag">Bags & Shoes</a></li>
            <li class="nav-item">
               <a class="nav-link" href="<% request.getContextPath(); %>/accesorie">Accesories</a></li>
         </ul>
      </nav>


      <form>
      
      <div class="row">
         <div class="col-md-7">
            <img class="img" style="margin-left:270px; margin-top:30px" width="250" height="380" src='data:image/jpg;base64,${ products.image_thumbnail }' alt="${ products.name }">
         </div>
         <div class="col-md-4" style="margin-top: 40px;">
            <div class="card">
               <div class="card-header" style="text-align:center">${products.name}</div>
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
                              <input type="number" id="qty_input" name="count" class="form-control form-control-sm" value="1" min="1">
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
                        <a class="btn btn-primary btn-lg" href="<% request.getContextPath(); %>/order?or=${products.id}" role="button">주문하기</a>
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
      </form>

   </div>
   <br>
   <ul class="nav nav-tabs nav-justified">
      <li class="nav-item active"><a class="nav-link" data-toggle="tab" href="#상품정보">상품정보</a></li>
      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#qna">Q & A</a></li>
      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Review">Review</a></li>
   </ul>
   <div class="tab-content">

      <div class="tab-pane fade" id="qna">
         <br>
         <div class="container">
            <h2 style="text-align: center">Q & A</h2>
            <br>
            <p style="text-align: center">상품 배송, 사이즈, 환불 등 다양한 질문에 대해 관리자가 친절하게 대답해 드립니다.</p>
               
            <form>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="num" value="${products.id }" />
            <table class="table">
               <thead class="thead-dark">
                  <tr>
                     <th></th>
                     <th>작성자</th>
                     <th></th>
                     <th>제목</th>
                     <th></th>
                     <th>작성시간</th>
                     <th></th>
                  </tr>
               </thead>
               <c:forEach items="${questions }" var="question">
               
                  <tbody>
                     <tr>
                       <th><input type="checkbox" id="checked" name="checked" value="${question.id }"></th>
                       <th><a data-toggle="collapse" href="#collapse1">${question.u_id }</a></th>
                          <th></th>
                          <th><a data-toggle="collapse" href="#collapse1">${question.title }</a></th>
                          <th></th>
                          <th><a data-toggle="collapse" href="#collapse1">${question.createTime }</a></th>
                          <th></th>
                     </tr>
                     
                     <tr id="collapse1" class="panel-collapse collapse">
                        <td>
                           <c:if test="${question.image ne null}">
                              ${question.image }
                           </c:if>
                           ${question.content }
                        </td>
                     </tr>
                  </tbody>
               </c:forEach>
            </table>
            
               <div class="row justify-content-center" style="margin-bottom: 50px">
                  <input type="submit" class="btn btn-primary" value="수정" formmethod="get"
                     formaction="<% request.getContextPath(); %>/question/update" style="margin-right: 10px">
                  <input type="button" class="btn btn-primary" value="추가"
                     onclick="location.href='<% request.getContextPath(); %>/question/upload?num=${products.id }'" style="margin-right: 10px"> 
                  <input type="submit" class="btn btn-primary" value="삭제" formmethod="post"
                     formaction="<% request.getContextPath(); %>/question/delete" style="margin-right: 10px">
               </div>
            </form>
         </div>
      </div>

      <div class="tab-pane fade in active" id="상품정보">
         <br> ${products.description} <br> 가격 : ${products.price } <br>
         <br>
         <img class="img" width="175" height="250" src='data:image/jpg;base64,${ products.image_thumbnail }' alt="${ products.name }">
         <br>
         <img class="img" width="175" height="250" src='data:image/jpg;base64,${ products.image_detail }' alt="${ products.name }">
         <br>
      </div>

      <div class="tab-pane fade" id="Review">
         <div class="container">
            <h2 style="text-align: center">Review</h2>
            <br>

            <p style="text-align: center">상품에 대해 리뷰 올려주시면 적립금 드립니다.</p>
            <table class="table">
               <thead class="thead-dark">
                  <tr>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>평점</th>
                     <th>내용</th>
                  </tr>
               </thead>
               <c:forEach items="${reviews }" var="review">
               
                  <tbody>
                     <tr>
                     <th><a data-toggle="collapse" href="#collapse1">${review.title }</a></th>
                     <th><a data-toggle="collapse" href="#collapse1">${review.u_id }</a></th>
                                <th><a data-toggle="collapse" href="#collapse1">${review.rev_agv }</a></th>
                               <th><a data-toggle="collapse" href="#collapse1">test</a></th>
                     </tr>
                     
                     <tr id="collapse1" class="panel-collapse collapse">
                        <td>
                           <c:if test="${review.image_1 ne null}">
                           <img class="img" width="80" height="120" src='data:image/${review.ext_1};base64,${review.image_1}' alt="${review.title}">   
                           </c:if>
                           <c:if test="${review.image_2 ne null}">
                           <img class="img" width="80" height="120" src='data:image/${review.ext_2};base64,${review.image_2}' alt="${review.title}">   
                           </c:if>
                           <c:if test="${review.image_3 ne null}">
                           <img class="img" width="80" height="120" src='data:image/${review.ext_3};base64,${review.image_3}' alt="${review.title}">
                           </c:if>
                           <br>
                           가격 : ${review.rev_price}  <br>
                           품질 : ${review.rev_quality}  <br>
                            배송 : ${review.rev_ship}  <br>
                           내용 : ${review.content } <br>
                           시간 : ${review.createTime } <br>
                        </td>
                     </tr>
                  </tbody>
               </c:forEach>
            </table>
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