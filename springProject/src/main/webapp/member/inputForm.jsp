<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>입력화면</h2>
<form id="inputForm" name="inputForm" method="post">
<table>
	<tr>
		<td >
			이름
		</td>
		<td>
			<input type="text" id="name" name="name">
			<div id="nameDiv"></div>
		</td>
	</tr>
	<tr>
		<td>
			국어
		</td>
		<td>
			<input type="text" id="kor" name="kor">
			<div id="korDiv"></div>
		</td>
	</tr>
	<tr>
		<td>
			영어
		</td>
		<td>
			<input type="text" id="eng" name="eng">
			<div id="engDiv"></div>
		</td>
	</tr>
	<tr>
		<td>
			수학
		</td>
		<td>
			<input type="text" id="math" name="math">
			<div id="mathDiv"></div>
		</td>
	</tr>
	<tr colspan="2">
		<td>
			<input type="button" value="입력" id="inputBtn">
			<input type="reset" value="취소">
			<input type="button" value="출력" onclick="location.href='/springProject/member/outputForm'">
		</td>
		
	</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#inputBtn').click(function(){
	
	$('#nameDiv').empty();
	$('#korDiv').empty();
	$('#engDiv').empty();
	$('#mathDiv').empty();
	
	if($('#name').val()==""){
		$('#nameDiv').text("이름을 입력하세요")
		$('#nameDiv').css("font-weight","bold")
		$('#nameDiv').css("color","red")
		$('#nameDiv').css("font-size","8pt");	
		$('#name').focus();
	}else if($('#kor').val()==""){
		$('#korDiv').text("국어점수를 입력하세요")
		$('#korDiv').css("font-weight","bold")
		$('#korDiv').css("color","red")
		$('#korDiv').css("font-size","8pt");	
		$('#kor').focus();
	}else if($('#eng').val()==""){
		$('#engDiv').text("영어점수를 입력하세요")
		$('#engDiv').css("font-weight","bold")
		$('#engDiv').css("color","red")
		$('#engDiv').css("font-size","8pt");	
		$('#eng').focus();
	}else if($('#math').val()==""){
		$('#mathDiv').text("수학점수를 입력하세요")
		$('#mathDiv').css("font-weight","bold")
		$('#mathDiv').css("color","red")
		$('#mathDiv').css("font-size","8pt");	
		$('#math').focus();
	}else{
		$.ajax({
			type: 'post',
			url: '/springProject/member/input',
			data: $('#inputForm').serialize(),
			dataType: 'text',
			success : function(data){
				alert("입력완료");
				$('#name').empty();
				$('#kor').empty();
				$('#eng').empty();
				$('#math').empty();
			},
			error : function(e){
				console.log(e);
			}
		});
	}
});




</script>
</body>
</html>