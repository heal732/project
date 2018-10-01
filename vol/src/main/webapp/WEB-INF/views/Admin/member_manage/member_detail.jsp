<%@page import="kr.co.vol.dto.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Member dto=(Member)request.getAttribute("dto"); %>
<!-- body 시작 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script>
function listGo(){
	history.go(-1);
}
</script>
<style>
.div-center{
	margin:0px auto;
}
</style>
<div class="div-center" align="center">
<table width="600" border="1" cellpadding="0" cellspacing="0">
	<caption>회원 상세보기</caption>
	<tr>
		<th width="100">아이디</th>
		<th width="200">${dto.mem_id }</th>
		<th width="100">이름</th>
		<th width="200">${dto.mem_name }</th>
	</tr>
	<tr>
		<th width="100"> 이메일</th>
		<th width="200">${dto.mem_email }</th>
		<th width="100">성별</th>
		<th width="200"><%if(dto.getMem_gender().equals("0")){%>남<%}else{%>여<%} %></th>
	</tr>
	<tr>
		<th width="100">생일</th>
		<th width="200">${dto.mem_birth }</th>
		<th width="100">전화번호</th>
		<th width="200">${dto.mem_phone }</th>
	</tr>
	<tr>
		<th width="100">등급</th>
		<th width="200">${dto.mem_grade }</th>
		<th width="100">가입일</th>
		<th width="200">${dto.mem_joindate }</th>
	</tr>
	<tr>
		<td colspan="4">
			<div align="center">
				<input type="button" name="submit5" value="목록" onclick="listGo()">
			</div></td>
		</tr>
</table>
<br/>
<br/>
</div>
<!-- body 끝 -->

<%@ include file="../adminfooter.jsp"%>