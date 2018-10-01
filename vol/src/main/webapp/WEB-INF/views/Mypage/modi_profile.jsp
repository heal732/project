<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<!-- body 시작  -->

<script>
$(function(){
	$("#pro_submit").click(function(){
		var name = $("#name").val();
		if(name==null || name==""){
			alert("이름을 입력해주세요.");
			return;
		}
		
		var email = $("#email").val();
		var r=email.includes("@");
		if(!r){
			alert("이메일 형식을 맞춰 주세요.");
			return;
		}
		
		var phone= $("#phone").val();
		r=phone.includes("-");
		if(r){
			alert("-를 빼주세요.");
			return;
		}
		
		$.ajax({
			url:"modi_profile_ok.do",
			data:{name: name, email: email, phone: phone},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.result==1){
					location.href="./main.do";
				}else{
					alert("변경 되지 않았습니다.");
				}
			}
		});
	});
	
	$("#m_p_cancle").click(function(){
		history.back();
	})
})
</script>
<div style="height:400px;" align="center">
	<div style="margin-top:200px">
	<span>이름:    </span><input type="text" name="name" id="name" value="${member.mem_name}"/><br/>
	<span>이메일:   </span><input type="text" id="email" name="email" value="${member.mem_email}"/><br/>
	<span>전화번호: </span><input type="text" id="phone" name="phone" value="${member.mem_phone}"/><br/>
	<br/><br/>
	<button type="button" id="pro_submit"><span>확인</span></button>
	<button type="button" id="m_p_cancle"><span>취소</span></button>
	</div>
</div>
<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>