<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용가능</title>
</head>
<body>
<br>ID=> '${requestScope.id }'는 사용가능<br><br>
 	<input type = "button" value = "사용하기" onclick="checkIdClose('${id }')">
</body>
<script type = "text/javascript" src ="../js/member.js"></script>
</html>