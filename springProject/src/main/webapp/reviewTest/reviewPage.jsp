<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<!-- 별 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/myReviewStyle.css">
<title>임시 리뷰 JSP</title>
</head>
<body>      
	         
<input type="hidden" id="pg" name="pg" value="1">
<div class="container">
   <div id="row3" class="row">
	<div id="listDiv" class="col-12">

		<div id="inner-row1" class="row">		
			<div id="re1" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>아니 진짜 뭐..</span>
				</div>
			</div>

			
			<div id="re2" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<%-- <span>${imageboardDTO.imageContent}</span> --%>
				</div>
			</div>
			
			<div id="re3" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
					</span>
				</div>
			</div>
	
		</div><!--========default inner row1  -->
		
		<div id="inner-row2" class="row">
		
			<div id="re1" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
					</span>
				</div>
			</div>
			
			<div id="re2" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star "></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
					</span>
				</div>
			</div>
			
			<div id="re3" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
					</span>
				</div>
			</div>
	
		</div><!--default inner row  -->
		
		
		<div id="inner-row3" class="row">
		
			<div id="re1" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
						뭐 어쩌라는 거냐 트위스트 추면서
					</span>
				</div>
			</div>
			
			<div id="re2" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star "></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
					</span>
				</div>
			</div>
			
			<div id="re3" class="review col-3 ">
				<div id="reviewImg-Div" class="review-part">
					<img src="../image/NO IMAGE.jpg" class="img-responsive">
				</div>
				
				<div id="review-score" class="review-part">
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
				</div>
				
				<div id="review-content" class="review-part">
					<span>
					</span>
				</div>
			</div>
	
		</div><!--default inner row 3 -->
	</div><!-- col -->
  </div><!-- row3  -->
</div><!--★★★container★★★  -->


<!-- 리뷰 자세히 보는 모달 -->
	      <div class="modal" id="reviewModal" role="dialog">
	           <div class="modal-dialog">
	             <div class="modal-content">    
	               <!-- body -->
	               <div class="modal-body">
	               </div>
	             </div>
	           </div>
	         </div>
      
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>

<script type="text/javascript">
let isEnd = false;
let totalPg;
let idNum =3;
/* $(document).ready(fucntion(){
	 $.ajax({
	        url:"/springProject/imageboard/reviewTotalPg",
	        type: "post",
	        dataType: "json",
	        success: function(data){}
	 });
}); */
$(function(){
    $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        
        console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
        
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
        if( scrollTop + windowHeight + 30 > documentHeight ){
        	addList();
        }
    })
})

let addList = function(){
    if($('#pg').val() == 5){ //총 페이지를 계산해서 마지막 pg값 정해지면 스크롤 내려도 계속 return 해서 메소드에서 나가도록(나머지 수정!!!)
        return;
    }else{
    
    
    
    // 방명록 리스트를 가져올 때 시작 번호
    // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
    // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
    
    $.ajax({
    	data:'pg='+$('#pg').val(),
        url:"/springProject/imageboard/infiniteScroll",
        type: "post",
        dataType: "json",
        success: function(data){
            // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
            // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
            let length = data.list.length;
        	console.log("데이터 갯수= "+length+" pg= "+$('#pg').val());
        	
        	
        	let pg = parseInt($('#pg').val());
            $.each(data.list, function(index, items){
            	

            console.log("index="+index+" index%3= "+index%3+" (index/3)= "+(index/3));
            	
            	if(index ==0 || index==3 ){
			
	            	 let html ='<div id="inner-row'+(pg+idNum)+'" class="row">' 
	            		+'<div id="re" class="review col-3 ">'
	            		+'<input type="hidden" id="seq" value='+items.seq+'>'
	            		+'<div id="reviewImg-Div" class="review-part">'
	            	    +'<img src="../storage/'+items.image1+'" class="img-responsive">'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-score" class="review-part">'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-content" class="review-part">'
	            	    +'<span>'+items.imageContent+'</span>'
	            	    +'</div>'
	            	    +'</div>'
	            	    +'</div>'
	            	    
	            	    
	            	    $("#listDiv").append(html);
	            		idNum++; 
	            		
            	} else if(index%3 == 1||index%3 == 2){
            		
            		
            		let html = '<div id="re" class="review col-3 ">'
            			+'<input type="hidden" id="seq" value='+items.seq+'>'
	            	    +'<div id="reviewImg-Div" class="review-part">'
	            	    +'<img src="../storage/'+items.image1+'" class="img-responsive">'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-score" class="review-part">'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-content" class="review-part">'
	            	    +'<span>'+items.imageContent+'</span>'
	            	    +'</div>'
	            	    +'</div>'
	            	    
	            	    $("#listDiv .row").last().append(html);
					if(index == 5){
						idNum--;
            		}
	            	    
            	} 

            })
            
            
            pg++;
            $('#pg').val(pg);
            alert("pg= "+pg);
        }
    });
   }
}

$('#listDiv').on('click','.review',function(){
	 $('.modal-body').empty();
	
	let seq = $(this).children('#seq').val();
	
	 $.ajax({
	       data:'seq='+seq,
	        url:"/springProject/imageboard/getModalView",
	        type: "post",
	        dataType: "json",
	        success: function(data){
	        	let modalView= '<div id="modalViewImg-Div" class="modalView-part">'
            	    +'<img src="../storage/'+data.image1+'" class="modalViewImg img-responsive">'
            	    +'</div>'
            	    
            	    +'<div id="modalView-score" class="modalView-part">'
            	    +'<span class="fa fa-star checked"></span>'
            	    +'<span class="fa fa-star checked"></span>'
            	    +'<span class="fa fa-star checked"></span>'
            	    +'<span class="fa fa-star"></span>'
            	    +'<span class="fa fa-star"></span>'
            	    +'</div>'
            	    
            	    +'<div id="modalView-content" class="modalView-part">'
            	    +'<span>'+data.imageContent+'</span>'
            	    +'</div>'
            	    
				$('.modal-body').append(modalView);
	        }
	   
	   });  
	 
	 $('div.modal').modal(); 
});

</script>

</body>
</html>