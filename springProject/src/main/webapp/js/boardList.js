$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/springProject/board/getBoardList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
					align: 'center'
					}).append($('<a/>',{
						id: 'subjectA',
						href: '#',
						text: items.subject,
						class: items.seq+''
				}))).append($('<td/>',{
					align: 'center',
					text: items.name
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));  
				
				//답글이미지
				for(i=0; i<items.lev;i++){
					$('.'+items.seq).before('&emsp;');
				}
				if(items.pseq !=0){
					$('.'+items.seq).before($('<img/>',{
							src:'../image/reply.gif'
						}));
				}       
			});//each
			
			//제목 클릭했을 때
			$('#boardListTable').on('click','#subjectA',function(){
				//alert($(this).prop('class'));
				//alert($(this).parent().prev().text());
				
				if(data.memId == null){
					alert("먼저 로그인 하세요");
				}else{
					let seq = $(this).attr('class');
					let pg = data.pg;
				location.href='/springProject/board/boardView?seq='
													+seq+'&pg='+pg;
				}//로그인 했는지 안헀는지 if
				
			});//리스트 갖고오는 ajax
			
			//페이징처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		},
		error: function(err){
			console.log(err);
		}
	});
	
	
$('#boardListTable tr td:gt(1)').append($('<a/>'),{
			id:'subjectA',
			href:'javascript:void(0)'
	});
});

$('#boardSearchBtn').click(function(event,str){
	if(str != 'continue') $('input[name=pg]').val(1);
	
	if($('#keyword').val()==''){
			alert("검색어를 입력하세요");
		}else{
			$.ajax({
			type:'post',
			url : '/springProject/board/getBoardSearch',
			data: {	'pg':$('input[name=pg]').val(),
					'searchOption': $('#searchOption').val(),
					'keyword' : $('#keyword').val()},
			dataType: 'json',
			success:function(data){
				//alert(JSON.stringify(data));
				
				$('#boardListTable tr:gt(0)').remove();
				
				
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.seq
					})).append($('<td/>',{
						align: 'center',
						text: items.subject
					})).append($('<td/>',{
						align: 'center',
						text: items.name
					})).append($('<td/>',{
						align: 'center',
						text: items.logtime
					})).append($('<td/>',{
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));         
				});//each
				
				//페이징처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			
			},
			error: function(err){
				console.log(err);
			}
		});
	}//if
	
});



