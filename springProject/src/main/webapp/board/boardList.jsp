<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#subjectA:link{color:black; text-decoration:none;}
#subjectA:visited{color:black; text-decoration:none;}
#subjectA:hover{color:green; text-decoration:none;}
#subjectA:active{color:black; text-decoration:none;}

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

<input type="hidden" id ="pg" value="${pg}"> <!--controller에서 넘겨주는 pg  -->
<table id="boardListTable" border ="1" width ="720" cellpadding = "3" frame="hsides" rules="rows">
   <tr>
    <th width ="65">글번호</th>
    <th width ="300" >제목</th>
    <th width ="100">작성자</th>
    <th width ="200">작성일</th>
    <th width ="65">조회수</th>
    </tr> 

</table>

<br>
<div id="boardPagingDiv" align="center" style="width: 720px;">
</div>



<form>
<input type="hidden" name="pg" value="1">
    <select id ="searchOption" name = "searchOption" style="width:100px; height:22px"> 
     <option value = "subject" selected>제목</option>
     <option value = "name" id="name">작성자</option>
     </select>
     <input type="text" name="keyword" id = "keyword" value="${keyword}"/>
     <input type="button" id="boardSearchBtn" value="검색"/>
     
</form>



<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="../js/boardList.js?var=1"></script>
<script>
window.onload=function(){
	 if("${searchOption}"=="subject"||"${searchOption}"=="name") 
	document.getElementById("searchOption").value="${searchOption}";
}
function isLogin(memId,seq,pg){
	if(memId ==''){
	      alert("로그인을 먼저 하세요");
	   }else{
		      location.href="/miniProject/board/boardView.do?seq="+seq+"&pg="+pg;
	   }	
	
}

function boardPaging(pg){
	var keyword = document.getElementById("keyword").value;
	if(keyword == ""){	
		location.href="boardList?pg="+pg;
	}else {
		$('input[name=pg]').val(pg);
		$('#boardSearchBtn').trigger('click','continue');
		
	}
}


</script>
