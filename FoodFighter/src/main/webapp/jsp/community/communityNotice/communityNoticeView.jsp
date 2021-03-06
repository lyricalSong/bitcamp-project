<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta charset="UTF-8">
<title>커뮤니티 | 공지사항</title>
<style type="text/css">
body, html {
    height: 100%;
}
</style>
<!-- CSS 파일 -->
<link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityHeader.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityBoardView.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
</head>
<body>
<!-- 헤더 -->
<!--================ Header ================-->
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<div id="header-container">
	<div class="hamberger pull-left" onclick="myFunction(this)">
        <div class="bar1"></div>
        <div class="bar2"></div>
        <div class="bar3"></div>
    </div>
	   <a class="header-logo" href="/FoodFighter"><img src="../resources/img/logo.png" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
	      <ul id="header-menu">
		      <li class="header-items">
		  		<img src="../resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn">검색</button>
		      </li>
		       <li class="nav-item">
		           <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
		       </li>
	          <li class="nav-item">
	           <a class="nav-link js-scroll" href="/FoodFighter/community/communityMain">커뮤니티</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll" href="/FoodFighter/event/eventList">이벤트</a>
	          </li>
	          <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/community/communityNotice">공지사항</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll">
	            <img src="/FoodFighter/resources/img/member.png" id="headerUser" class="header_searchIcon" width="30" height="30" align="center">
	            </a>
     	     </li>
	   	</ul>
	</div>
	<!-- usermenu -->
    <div class="modal headUser-menu" id="headUser-menu" role="dialog">
  	  <div class="tri"></div>
  	  <c:if test="${memId == null}">
  	  	  <p>로그인 또는 회원가입을 하시면 <br> 더 많은 서비스를 <br>이용하실 수 있습니다.</p>
  		  <hr>
	  	  <button type="button" id="loginBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/loginForm'" >로그인</button>
	  	  <button type="button" id="signupBtn" class="headUserMenu-Btn" onclick="location.href='/FoodFighter/member/signupChoice'" >회원가입</button>
  	  </c:if>
  	  <c:if test="${memId == 'admin@admin.com'}">
  		  <p>관리자로<br> 로그인 하셨습니다. </p>
  		  <hr>
	  	  <button type="button" id="adminBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/admin/adminMain'" >관리자페이지</button>
	  	  <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
  	  </c:if>
  	  <c:if test="${memId != null && sessionScope.memId != 'admin@admin.com'}">
  		  <p>맛집을 찾아보고 <br> 후기를 남겨보세요.</p>
  		  <hr>
	  	  <button type="button" id="mypageBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/mypage/mypageMain'" >마이페이지</button>
	  	  <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
  	  </c:if>
    </div>
 </form>
<!-- 사이드바 -->
<div id="mySidenav" class="sidenav">
	<a href="communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
    <a href="communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
    <a href="communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
</div>
<!-- 본문 -->
<div class="container" style="margin-top : 95px; margin-bottom: 10px;">
	<div class="page-header" style="border-bottom: none !important;">
    	<h2 class="text-center">커뮤니티 공지사항</h2>      
   	</div>
</div>
<div class="page-body">
	<div class = "view-upper clearfix">
		<div class = "area_l">
			<c:choose>
				<c:when test="${nSrchOption != null and nKeyword != null }">
					<a href = "communityNoticeSearch?nSrchOption=${nSrchOption}&nKeyword=${nKeyword}">
						<span class = "plain-btn">목록</span></a>
				</c:when>
				<c:otherwise>
					<a href = "communityNotice">
							<span class = "plain-btn">목록</span></a>
				</c:otherwise>
			</c:choose>
			<c:if test="${cNPrev.nseq != null}">
				<c:choose>
					<c:when test="${nSrchOption != null and nKeyword != null}">
						<a href = "communityNoticeView?nseq=${cNPrev.nseq}&nSrchOption=${nSrchOption}&nKeyword=${nKeyword}">
							<span class = "plain-btn">이전글</span></a>
					</c:when>
					<c:otherwise>
						<a href = "communityNoticeView?nseq=${cNPrev.nseq}">
							<span class = "plain-btn">이전글</span></a>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${cNNext.nseq != null}">
				<c:choose>
					<c:when test="${nSrchOption != null and nKeyword != null}">
						<a href = "communityNoticeView?nseq=${cNNext.nseq}&nSrchOption=${nSrchOption}&nKeyword=${nKeyword}">
							<span class = "plain-btn">다음글</span></a>
					</c:when>
					<c:otherwise>
						<a href = "communityNoticeView?nseq=${cNNext.nseq}">
						<span class = "plain-btn">다음글</span></a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
		<div class = "area_r">
			<button class = "plain-btn adminModify">수정</button>
			<button class = "plain-btn adminDelete" style = "color : red;">삭제</button>
		</div>
	</div>
	<div class = "view_stat">
		<div class ="mphoto">
		</div>
		<div class = "info">
			<h1>
				<span class = "subject">${cNDTO.subject }</span>
			</h1>
			<p>
				<span class = "nickname" style="color: black">${cNDTO.nickname }</span>
				<fmt:formatDate var = "date" value="${cNDTO.logtime }" pattern="yyyy.MM.dd HH:mm"/>
					<span class = "date">${date }</span>
				<span class = "hit">조회 ${cNDTO.hit }</span>
				<span class = "comment">댓글<a class = "cmt_num">0</a></span>
			</p>
		</div>
	</div>
	<div class = "viewbox">
		<div class = "content">
			${cNDTO.content }
		</div>
	</div>
	<div class ="cont_recommendation">
		<div class = "area_l">
			<button class = "plain-btn" style = "background-color: white" id = "comment_info">댓글<span class = "cmt_num">0</span></button>
		</div>
	</div>
	<!-- 댓글 -->
	<div class = "cont_comment">
		<div class ="comment_write">
			<div class ="inner_text_write">
				<div class ="box_textarea">
					<textarea id = "reply" placeholder="댓글쓰기 기능이 제한된 게시판입니다."	
							readonly="readonly" style ="height : 86px;"></textarea>
				</div>
				<div class = "wrap_menu">
					<div class = "area_l">
						<button class = "btnTab">
							<span class ="ico_bbs ico_lock">비밀글</span>
						</button>
					</div>
					<div class = "area_r">
						<span class ="num_text">
							<span class ="sr_only">글자수</span>
							<span class ="num_count">0</span> / <span class ="sr_only">총 글자 개수</span> 600
						</span>
						<div class ="btn_group">
							<a href = "#">
							<span class = "plain-btn" id = "commentWrite" style ="background-color: red; color: white;">등록</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class ="clear"></div>
	</div>
	<div class = "view-upper clearfix" style = "margin-bottom : 30px;">
		<div class = "area_l">
			<c:choose>
				<c:when test="${nSrchOption != null and nKeyword != null }">
					<a href = "communityNoticeSearch?nSrchOption=${nSrchOption}&nKeyword=${nKeyword}">
						<span class = "plain-btn">목록</span></a>
				</c:when>
				<c:otherwise>
					<a href = "communityNotice">
							<span class = "plain-btn">목록</span></a>
				</c:otherwise>
			</c:choose>
			<button class = "plain-btn" id = "adminWrite">글쓰기</button>
		</div>
		<div class = "area_r">
			<button class = "plain-btn adminModify">수정</button>
			<button class = "plain-btn adminDelete" style = "color : red;">삭제</button>
		</div>
	</div>
</div>
<!--================  Footer ================-->
<div id="footer-container">
 <p class="copyright" style="text-align:left;">
     ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
       <br>고객센터: 0507-1414-9601<br><br>
        <strong>HOME | 리뷰리스트 | 커뮤니티 | 이벤트</strong><br><br>
       &copy; Copyright <strong>FoodFighter</strong>. All Rights Reserved
             Designed by FoodFighter
 </p>
</div>
</body>
<script type="text/javascript" src= "/FoodFighter/resources/js/community/communitySidenavJS.js"></script> <!-- 사이드바 JS -->
<script type="text/javascript" src= "/FoodFighter/resources/js/review/keyword.js"></script> <!-- 헤더 JS -->
<script type="text/javascript">
let id = '${memberDTO.nickname}';
let nseq = '${nseq}';
let nSrchOption = '${nSrchOption}';
let nKeyword = '${nKeyword}';
</script>
<script type="text/javascript" src ="/FoodFighter/resources/js/community/communityNoticeViewJS.js"></script>
</html>