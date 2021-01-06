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
		</td>
	</tr>
	<tr>
		<td>
			국어
		</td>
		<td>
			<input type="text" id="kor" name="kor">
		</td>
	</tr>
	<tr>
		<td>
			영어
		</td>
		<td>
			<input type="text" id="eng" name="eng">
		</td>
	</tr>
	<tr>
		<td>
			수학
		</td>
		<td>
			<input type="text" id="math" name="math">
		</td>
	</tr>
	<tr colspan="2">
		<td>
			<input type="button" value="입력" id="inputBtn">
			<input type="reset" value="취소">
			<input type="button" value="출력" id="outputBtn">
		</td>
		
	</tr>
</table>
</form>

<script type="text/javascript">
$('#inputBtn').click(function(){
	
	$('#nameDiv').empty();
	$('#korDiv').empty();
	$('#engDiv').empty();
	$('#mathDiv').empty();
	
	if($('#name').val()==""){
		$('#nameDiv').text("이름을 입력하세요").css("font-weight","bold").css("color","red").css("font-size","8pt");	
		$('#name').focus();
	}else if($('#kor').val()==""){
		$('#korDiv').text("국어점수를 입력하세요").css("font-weight","bold").css("color","red").css("font-size","8pt");	
		$('#kor').focus();
	}else if($('#eng').val()==""){
		$('#engDiv').text("영어점수를 입력하세요").css("font-weight","bold").css("color","red").css("font-size","8pt");	
		$('#eng').focus();
	}else if($('#math').val()==""){
		$('#mathDiv').text("수학점수를 입력하세요").css("font-weight","bold").css("color","red").css("font-size","8pt");	
		$('#math').focus();
	}else{
		$.ajax({
			type: 'post',
			url: '/springProject/member/input',
			data: $('#inputForm').serialize(),
			dataType: 'text',
			success : function(data){
				alert("성공");
			},
			error : function(e){
				console.log(e);
			}
		});
	}
});

$('#outputBtn').click(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/member/output',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#outputTable tr:gt(0)').remove();
			
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq_sungjuk
				})).append($('<td/>',{
					align: 'center',
					text: items.name
				})).append($('<td/>',{
					align: 'center',
					text: items.kor
				})).append($('<td/>',{
					align: 'center',
					text: items.eng
				})).append($('<td/>',{
					align: 'center',
					text: items.math
				})).append($('<td/>',{
					align: 'center',
					text: items.tot
				})).append($('<td/>',{
					align: 'center',
					text: items.avg
				})).appendTo($('#outputTable')); 
				
				
				
			});
		},
		error: function(e){
			console.log(e);
		}
	});
});

</script>
</body>
</html>