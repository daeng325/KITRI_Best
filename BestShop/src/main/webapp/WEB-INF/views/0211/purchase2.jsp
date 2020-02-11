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
<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        </div>
    </div>
</nav>
<main class="login-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">실시간계좌이체</div>
                    <div class="card-body">
                        <form action="<%= request.getContextPath() %>/" method="post">
                            <div class="form-group row">
                                             <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>은행 선택</td>
                                                        <td><select class="form-control form-control-md" id="choosebank2">
                                                            <option name="choicebank">선택하세요</option>
                                                            <option name="국민">국민</option>
                                                            <option name="기업">기업</option>
                                                            <option name="외환">외환</option>
                                                            <option name="농협">농협</option>
                                                            <option name="우리">우리</option>
                                                            <option name="하나">하나</option>
                                                            <option name="신한">신한</option>   
                                                        </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>입금주명</td>
                                                        <td><input type="text" class="form-control" name="purchasername2" placeholder="예금주명을 입력하세요"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>계좌번호</td>
                                                        <td><input type="text" class="form-control" name="accountinput" placeholder="계좌번호를 입력하세요"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>카드번호</td>
                                                        <td><input type="text" class="form-control" name="cardnum" placeholder="카드번호를 입력하세요"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>계좌/카드 비밀번호</td>
                                                        <td><input type="password" class="form-control" name="accountpass" placeholder="비밀번호를 입력하세요"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>예금주</td>
                                                        <td>Beautycloset</td>
                                                    </tr>
                                                    <tr>
                                                        <td>현금영수증 발행</td>
                                                        <td><input type="radio" value="nobill" name="billmethod">미발행</td>
                                                        <td><input type="radio" value="mobile" name="billmethod">핸드폰번호</td>
                                                        <td><input type="radio" value="credit" name="billmethod">신용카드 번호</td>
                                                    </tr>
                                                    <tr>
                                                        <td>번호입력</td>
                                                        <td><input type="text" class="form-control" name="billinput" placeholder="번호를 입력하세요"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        <input type="button" class="btn btn-primary" value="결제하기" onclick="location.href='buycomplete'" style="margin-left:300px;margin-right:10px">
                                        <input type="button" class="btn btn-primary" value="취소하기" onclick="location.href='history.back()'" style="margin-right:10px">
                                        </div>
                                        </form>
                                    </div>
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