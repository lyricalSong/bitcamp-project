<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h3>글 수정</h3>
<form id="boardModifyForm" name = "boardModifyForm">
<input type = "hidden" id="seq" name ="seq" value="${seq }">
<input type = "hidden" id="pg" name ="pg" value="${pg }">

<table border ="1" cellspacing = "0">
 <tr>
  <td align = "center"><font color = "red">*</font>제목</td>
  <td><input type = "text"  id="subject" name ="subject" placeholder ="제목 입력" size ="30" >
  		<div id="subjectDiv"></div>
  </td>
 </tr>
 <tr>
 <tr>
  <td align = "center"><font color = "red">*</font>내용</td>
  <td><textarea cols="35" rows="10" name = "content" id= "content" placeholder ="내용을 입력"  style="resize: none;" ></textarea>
  		<div id="contentDiv"></div>
  </td>
 </tr>
 <tr>
   <td colspan = "2" align = "center">
    <input type ="button" value ="글수정" id="boardModifyBtn">   
       <input type = "reset" value ="다시작성">
   </td>
</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardView',
		data : 'seq='+$('#seq').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$('#subject').val(data.boardDTO.subject);
			$('#content').text(data.boardDTO.content);
		},
		error: function(err){
			console.log(err);
		}
	});
});




$('#boardModifyBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() ==''){
		$('#subjectDiv').text("제목을 입력하세요");
	    $('#subject').focus();
		$('#subjectDiv').css('color','red');
		$('#subjectDiv').css('font-weight','bold');
		$('#subjectDiv').css('font-size','8pt');
		
		return false;
	}else if($('#content').val() ==''){
		$('#contentDiv').text("내용을 입력하세요");
	    $('#content').focus();
		$('#contentDiv').css('color','red');
		$('#contentDiv').css('font-weight','bold');
		$('#contentDiv').css('font-size','8pt');
		
		return false;
	}else{
		$.ajax({
			type:'post',
			url:'/springProject/board/boardModify',
			data:$('#boardModifyForm').serialize(),
			success:function(data){
				alert("글 수정 완료!");
				location.href='/springProject/board/boardList?pg='+$('#pg').val();
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	
});
</script>
