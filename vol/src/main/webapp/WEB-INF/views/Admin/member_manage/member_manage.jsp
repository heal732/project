<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<!-- body 시작 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script type="text/javascript">
	function read(m_id) {
		var str = "read.do";
		str = str + "?m_id=" + m_id;
		str = str + "&nowPage=${nowPage}";
		str = str + "&col=${col}";
		str = str + "&word=${word}";
		//alert(str);
		location.href = str;
	}

	function searchCheck(f) {
		if (f.word.value == "") {
			alert("검색어를 입력하세요");
			f.word.focus();
			return;
		}
		f.submit();
	}
</script>

<form name="frm" action="./member_manage.do">
	<table width="650" border="1" cellspacting="0" cellpadding="0" align="center">
		<caption>회원 관리</caption>
		<tr>
			<th><div align="center">수</div></th>
			<th><div align="center">아이디</div></th>
			<th><div align="center">이름</div></th>
			<th><div align="center">가입일</div></th>
			<th><div align="center">등급</div></th>
		</tr>
		<tr>
			 <c:set var="recNo" value="${recNo }" />
			<c:forEach var="dto" items="${list }">
				<c:set var="recNo" value="${recNo-1 }" />
				<tr>
					<td><div align="center">${recNo }</div></td>
					<td><div align="center"><a href="javascript:read('${dto.mem_id }')"><input type="hidden" id="m_id" name="m_id" value="${dto.mem_id}">${dto.mem_id }</a>
					</div></td>
					<td><div align="center">${dto.mem_name }</div></td>
					<td><div align="center">${dto.mem_joindate }</div></td>
					<td><div align="center">${dto.mem_grade }</div></td>
				</tr>
			</c:forEach> 
		<tr>
			<td colspan="6"><div align="center">${paging }</div></td>
		</tr>
	</table>

</form>
<p>
<p>
<form name="form1" method="post" action="./member_manage.do">
	<div align="center">
		<select name="col" id="col">
			<option value="mem_name">이름</option>
			<option value="mem_id">아이디</option>
			<option value="mem_grade">등급</option>
		</select> <input name="word" type="text" size="25"> <input
			type="button" name="button" value="검색"
			onclick="searchCheck(this.form)">
	</div>

</form>

<!-- body 끝 -->

<%@ include file="../adminfooter.jsp"%>