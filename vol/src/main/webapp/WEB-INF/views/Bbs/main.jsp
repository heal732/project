<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vols.css" />

<!-- body 시작  -->
<style>
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
.menu-wrap:hover{
background: #ffedcc;
}
.bott{
	border-bottom:1px solid #d9d9d9;
}
</style>
<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->알림판
</div>
<div id="bbs_content_wrap">
	<div id="bbs_content_left">
		<div id="bbs_c_l_wrap" class="center_do">
			<h1>고객센터</h1>
		      <div class="menu-wrap"><a href="<%=request.getContextPath() %>/Bbs/Notice/notice_list.do"><span id="font-menu">알림판</span></a></div><br/>
			<div class="menu-wrap bott"><a href="<%=request.getContextPath() %>/Bbs/Notice/qna_list.do"><span id="font-menu">Q&A</span></a></div><br/>
		</div>
	</div>
	<div id="bbs_content_right">
		
	</div>
</div>


<!-- body 끝  -->

<%@ include file="../footer.jsp"%>