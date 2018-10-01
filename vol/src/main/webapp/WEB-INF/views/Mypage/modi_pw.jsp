<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<!-- body 시작  -->
<script>
$(function(){
	$("#modi_cancle").click(function(){
		$(".modi_pw").val("");
	});
	
	$("#modi_submit").click(function(){
		if($("#pre_pw").val()==null || $("#pre_pw").val()==""){
			alert("비밀번호를 입력하세요.");
			$("#pre_pw").focus();
			return;
		}else if($("#new_pw").val()==null || $("#new_pw").val()==""){
			alert("새 비밀번호를 입력하세요.");
			$("#new_pw").focus();
			return;
		}else if($("#new2_pw").val()==null || $("#new2_pw").val()==""){
			alert("새 비밀번호를 입력하세요.");
			$("#new2_pw").focus();
			return;
		}
		
		var pre_pw = $("#pre_pw").val();
		var new_pw = $("#new_pw").val();
		var new2_pw = $("#new2_pw").val();
		
		if(new_pw!=new2_pw){
			alert("새 비밀번호를 확인하세요.");
			$("#new2_pw").focus();
			return;
		}
		
		
		if(check_str(new_pw) && new_pw.length>=6){
			$.ajax({
				url:"modi_pw_ok.do",
				type:"post",
				data:{new_pw : new_pw , pre_pw: pre_pw},
				dataType:"json",
				success:function(data){
					if(data.result==1){
						location.href="./main.do";
					}else if(data.result==2){
						alert("현재 비밀번호가 다릅니다.");
					}else if(data.result==0){
						alert("변경되지 않았습니다.");
					}
				}
			});
		}else{
			alert("영문,숫자 ,특수문자 조합으로 6자 이상으로 해주세요.");
		}
	})
})

function check_str(str) {
	 res1 = (/[a-z]/i).test(str); //영문이 있는지
	 res2 = (/[0-9]/).test(str); //숫자가 있는지
	 res3 = (/[!@#$%^&+-]/).test(str); //특수문자가 포함인지
	 
	 return res1 && res2 && res3;
}

</script>

<div align="center" style="height:400px;">
	<div style="margin-top:200px">
	<input type="password" class="modi_pw" id="pre_pw" placeholder="현재 비밀번호"/><br/>
	<input type="password" class="modi_pw" id="new_pw" placeholder="새 비밀번호"/><br/>
	<input type="password" class="modi_pw" id="new2_pw" placeholder="새 비밀번호 확인"/>
	<br/><br/>
	<button type="button" id="modi_submit"><span>확인</span></button>
	<button type="button" id="modi_cancle"><span>취소</span></button>
	</div>
</div>
<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>