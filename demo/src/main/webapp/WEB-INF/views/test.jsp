<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
     <form action="<% request.getContextPath(); %>/review/test" method='post' enctype="multipart/form-data">
		image : 
		<input type="file" value="image" name="image"/> <br>
		<input type="submit" value="save"/> save
	</form>
</body>
</html>