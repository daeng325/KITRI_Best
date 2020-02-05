<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fieldset>
     <legend>Product Upload</legend>
     <table>
     <form action="<% request.getContextPath(); %>/product/upload" method='post' enctype="multipart/form-data">
          <tr>
              <td>id: </td>
              <td><input type="text" name="id"/></td>
          </tr>
          <tr>
              <td>name : </td>
              <td><input type="text" name="name"/></td>
          </tr>
          <tr>
              <td>type : </td>
              <td><input type="text" name="type"/></td>
          </tr>
          <tr>
              <td>price: </td>
              <td><input type="text" name="price"/></td>
          </tr>
          <tr>
              <td>description : </td>
              <td><input type="text" name="description"/></td>
          </tr>
          <tr>
              <td>image : </td>
              <td><input type="file" value="파일 선택" name="image"/></td>
          </tr>
          <tr>
              <td>status : </td>
              <td><input type="text" name="status"/></td>
          </tr>
          <tr>
              <td colspan="2"><input type="submit" value="��濡���"/></td>
          </tr>
         </form>
     </table>
</fieldset>

</body>
</html>