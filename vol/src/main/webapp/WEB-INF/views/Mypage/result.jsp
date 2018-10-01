<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<!-- body 시작  -->
<script>
$(function(){
	var window_height=window.innerHeight;
	$('#result-wrap').css({ height: window_height }); // 여러 스타일 동시 변경
})
</script>
${msg }<br/>
<input type="button" value="메인으로" onclick="go_main()"/>
<div id="result-wrap">

</div>

<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>