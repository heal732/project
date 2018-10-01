<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../adminheader.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">

<script language="javascript">
function listGo(){
	var str = "notice_list.do";
	str = str + "?nowPage=${param.nowPage}";
	str = str + "&col=${param.col}";
	str = str + "&word=${param.word}";
	//alert(str);
	location.href= str;
}

function updateGo(){
	var str="update.do";
	str =  str+ "?bbs_id=${dto.id}";
	str= str + "&nowPage=${param.nowPage}";
	str = str+ "&col=${param.col}";
	str = str+ "&word=${param.word}";
	//alert(str);
	location.href=str;
}

function deleteGo(){
	var bbs_id=$("#bbs_id").val();
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			type:"post",
			data:{bbs_id : bbs_id},
			url:"delete.do",
			dataType:"json",
			success:function(data){
				if(data==1){
					alert("삭제 되셨습니다.");
					location.href="notice_list.do";
				}else{
					alert("삭제되지 않았습니다.");
				}
			}
		});
	}
}

</script>
<style>
.div_center{
	float:right;
	width:70%;
}
</style>
<div class="div_center">
<table width="600" border="1" cellpadding="0" cellspacing="0">
	<caption>글 상세 보기</caption>
	<tr>
		<th width="98">글번호</th>
		<th width="200">${dto.id }<input type="hidden" value="${dto.id }" id="bbs_id" name="bbs_id"/></th>
		<th width="102">글쓴이</th>
		<th width="200">${dto.writer }</th>
	</tr>
	<tr>
		<th>조회수</th>
		<th>${dto.views }</th>
		<th></th>
		<th></th>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${dto.title }</td>
	</tr>
	<tr>
		<td colspan="4"><div id="text_content">${dto.content }</div></td>
	</tr>
	<tr>
		<td colspan="4">
			<div align="center">
				<input type="button" name="submit1" value="수정" onclick="updateGo()">
				<input type="button" name="submit2" value="삭제" onclick="deleteGo()">
				<input type="button" name="submit3" value="목록" onclick="listGo()">
			</div></td>
		</tr>
</table>
<br/>
<br/>
</div>
<%@ include file="../adminfooter.jsp"%>