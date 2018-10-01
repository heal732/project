<%@page import="kr.co.vol.dto.QnA"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp"%>
<% QnA dto=(QnA)request.getAttribute("dto"); %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vols.css" />
<style>
#text_content{
	overflow: auto;
	width:800px;
	height:600px;
}
#notice_wrap{
	width:1000px;
	margin:0px auto;
}
tr{
	border-bottom: 1px solid black;
	height:50px;
}
#writer{
	float:right;
}
#title{
	float:left;
}
.title{
	margin-bottom: 5px;
}

#font-menu{
	color: black;
	font-size:20px;
	width:50%;
}
.menu-wrap{
	width:100%;
	border-top:1px solid #d9d9d9;
	float:left;
}
a{
color:black;
}
.menu-wrap:hover{
background: #ffedcc;
}
.bott{
	border-bottom:1px solid #d9d9d9;
}
#answer_wrap{
	width:70%;
	height:600px;
	margin-top:50px;
	
}
#content_a{
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}
.text_content{
	overflow: auto;
	width:800px;
	height:600px;
}
</style>
<script>
$(function(){
	<%if(dto.getIsanswer().equals("2")){%>
	fix_height_modi("table_div","bbs_content_wrap");
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
<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->Q&A
</div>
<div id="bbs_content_wrap">
	<div id="bbs_content_left">
		<div id="bbs_c_l_wrap" class="center_do">
			<h1>고객센터</h1>
			<div class="menu-wrap"><a href="<%=request.getContextPath() %>/Bbs/Notice/notice_list.do"><span id="font-menu">알림판</span></a></div><br/>
			<div class="menu-wrap bott" style="background: #ffedcc;"><a href="<%=request.getContextPath() %>/Bbs/QandA/qna_list.do"><span id="font-menu">Q&A</span></a></div><br/>
		</div>
	</div>
	<div id="bbs_content_right">
	<div id="table_div">
		<table width="800" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3"><div id="title" class="title">${dto.title }</div><div id="writer" class="title">작성자:${dto.writer }</div></td>
	</tr>
	<tr>
		<td colspan="4"><div id="text_content"><br/><br/>${dto.content_Q }</div></td>
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
	</div>
</div>
<%@ include file="../../footer.jsp"%>