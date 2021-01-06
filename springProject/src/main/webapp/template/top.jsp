<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2><img src="../image/first.jpg" id="topImg" width="80" height="80" onclick ="location.href='/springProject/main/index'" style="cursor:pointer;">
Spring MVC기반의 미니 프로젝트</h2>

<div class="atag">
<c:if test="${ memId == null}">
</c:if>


<c:if test="${ memId != null}">
 <a href="/springProject/board/boardWriteForm">글쓰기</a>&emsp;
	 <c:if test="${ memId == 'admin'}">
	 <a href="../imageboard/imageboardWriteForm">이미지등록</a>&emsp; 
	</c:if>
</c:if>

  <a href="../board/boardList">목록</a>&emsp;
  <a href="../imageboard/imageboardList">이미지목록</a>&emsp;

</div>
