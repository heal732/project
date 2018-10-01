<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<!-- body 시작  -->
<script>
$(function(){
	$("#check_go").click(function(){
		if($("#pw").val()==null || $("#pw").val()==""){
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
		}else{
			var pw=$("#pw").val();
			$.ajax({
				type:"post",
				data:{pw : pw},
				dataType:"json",
				url:"./modi_chk_pw_ok.do",
				success:function(data){
					if(data.result==1){
						location.href="./modi_pw.do";
					}else{
						$("#error").html("비밀번호가 잘못 되었습니다.");
					}
				}
			});
		}
	});
})
</script>

<div align="center" style="height:400px;">
<div>
<div style="margin-top:200px;">
<span>비밀번호 확인</span><br/>
</div>

<input type="password" name="pw" id="pw"/>
<button type="button" id="check_go"><span>확인</span></button><br/>
<span id="error"></span>
</div>
</div>



<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>