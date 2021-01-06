<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet"> -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link rel ="stylesheet" href ="../css/styles.css">
</head>
<body>

<table width="100%" heigh="450px">
<tr>
<td colspan="2" ><jsp:include page="../template/top.jsp"></jsp:include></td>

</tr>
<tr class="second" >
<td class="left" valign="top"><jsp:include page="../template/left.jsp"></jsp:include></td>

<td align="center"><jsp:include page="${display}"></jsp:include></td>

</tr>
<tr>
<td colspan="2" ><jsp:include page="../template/bottom.jsp"></jsp:include></td>

</tr>
</table>

</body>
</html>