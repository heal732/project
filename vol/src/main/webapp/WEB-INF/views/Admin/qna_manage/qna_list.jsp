<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../adminheader.jsp"%>
<!-- body 시작 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script type="text/javascript">
function read(bbs_id){
	 var str="detail.do";
	 str= str+"?bbs_id="+bbs_id;
	 location.href= str;
}

$(function(){
	$("#btn_s_start").click(function(){
		var isanswer_ing = '';
		var isanswer_com = '';
		var chbox=$('.isanswer:checked').each(function() { 
	        if($(this).val()==0){
	        	isanswer_ing="1";	
	        }else{
	        	isanswer_com="1";	
	        }
	   });
		
		if($(".isanswer:checked").length==2){
			alert("체크박스를 하나만 눌러주세요.");
			return false;
		}
		var str="./qna_list.do";
		 str+="?col="+$("#col").val();
		 str+="&word="+$("#search_txt").val();
		 str+="&nowPage=${nowPage}";
		 str+="&isanswer_ing="+isanswer_ing;
		 str+="&isanswer_com="+isanswer_com;
		 location.href=str;
	});
	
	var col="${col}";
	if(col=="title"){
		$('#title').attr("selected", "selected");
		$("#search_txt").val("${word}");
	}else if(col=="content"){
		$('#content').attr("selected", "selected");
		$("#search_txt").val("${word}");
	}
	
	var isanswer_ing="${isanswer_ing}";
	var isanswer_com="${isanswer_com}";
	if(isanswer_com==1){
		$("#com").attr('checked', true);
	}
	if(isanswer_ing==1){
		$("#ing").attr('checked', true);
	}
})
</script>
<style>
#notice_table{
text-align:center
}
</style>
<table id="notice_table" width="650" border="1" cellspacting="0" cellpadding="0" align="center" >
		<caption>질문 목록</caption>
		<tr>
			<th width="65"><div align="center">답변 여부</div></th>
			<th><div align="center">제목</div></th>
			<th width="100"><div align="center">이름</div></th>
			<th width="90"><div align="center">날짜</div></th>
			<th width="53"><div align="center">조회</div></th>
		</tr>
	<c:set var="recNo" value="${recNo }"/>    
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }"/>
		<tr>
			<c:choose>
				<c:when test="${dto.isanswer eq '1'}">
					<td>답변 중</td>
				</c:when>
				<c:when test="${dto.isanswer eq '2'}">
					<td>답변 완료</td>
				</c:when>
			</c:choose>
			
			<td>
				<a href="javascript:read('${dto.id }')">${dto.title }</a>
			</td>
			<td>${dto.writer }</td>
			<td>${dto.date_Q }</td>
			<td>${dto.hit }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
	</table>
<p><p>
	<div align="center">
		<select id="col">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input id="search_txt" type="text" size="25">
		
		<input type="checkbox" class="isanswer" id="ing" value=0>답변 중
		<input type="checkbox" class="isanswer" id="com" value=1>답변 완료<br/>
		<button type="button" id="btn_s_start">검색</button>
	</div>
<!-- body 끝 -->

<%@ include file="../adminfooter.jsp"%>