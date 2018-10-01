<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- body 시작 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script>
function listGo(){
	history.go(-1);
}

function gradeChange(){
	var id='${dto.mem_id }';
	if(confirm("승인 하시겠습니까?")){
		$.ajax({
			type:"post",
			url:"./grade_chagne",
			data:{id : id},
			dataType:"json",
			success:function(data){
				if(data.result==1){
					location.href="./member_regist.do";
				}
			},
			error:function(){
				alert("에러 에러");
			}
		});
	}
}

function unregist(){
	var id='${dto.mem_id }';
	if(confirm("불허 하시겠습니까?")){
		$.ajax({
			type:"post",
			url:"./delete_regist",
			data:{id : id},
			dataType:"json",
			success:function(data){
				if(data.result==1){
					location.href="./member_regist.do";
				}
			},
			error:function(){
				alert("에러 에러");
			}
		});
	}
}
</script>
<style>
.div-center{
	margin:0px auto;
}
</style>
<div class="div-center">
<table width="600" border="1" cellpadding="0" cellspacing="0">
	<caption>신청 상세보기</caption>
	<tr>
		<th width="100">아이디</th>
		<th width="200">${dto.mem_id }</th>
		<th width="100">이름</th>
		<th width="200">${dto.name }</th>
	</tr>
	<tr>
		<th width="100">전화번호</th>
		<th width="200" colspan="3">${dto.phone }</th>
	</tr>
	<tr>
		<td colspan="4">
			<textarea rows="22" cols="100" style="resize: none;">${dto.reason }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<div align="center">
				<button type="button" onclick="listGo()"><span>목록</span></button>
				<button type="button" onclick="gradeChange()"><span>승인</span></button>
				<button type="button" onclick="unregist()"><span>취소</span></button>
			</div>
		</td>
	</tr>
</table>
<br/>
<br/>
</div>
<!-- body 끝 -->

<%@ include file="../adminfooter.jsp"%>