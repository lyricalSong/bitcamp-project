

//로그인버튼 누르면!!!!
$('#loginBtn').click(function(){
	$('div[class=idDiv]').empty();
	$('div[class=pwdDiv]').empty();
	
	if ($('input[class=id]').val()=="") {
		$('div[class=idDiv]').text("아이디를 입력하세요");
		$('input[class=id]').focus();
		$('div[class=idDiv]').css('color','red');
		$('div[class=idDiv]').css('font-weight','bold');
		$('div[class=idDiv]').css('font-size','8pt');
	} else if ($('input[class=pwd]').val()=="") {
		$('div[class=pwdDiv]').text("비밀번호를 입력하세요");
		$('input[class=pwd]').focus();
		$('div[class=pwdDiv]').css('color','red');
		$('div[class=pwdDiv]').css('font-weight','bold');
		$('div[class=pwdDiv]').css('font-size','8pt');
	} else{
		$.ajax({
    		type : 'post',
    		url : '/springProject/member/login',
    		data : {'id' : $('.id').val(),
    				'pwd' : $('.pwd').val()},
    		dataType : 'text',
    		success : function(data){
    			if(data == 'success'){
    				location.href = '/springProject/main/index';
    				
    			}else if(data == 'fail'){
    				$('#loginResultDiv').text("로그인 실패했습니다.");
    			}
    		},
    		error : function(e){
				console.log(e);
			}
    	});
	}
});


//회원가입
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if( $('#name').val() ==""){
		$('#nameDiv').text("이름을 입력하세요");
	    $('#name').focus();
		$('#nameDiv').css('color','red');
		$('#nameDiv').css('font-weight','bold');
		$('#nameDiv').css('font-size','8pt');
		return false;
		
	}else if($('#id').val()==""){	
		$('#idDiv').text("아이디를 입력하세요");
		$('#id').focus();
		$('#idDiv').css('color','red');
		$('#idDiv').css('font-weight','bold');
		$('#idDiv').css('font-size','8pt');
		return false;
		
	}else if($('#pwd').val()==""){
		$('#pwdDiv').text("비밀번호를 입력하세요");
		$('#pwd').focus();
		$('#pwdDiv').css('color','red');
		$('#pwdDiv').css('font-weight','bold');
		$('#pwdDiv').css('font-size','8pt');
		return false;
		
	}else if($('#repwd').val()!=$('#pwd').val()){
		$('#repwdDiv').text("비밀번호가 일치하지 않습니다");
		$('#repwd').focus();
		$('#repwdDiv').css('color','red');
		$('#repwdDiv').css('font-weight','bold');
		$('#repwdDiv').css('font-size','8pt');
		return false;
		
	}else if($('#check').val() != $('#id').val()){
    	$('#idDiv').text('중복체크 하세요')
        $('#idDiv').css('color', 'magenta')
        $('#idDiv').css('font-size', '8pt')
        $('#idDiv').css('font-weight', 'bold')
        $('#id').focus();
    } else{
		$('form[name=writeForm]').submit();
	}
	 
});

//아이디 중복체크(포커스아웃)
$('#id').focusout(function(){
	$('#idDiv').empty();
	let id = $('#id').val();
	if(id == ""){
		$('#idDiv').text("먼저 아이디를 입력하세요");
		$('#id').focus();
		$('#idDiv').css('color','blue');
		$('#idDiv').css('font-weight','bold');
		$('#idDiv').css('font-size','8pt');
	}else{
		$.ajax({
			type: 'post',
	 		url: '/springProject/member/checkId',
	 		data: 'id='+id,
	 		dataType: 'text',
	 		success : function(data){
	 			if(data == 'exist'){
					$('#idDiv').text('사용 불가능')
					$('#idDiv').css('color','magenta')
					$('#idDiv').css('font-size','8pt')
					$('#idDiv').css('font-weight','bold')
					
				}else if(data=='non_exist'){
					$('#check').val($('#id').val());
					
					$('#idDiv').text('사용 가능')
					$('#idDiv').css('color','blue')
					$('#idDiv').css('font-size','8pt')
					$('#idDiv').css('font-weight','bold')
				}
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
		
	
});

//중복체크 한번 더 
function doubleCheck(){
	document.writeForm.check.value=0;
}


//우편번호
$('#checkPostBtn').click(function(){
	window.open("/springProject/member/checkPost","","width = 550 height = 500 scrollbars =yes");	
});

//우편번호 검색 버튼을 누르면
$('#postSearchBtn').click(function(){
	$('#sidoDiv').empty();
	$('#sigunguDiv').empty();
	$('#roadnameDiv').empty();
	
	if($('#sido').val() == ''){
		$('#sidoDiv').text('시도선택');
		$('#sidoDiv').css('color','red');
		$('#sidoDiv').css('font-size','8pt');
		$('#sidoDiv').css('font-weight','bold');
	}else if($('#sido').val() !='세종' && $('#sigungu').val() == ''){
		$('#sigunguDiv').text('시군구 입력');
		$('#sigunguDiv').css('color','red');
		$('#sigunguDiv').css('font-size','8pt');
		$('#sigunguDiv').css('font-weight','bold');
	}else if($('roadname').val() == ''){
		$('#roadnameDiv').text('도로명 입력');
		$('#roadnameDiv').css('color','red');
		$('#roadnameDiv').css('font-size','8pt');
		$('#roadnameDiv').css('font-weight','bold');
	}else{
	
		$.ajax({
			type: 'post',
			url: '/springProject/member/postSearch',
			data: $('#checkPostForm').serialize(),
			dataType: 'json',
			success : function(data){
				//console.log(JSON.stringify(data));
				
				$('#postTable tr:gt(2)').remove();
				
				$.each(data.list, function(index, items){
					let address = items.sido+' '
								+ items.sigungu+' '
								+ items.yubmyundong+' '
								+ items.ri+' '
								+ items.roadname+' '
								+ items.buildingname;
						
						address = address.replace(/null/g,'');
								
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.zipcode
					})).append($('<td/>',{					
						colspan: '3',
						}).append($('<a/>',{
							id: 'addressA',
							href: '#',
							text: address
					}))).appendTo($('#postTable'));    
				});//each
				
				
				
				
				//a태그를 클릭했을 때
				$('a').click(function(){
					//alert($(this).parent().prev().text());
					$('#zipcode',opener.document).val($(this).parent().prev().text());
					$('#addr1',opener.document).val($(this).text());
					$('#addr2',opener.document).focus();
					window.close();
					
				});
				
				
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
});

//회원정보 수정
$('#modifyBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if( $('#name').val() ==""){
		$('#nameDiv').text("이름을 입력하세요");
	    $('#name').focus();
		$('#nameDiv').css('color','red');
		$('#nameDiv').css('font-weight','bold');
		$('#nameDiv').css('font-size','8pt');
		return false;
		
	}else if($('#pwd').val()==""){
		$('#pwdDiv').text("비밀번호를 입력하세요");
		$('#pwd').focus();
		$('#pwdDiv').css('color','red');
		$('#pwdDiv').css('font-weight','bold');
		$('#pwdDiv').css('font-size','8pt');
		return false;
		
	}else if($('#repwd').val()!=$('#pwd').val()){
		$('#repwdDiv').text("비밀번호가 일치하지 않습니다");
		$('#repwd').focus();
		$('#repwdDiv').css('color','red');
		$('#repwdDiv').css('font-weight','bold');
		$('#repwdDiv').css('font-size','8pt');
		return false;
		
	}else{
		$.ajax({
    		type: 'post',
    		url: '/springProject/member/modify',
    		data: $('#modifyForm').serialize(),
    		success: function(){
    			alert('회원 정보 수정 완료');
    			location.href='/springProject/main/index';
    		},
    		error: function(err){
    			console.log(err);
    		}
    	});
	}
	 
});







































