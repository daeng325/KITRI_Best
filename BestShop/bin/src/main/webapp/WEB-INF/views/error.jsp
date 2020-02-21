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
        <title>Error</title>
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
        <div class="container">
            <div class="card" style="border: black 2px solid; margin-left:250px; margin-top:60px; width: 650px; height: 700px">
                <div class="card-body">
                    <img src="/icon/oops.png" alt="페이지오류" style="margin-top:30px; margin-left:100px; width:400px; height:400px;">
                    
                    <h3 style="text-align:center; text-decoration:bold; color:red; margin-top:30px;">
                        페이지에 문제가 있어 로딩하지 못하였습니다.<br>
                        나중에 다시 시도해 주십시오.
                    </h3>
                    <br>
                    <input type="button" class="btn btn-danger" onclick="location.href='history.back()'" style="margin-left:250px;" name="errorback" value="뒤로 가기">
                    <input type="button" class="btn btn-danger" onclick="location.href='<% request.getContextPath(); %>/main'" style="margin-left:260px; margin-top:10px;" name="errorback" value="홈으로">

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>