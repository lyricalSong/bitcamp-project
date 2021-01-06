<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h3>답글쓰기</h3>
<form name = "boardReplyForm" method="post" action="/springProject/board/boardReply">
<input type = "hidden" name="pseq" value="${pseq}">
<input type = "hidden" name="pg" value="${pg}">

<table border ="1" cellspacing = "0">
 <tr>
  <td align = "center">제목</td>
  <td><input type = "text"  id="subject" name ="subject" placeholder ="제목 입력" size ="30"> 
  		<div id="subjectDiv"></div>
  </td>
 </tr>
 <tr>
 <tr>
  <td align = "center">내용</td>
  <td><textarea cols="35" rows="10" name = "content" id= "content" placeholder ="내용을 입력" style="resize: none;" ></textarea>
  		<div id="contentDiv"></div>
  </td>
 </tr>
 <tr>
   <td colspan = "2" align = "center">
    <input type ="button" value ="답글쓰기" id="boardWriteBtn">   
       <input type = "reset" value ="다시작성">
   </td>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="../js/board.js?var=1"></script>