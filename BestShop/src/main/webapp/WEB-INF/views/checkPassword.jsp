<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
    <title>탈퇴 화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
        
        var msg = "${msg}";
		if (msg === "Wrong Password") {
			alert("패스워드가 일치하지 않습니다.");
		}
    </script>
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="<% request.getContextPath(); %>/user/delete"
        onsubmit="return checkValue()">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="pwd" name="pwd" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="">
        <input type="submit" value="탈퇴" /> 
    </form>
</body>
</html>