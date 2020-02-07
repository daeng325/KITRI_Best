<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>logout</title>
</head>
<body>

<h2> CUSTOM LOGOUT PAGE</h2>

<form method="post">
	<h3>Logout</h3>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<button type="submit" class="btn">Logout</button>
</form>

</body>
</html>