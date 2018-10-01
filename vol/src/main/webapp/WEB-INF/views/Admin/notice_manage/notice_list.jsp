<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../adminheader.jsp"%>
<!-- body 시작 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script type="text/javascript">
function read(bbs_id){
	 var str="detail.do";
	 str= str+"?bbs_id="+bbs_id;
	 str= str+"&nowPage=${nowPage}";
	 str= str+"&col=${col}";
	 str= str+"&word=${word}";
	 //alert(str);
	 location.href= str;
}

function searchCheck(f){
	if(f.word.value == ""){
		alert("검색어를 입력하세요");
		f.word.focus();
		return;
	}
	f.submit();
}
</script>
<style>
#notice_table{
text-align:center
}
</style>
<table id="notice_table" width="650" border="1" cellspacting="0" cellpadding="0" align="center" >
		<caption>공지 목록</caption>
		<tr>
			<td colspan="6"><a href="create.do">[글쓰기]</a></td>
		</tr>
		<tr>
			<th width="65"><div align="center">글번호</div></th>
			<th><div align="center">제목</div></th>
			<th width="100"><div align="center">이름</div></th>
			<th width="90"><div align="center">날짜</div></th>
			<th width="53"><div align="center">조회</div></th>
		</tr>
	<c:set var="recNo" value="${recNo }"/>    
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }"/>
		<tr>
			<td>${recNo }</td>
			<td>
				<a href="javascript:read('${dto.id }')">${dto.title }</a>
			</td>
			<td>${dto.writer }</td>
			<td>${dto.write_date }</td>
			<td>${dto.views }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
	</table>
<p><p>
<form name="form1" method="post" action="./notice_list.do">
	<div align="center">
		<select name="col">
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
		<input name="word" type="text" size="25">
		<input type="button" name="button" value="검색" onclick="searchCheck(this.form)">
	</div>
	</form>
<!-- body 끝 -->

<%@ include file="../adminfooter.jsp"%>