<%@page import="kr.co.vol.dto.QnA"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../adminheader.jsp"%>
<% QnA dto=(QnA)request.getAttribute("dto"); %>
<script language="javascript">
function updateGo(){
	var str="update.do";
	str =  str+ "?bbs_id=${dto.id}";
	location.href=str;
}

$(function(){
	$("#btn_del").click(function(){
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
	});

	$("#btn_answer").click(function(){
		$.ajax({
			type:"post",
			url:"./write.do",
			dataType:"html",
			success:function(data){
				$("#answer_wrap").html(data);
			}
		});
	});
	
	$("#btn_modi").click(function(){
		var id = $("#bbs_id").val();
		$.ajax({
			type:"post",
			url:"./write.do",
			data:{id : id},
			dataType:"html",
			success:function(data){
				$("#answer_wrap").html(data);
			}
		});
	});
	<%if(dto.getIsanswer().equals("2")){%>
	fix_height_modi("div_center","left_field");
	<%}%>
})

 function fix_height_modi(fname,lname) {
			
	if(document.getElementById(fname) && document.getElementById(lname)) {
		var Fname = document.getElementById(fname);
		var Lname = document.getElementById(lname);
		if(Fname.offsetHeight>Lname.offsetHeight){
		 Lname.style.height = (Fname.offsetHeight+50) + "px";
		}
	}
} 
</script>
<style>
.div_center{
	float:right;
	width:70%;
}
#writer{
	float:right;
}
#title2{
	float:left;
}
tr{
	border-bottom: 1px solid black;
	height:50px;
}
#answer_wrap{
	width:70%;
	height:600px;
	margin-top:50px;
	
}
.div_left{
	float:left;
}
.text_content{
	overflow: auto;
	width:800px;
	height:600px;
}
#content_a{
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.end_tr{
	border-bottom:none;
}
</style>

<div class="div_center" id="div_center">
<input type="hidden" id="bbs_id" value="${dto.id }"/>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td><div id="title2" class="title">${dto.title }</div><div id="writer" class="title">작성자:${dto.writer }</div></td>
	</tr>
	<tr>
		<td><div id="text_content"><br/><br/>${dto.content_Q }</div></td>
	</tr>
	<tr class="end_tr">
		<td><%if(dto.getIsanswer().equals("1")){%> <button type="button" id="btn_answer">답변하기</button><%}else{%><button type="button" id="btn_modi">답변 수정하기</button> <%} %>&nbsp&nbsp<button type="button" id="btn_del">삭제</button></td>
	</tr>
</table>
	<div id="answer_wrap">
	<%if(dto.getIsanswer().equals("2")){%>
		<div class="div_left" id="div_left">
			<div>
				<div>
					<span>답변</span>
					<div class="text_content" id="content_a" ><br/><br/>${dto.content_A }</div>
				</div>
			</div> 
		</div>
		<%} %>
	</div>
</div>
	
<%@ include file="../adminfooter.jsp"%>