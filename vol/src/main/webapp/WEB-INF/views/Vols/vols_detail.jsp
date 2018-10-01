<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../header.jsp"%>
<%String grade = (String)session.getAttribute("grade"); %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vols.css" />
<script language="javascript">
$(function(){
	var window_height=window.innerHeight;
	$('#detail-wrap').css({ height: window_height , margin:'0px auto',width:'800px'}); // 여러 스타일 동시 변경
})
</script>
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

#bbs_content_right{
	padding-top: 50px;
}

#search_table{
border-collapse: separate;
	width:80%;
	height:150px;
	border-spacing: 10px 5px;
}

#search_table td{
	background: #ddffcc;
	padding-left: 10px;
}
.btn_vols{
  border:1px solid #34495e;
  text-align:center;
  position:relative;
  box-sizing:border-box;
  margin:0 0 40px 0;
}

#btn_s_start{
  width:150px;
  height:40px;
  background-color: #94b8b8;
}

#btn_s_clear{
  width:200px;
  height:40px;
  background-color: white;
}
#sch_table_wrap{
	height:200px;
}
tr{
	border-bottom: 1px solid black;
}
#text_content{
	min-height:500px;
}

.title{
	margin-bottom: 5px;
}
</style>
<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->봉사목록
</div>
<div id="bbs_content_wrap">
	<div id="bbs_content_left">
		<div id="bbs_c_l_wrap" class="center_do">
			<h1>봉사정보</h1>
			<div class="menu-wrap" style="background: #ffedcc;"><a href="./vols_list.do"><span id="font-menu">봉사 목록</span></a></div><br/>
			<div class="menu-wrap bott" ><a href="./vols_recruit_list.do"><span id="font-menu">봉사 인원 모집</span></a></div><br/>
		       <%if(grade!=null){if(grade.equals("B")){%>
		    	   <div class="bott"><a href="./recruit_write.do"><span id="font-menu">구인 공고</span></a></div><br/>
		       <%}} %> 
		</div>
	</div>
	<div id="bbs_content_right">
		<table width="800" border="0" cellpadding="0" cellspacing="0">
	
	<tr>
		<td colspan="3"><div id="title" class="title">${dto.progrmSj }</div></td>
	</tr>
	<tr>
		<td colspan="4"><div id="text_content"><br/> ${dto.progrmCn }</div></td>
	</tr>
</table>
	</div>
</div>
<%@ include file="../footer.jsp"%>