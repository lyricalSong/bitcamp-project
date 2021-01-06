<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="margin-top: 20px;">
	<div style="position: relative;">
  	  <img id="image1">
	</div>
	<div>
		<table width="450" border="2" frame="hsides" rules="rows">
			<tr height="50">
				<th>상품명:<span id="imageboardNameSpan"></span></th>
			</tr>
			<tr>
				<td>단가: <span id="imageboardPriceSpan"></span></td>
			</tr>
			<tr>
				<td>개수:<span id="imageboardQtySpan"></span></td>
			</tr>
			<tr>	
				<td>합계: <span id="imageboardTotalSpan"></span></td>
			</tr>
		</table>
	</div>
</div>

	<div style="margin-top: 150px; clear: left; width:400px;">
	<span id="imageboardContentSpan"></span>
	</div>

<br>
 <div style="display: inline-block; text-align: right;">
<input type="button" value="목록" onclick="location.href='/springProject/imageboard/imageboardList?pg='+${pg}">
<input type="button" value="이미지삭제" onclick="location.href='/springProject/board/boardDelete?seq='+${seq}">
</div> 


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:'post',
		url:'getImageboardView',
		data: 'seq=${seq}',
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			let total = data.imageboardDTO.imagePrice * data.imageboardDTO.imageQty;
			
			$('#image1').attr('src', '../storage/'+data.imageboardDTO.image1); 
			$('#image1').attr('width','300px');
			$('#image1').css('float','left');
			$('#imageboardNameSpan').text(data.imageboardDTO.imageName);
			$('#imageboardPriceSpan').text(data.imageboardDTO.imagePrice.toLocaleString());
			$('#imageboardQtySpan').text(data.imageboardDTO.imageQty);
			$('#imageboardTotalSpan').text(total.toLocaleString());
			$('#imageboardContentSpan').text(data.imageboardDTO.imageContent);
			
			
		},
		error: function(e){
			console.log(e);
		}
	});
});
</script>










