<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3></h3>
<form id="imageboardWriteForm" name="imageboardWriteForm" method="post" enctype="multipart/form-data" action="/springProject/imageboard/imageboardWrite">
<table border="1" cellspacing = "0">
  <tr>
   <td>상품코드</td>
   <td><input type="text" id="imageId" name="imageId" value="img_">
   		<div id="imageIdDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td>상품명</td>
   <td><input type="text" id="imageName" name="imageName" placeholder="상품명 입력">
   		<div id="imageNameDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td>단가</td>
   <td><input type="number" id="imagePrice" name="imagePrice" placeholder="단가 입력">
   		<div id="imagePriceDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td>갯수</td>
   <td><input type="number"  id="imageQty" name="imageQty" placeholder="갯수 입력">
   		<div id="imageQtyDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td>내용</td>
   <td><textarea cols="35" rows="10" name = "imageContent" id= "imageContent" placeholder ="내용 입력" style="resize: none;" ></textarea>
   		<div id="imageContentDiv"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan="2">
    <input type = "file" id="image1" name ="img" size="50">
    <div id="image1Div"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan="2">
    <input type = "file" id="image2" name ="img" size="50">
    <div id="image1Div"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan="2">
    <input type = "file" id="image3" name ="img[]" size="50" multiple>
    <div id="image1Div"></div>
   </td>
  </tr>
  
  <tr>
   <td colspan="2" align="center">
    <input type="button" id="imageboardWriteBtn" value="이미지등록">
    <input type="reset" value="다시작성">
   </td>
  </tr>
  
</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){
	$('#imageIdDiv').empty();
	$('#imageNameDiv').empty();
	$('#imagePriceDiv').empty();
	$('#imageQtyDiv').empty();
	$('#imageContentDiv').empty();
	$('#image1Div').empty();
	
	if($('#imageId').val() =='img_'){
		$('#imageIdDiv').text("상품코드를 입력하세요");
		$('#imageIdDiv').css('color','red');
		$('#imageIdDiv').css('font','8pt');
		$('#imageIdDiv').css('font-weight','bold');
	}else if($('#imageName').val()==''){
		$('#imageNameDiv').text("상품명 입력하세요");
		$('#imageNameDiv').css('color','red');
		$('#imageNameDiv').css('font','8pt');
		$('#imageNameDiv').css('font-weight','bold');
	}else if($('#imagePrice').val()==''){
		$('#imagePriceDiv').text("단가를 입력하세요(숫자만 가능)");
		$('#imagePriceDiv').css('color','red');
		$('#imagePriceDiv').css('font','8pt');
		$('#imagePriceDiv').css('font-weight','bold');
	}else if($('#imageQty').val()==''){
		$('#imageQtyDiv').text("상품개수를 입력하세요(숫자만 가능)");
		$('#imageQtyDiv').css('color','red');
		$('#imageQtyDiv').css('font','8pt');
		$('#imageQtyDiv').css('font-weight','bold');
	}else if($('#imageContent').val()==''){
		$('#imageContentDiv').text("상품내용를 입력하세요");
		$('#imageContentDiv').css('color','red');
		$('#imageContentDiv').css('font','8pt');
		$('#imageContentDiv').css('font-weight','bold');
	}else{
		//document.imageboardWriteForm.submit();
		$.ajax({
			type:'post',
			enctype:'multipart/form-data',
			processData: false, //이걸 안잡으면 문자열 형식으로 넘어간다 우리는 multipart타입으로 넘어가야 하므로 꼭 필요하다.
			contentType: false,
			url:'/springProject/imageboard/imageboardWrite',
			data: new FormData($('#imageboardWriteForm')[0]),
			success:function(){
				alert("이미지 업로드 완료");
				location.href='/springProject/imageboard/imageboardList';
			},
			error : function(e){
				console.log(e);
			}
			
			
		});
	}
});
</script>