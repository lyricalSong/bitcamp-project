<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form id= "modifyForm" name = "modifyForm">
<table border = "1" cellspacing = "0" cellpadding ="5">
 <tr>
  <td align = "center" width="100px"><font color = "red">*</font>이름</td>
  <td width = "240px"><input type = "text" value="${memberDTO.name }" name ="name" id ="name" size="15">
  						<div id ="nameDiv"></div>
  </td>						
 </tr>
 
  <tr>
  <td align = "center"><font color = "red">*</font>아이디 </td>
  <td><input type = "text" value="${memberDTO.id }" id="id" name ="id" readonly >
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
  		남<input type = "radio" name ="gender" id ="m" value ="0" >
		여<input type = "radio" name ="gender" id ="f" value ="1" >
	</td>
 </tr>
 
  <tr>
  <td align = "center">이메일</td>
  <td>
   <input type = "email" name ="email1"  value="${memberDTO.email1 }"style ="width:85px"> 
   @ <input type = "email" name ="email2" id="email2" list="defaultEmails" style ="width:85px" placeholder = "직접입력"> 
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
    <select name = "tel1" id ="tel1"> 
     <option value = "010" >010</option>
     <option value = "019">019</option>
     <option value = "011">011</option>
     </select>
       - <input type = "text" name ="tel2" value="${memberDTO.tel2 }"style ="width:50px" maxlength = "4">
       - <input type = "text" name ="tel3" value="${memberDTO.tel3 }" style ="width:50px" maxlength = "4"> 
  </td>
 </tr>
 
  <tr>
  <td align = "center">주소</td>
  <td>
   <input type = "text" name ="zipcode" id="zipcode" value="${memberDTO.zipcode }" style ="width:70px" readonly >
   			&nbsp;<input type = "button" value="우편번호검색" id="checkPostBtn"><br>
   <input type = "text" name ="addr1" id = "addr1" value="${memberDTO.addr1 }" size ="40" placeholder = "주소" readonly><br>
   <input type = "text" name ="addr2" id = "addr2" value="${memberDTO.addr2 }" size ="40" placeholder = "상세주소">
  </td>
 </tr>
 
  <tr>
   <td colspan = "2" align = "center">
    <input type ="button" value ="회원정보수정" id="modifyBtn">
    <input type = "reset" value ="다시작성">
   </td>
 </tr>
</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src ="../js/member.js"></script>
<script>
window.onload=function(){
	document.modifyForm.gender['${memberDTO.gender }'].checked = true;
	document.getElementById("email2").value = "${memberDTO.email2}";
	document.getElementById("tel1").value = "${memberDTO.tel1}";
}
</script>
