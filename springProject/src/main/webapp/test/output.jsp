<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>출력화면</h2>
<table>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>국어</th>
    <th>영어</th>
    <th>수학</th>
    <th>총점</th>
    <th>평균</th>
  </tr>
  
<c:forEach var="sungjukDTO" items="${list}"> 
  <tr>
    <td>${sungjukDTO.seq }</td>
    <td>${sungjukDTO.name }</td>
    <td>${sungjukDTO.kor }</td>
    <td>${sungjukDTO.eng }</td>
    <td>${sungjukDTO.math }</td>
    <td>${sungjukDTO.tot }</td>
    <td>${sungjukDTO.avg }</td>
  </tr>
  
 </c:forEach>
</table>
</body>
</html>