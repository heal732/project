<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<script>
$(function(){
	$("#register_go").click(function(){
		var name=$("#regi_name").val();
		var num=$("regi_num").val();
		var addr=$("regi_addr").val();
		var reason=$("regi_reason").val();
	});
	
	$("#regi_addr").click(function(){
		var width = "500px";
		var height = "800px";
		daum.postcode.load(function(){
			new daum.Postcode({
				oncomplete: function(data){
					$("#regi_addr").val(data.address);
					$("#postcd").html(data.zonecode);
					$("#addr").focus();
				}
			}).open({
				left:(window.screen.width /2 ) -(width /2),
				top:(window.screen.height / 2) - (height /2)
			});
		});
	});
	
	$("#register_go").click(function(){
		var name= $("#regi_name").val();
		var num=  $("#regi_num").val();
		var addr= $("#regi_addr").val()+" "+$("#addr").val();
		var reason=$("#regi_reason").val();
		if(name==null || name=="" || num==null || num=="" || addr==null || addr=="" || reason==null || reason==""){
			alert("모든 정보를 입력하시기 바랍니다.");
			return;
		}
		$.ajax({
			url:"./register_go",
			type:"post",
			data:{name:name, num:num, addr:addr, reason:reason},
			dataType:"json",
			success:function(data){
				if(data.result==1){
					location.href="./result";
				}else if(data.result==2){
					alert("이미 신청한 글이 있습니다.");
				}else{
					alert("신청되지 않았습니다.");
				}
			},
			error:function(){
				alert("에러 에러");
			}
		});
	});
})
</script>
<style>
.postcd{
	width:50px;
}

#postdash{
	font-size: 10px;
}

</style>
<!-- body 시작  -->
<div align="center" style="margin-top:50px;">
<table width="500">
	<tr>
		<td><div style="height:30px;"><span>이름: </span><input type="text" id="regi_name" /></div></td>
		<td><div style="height:30px;"><span>번호: </span><input type="text" id="regi_num" /></div></td>
	</tr>
	<tr>
		<td><div style="height:30px;"><span>주소: </span><input type="text" id="regi_addr" /></div></td>
		<td><div style="height:30px;"><span>우편번호 : </span><span id="postcd"></span></div></td>
	</tr>
	<tr>
		<td colspan="2"><div style="height:30px;"><input type="text" placeholder="나머지 주소" id="addr" style="width:500px;"/></div></td>
	</tr>
</table>
<br/>
<table width="500">
	<tr>
		<td><span>신청이유: </span></td>
	</tr>
</table>

<textarea style="width:500px; height:400px; resize:none" id="regi_reason" ></textarea><br/>
<button type="button" id="register_go"><span>신청하기</span></button>
</div>
<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>