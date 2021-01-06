<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>회원가입</h3>
<form name ="writeForm" method = "post" action ="/springProject/member/write">
<table border = "1" cellspacing = "0" cellpadding ="5">
 <tr>
  <td align = "center" width="100px"><font color = "red">*</font>이름</td>
  <td width = "240px"><input type = "text" placeholder = "이름 입력" name ="name" id ="name" size="15"> 
  					  <div id ="nameDiv"></div>
  </td>
 </tr>
 
  <tr>
  <td align = "center"><font color = "red">*</font>아이디 </td>
  <td><input type = "text" placeholder = "아이디 입력" id="id" name ="id" >
      <!-- <input type = "button" value = "중복체크" id="checkId"> -->
      <input type="hidden" id ="check" name="check" value= "">
      <div id ="idDiv"></div>
  </td>
 </tr>
  <tr>
  <td align = "center"><font color = "red">*</font>비밀번호</td>
  <td><input type = "password" id ="pwd" name="pwd">
   	  <div id ="pwdDiv"></div>
  </td>
 </tr>
 
  <tr>
  <td align = "center"><font color = "red">*</font>재확인</td>
  <td><input type = "password" id ="repwd" name="repwd">
  	  <div id ="repwdDiv"></div>
   </td>
 </tr>
 
  <tr>
  <td align = "center">성별</td>
  	<td>
  		남<input type = "radio" name ="gender" value ="0" checked>
		여<input type = "radio" name ="gender" value ="1" >
	</td>
 </tr>
 
  <tr>
  <td align = "center">이메일</td>
  <td>
   <input type = "email" name ="email1" style ="width:85px"> 
   @ <input type = "email" name ="email2" list="defaultEmails" style ="width:85px" placeholder = "직접입력"> 
   	  <datalist id="defaultEmails">
         <option value="naver.com">
         <option value="hanmail.net">
         <option value="gmail.com">
      </datalist>
  </td>
 </tr>
 
  <tr>
  <td align = "center">핸드폰</td>
  <td> 
    <select name = "tel1"> 
     <option value = "010" selected>010</option>
     <option value = "019">019</option>
     <option value = "011">011</option>
     </select>
       - <input type = "text" name ="tel2" style ="width:50px" maxlength = "4">
       - <input type = "text" name ="tel3" style ="width:50px" maxlength = "4"> 
  </td>
 </tr>
 
  <tr>
  <td align = "center">주소</td>
  <td>
   <input type = "text" name ="zipcode" id="zipcode" style ="width:70px" readonly >
   			&nbsp;<input type = "button" value="우편번호검색" id="checkPostBtn"><br>
   <input type = "text" name ="addr1" id = "addr1" size ="40" placeholder = "주소" readonly><br>
   <input type = "text" name ="addr2" id = "addr2" size ="40" placeholder = "상세주소">
  </td>
 </tr>
 
  <tr>
   <td colspan = "2" align = "center">
    <input type ="button" value ="회원가입" id ="writeBtn">
    <input type = "reset" value ="다시작성">
   </td>
 </tr>
</table>
<br>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type ="text/javascript" src = "../js/member.js"></script>


