<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
<!-- 로그인을 안 했을 때 -->
<c:if test="${memId == null}"><%-- =${empty id } --%>
<jsp:include page="../member/loginForm.jsp"/>
</c:if>

<!-- 로그인성공했을때 -->
<c:if test="${memId != nullnot}"><%-- =${empty id}  --%>
<jsp:include page="../member/loginOk.jsp"/>
</c:if>

<%-- <!-- 로그인했는데 실패했을 때  -->
<c:if test="${memId == null && loginFail == 'fail'}">
<jsp:include page="../member/loginFail.jsp"/>
</c:if> --%>
</div>