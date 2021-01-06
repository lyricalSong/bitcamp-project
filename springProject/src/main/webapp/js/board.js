//글 쓸 때
$('#boardWriteBtn').click(function(){
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
	
		document.forms[0].submit();
		/*
		$.ajax({
			type : 'post',
    		url : '/springProject/board/boardWrite',
    		data : {'subject' : $('#subject').val(),
    				'content' : $('#content').val()},
    		success : function(){
    			alert("작성하신 글을 저장하였습니다.");
    			location.href='/springProject/board/boardList';

    		},
    		error : function(e){
				console.log(e);
			}
			
		});
		*/
	}
	
	
});

//답글 쓸 때






function checkBoardModifyForm(){
	if(document.boardModifyForm.subject.value == "") {
		alert("제목을 입력하세요");
 		document.boardModifyForm.subject.focus();
	 }
	else if(document.getElementById("content").value == ""){
		alert("내용을 입력하세요");
		document.boardModifyForm.content.focus();
	 }
	else document.boardModifyForm.submit();
}
function checkBoardReplyForm(){
	if(document.boardReplyForm.subject.value == "") {
		alert("제목을 입력하세요");
 		document.boardReplyForm.subject.focus();
	 }
	else if(document.getElementById("content").value == ""){
		alert("내용을 입력하세요");
		document.boardReplyForm.content.focus();
	 }
	else document.boardReplyForm.submit();
}
