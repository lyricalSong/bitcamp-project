<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용불가능</title>
</head>
<body>
<form method = "post" action="/miniProject/member/checkId.do">
	ID=> '${requestScope.id }'는 <font color = "red">사용불가능</font><br><br>
	아이디 <input size =10 type = "text" name = "id"> 
	<input type = "submit" value ="검색">
</form>
</body>
<script type = "text/javascript" src ="../js/member.js"></script>
</html>