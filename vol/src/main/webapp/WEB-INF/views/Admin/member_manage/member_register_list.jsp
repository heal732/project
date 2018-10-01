<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../adminheader.jsp"%>
<!-- body 시작 -->
<script>
	
	$(function(){
		 for(var i = 1 ; i<${recNo} ;i++ ){
		 	var reason=$("#hid_reason_"+i).val();
		 	if(reason.length>9){
		 		reason=reason.substring(0, 9)+"...";
		 	}
			$("#reason_"+i).html(reason); 
		} 
	});
	
	function read(id){
		location.href="./register_detail.do?id="+id;
	}
</script>

<table width="650" border="1" cellspacting="0" cellpadding="0" align="center">
		<caption>회원 등급 변경 신청</caption>
		<tr>
			<th><div align="center">수</div></th>
			<th><div align="center">아이디</div></th>
			<th><div align="center">이름</div></th>
			<th><div align="center">신청 이유</div></th>
		</tr>
		<tr>	
			 <c:set var="recNo" value="${recNo }" />
			 <input type="hidden" id="recNo" value="${recNo}"/>
			<c:forEach var="dto" items="${list }">
				<c:set var="recNo" value="${recNo-1 }" />
				<tr>
					<td><div align="center">${recNo }</div></td>
					<td><div align="center"><a href="javascript:read('${dto.mem_id }')"><input type="hidden" id="m_id" name="m_id" value="${dto.mem_id}">${dto.mem_id }</a>
					</div></td>
					<td><div align="center">${dto.name }</div></td>
					<td>
					<input type="hidden" id='hid_reason_${recNo }' value='${dto.reason }'/>
					<div align="center" id="reason_${recNo }"></div>
					</td>
				</tr>
			</c:forEach> 
		<tr>
			<td colspan="6"><div align="center">${paging }</div></td>
		</tr>
	</table>


<!-- body 끝 -->

<%@ include file="../adminfooter.jsp"%>