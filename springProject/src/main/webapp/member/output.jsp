<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>출력화면</h2>
<table id="outputTable">
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>국어</th>
    <th>영어</th>
    <th>수학</th>
    <th>총점</th>
    <th>평균</th>
  </tr>

</table>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('document').ready(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/member/output',
		dataType: 'json',
		success: function(data){
			
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
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