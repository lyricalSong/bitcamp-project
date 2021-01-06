<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#paging{
color:black;
text-decoration:none;
cursor:pointer;
}

#currentPaging{
color:red;
text-decoration:underline;
cursor:pointer;
}
</style>
<br>
<form id="imageboardListForm" name="imageboardListForm" action="/springProject/imageboard/imageboardDelete">
<table id="imageboardListTable" border ="1" width =740" cellpadding = "3" frame="hsides" rules="rows">
   <tr>
    <th width ="155"><input type="checkbox" id="all">번호</th>
    <th width ="200" >이미지</th>
    <th width ="300">상품명</th>
    <th width ="100">단가</th>
    <th width ="65">개수</th>
    <th width ="100">합계</th>
    </tr> 

</table>
</form>
<br>
<div style="width:700px;">
  <c:if test="${memId == 'admin'}">
	<div style="float: left;">
		<input type="button" id="choiceDeleteBtn" value="선택삭제" >
	</div>
  </c:if>
	<div id="imageboardPagingDiv" style="">
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

/*'pg=${pg}'는 el로 파라미터로 controller에서 받아옴 
 * 'pg='+$('#pg').val() 는 제이쿼리 */
 $(document).ready(function(){
		$.ajax({
			type: 'post',
			url: '/springProject/imageboard/getImageboardList',
			data: 'pg=${pg}',
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data.list));
				
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.seq
						}).prepend($('<input/>',{
							type:'checkbox',
							value: items.seq,
							name:'check'
						}))
					).append($('<td/>',{
						align: 'center',
						}).append($('<img/>',{
							src: '../storage/'+items.image1,
							style: 'cursor: pointer; width: 100px; height: 100px;',
							class:items.seq+''
						}))
					).append($('<td/>',{
						align: 'center',
						text: items.imageName
					})).append($('<td/>',{
						align: 'center',
						text: items.imagePrice.toLocaleString()
					})).append($('<td/>',{
						align: 'center',
						text: items.imageQty
					})).append($('<td/>',{
						align: 'center',
						text: (items.imagePrice*items.imageQty).toLocaleString()
					})).appendTo($('#imageboardListTable'));
					
					//이미지 보기
					$('.'+items.seq).click(function(){
						location.href='/springProject/imageboard/imageboardView?seq='+items.seq+'&pg='+data.pg;
					});
					
				});//each
				
				//페이징 처리
				$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML);
				
			}, error: function(err){
				console.log(err);
			}
		});
	});

//전체 선택&해제
$('#all').click(function(){
	if($('#all').prop('checked'))
		$('input[name=check]').prop('checked',true);
	else
		$('input[name=check]').prop('checked',false);
});

//선택삭제
$('#choiceDeleteBtn').click(function(){
	let count = $('input[name=check]:checked').length;
	
	if(count == 0){
		alert("삭제할 항목을 선택하세요");
	}else{
		if(confirm("정말로 삭제하시겠습니까?")){
			$('#imageboardListForm').submit();
		}//삭제확인 if
	}
	
});
</script>
<script type="text/javascript">
function imageboardPaging(pg){
	
	location.href="imageboardList?pg="+pg;
	
}
</script>