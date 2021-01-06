<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel ="stylesheet" href ="../css/loginstyle.css">

<form name = "loginForm" id="loginForm" action="/springProject/member/login">
<table id="logintable">
 <tr>
  <td align = "center" width="100px">아이디</td>
  <td width = "240px" align="left"><input type = "text" class="id" name ="id" size="15" > 
  									<div class="idDiv"></div>
  </td>
 </tr>
 
  <tr>
  <td align = "center">비밀번호 </td>
  <td align="left"><input type = "password" class="pwd"  name ="pwd">
  					<div class="pwdDiv"></div>
   </td>
 </tr>
 <tr>
   <td colspan = "2" align = "center">
    <input type ="button"  id="loginBtn" value ="로그인">   
       <input type = "button" value ="회원가입" onclick ="location.href='/springProject/member/writeForm'">
   </td>
 </table>
 <br><br>
 <div id="loginResultDiv" style="text-align:center; color: red;">
 </div>
 </form>
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src ="../js/member.js"></script>

	
