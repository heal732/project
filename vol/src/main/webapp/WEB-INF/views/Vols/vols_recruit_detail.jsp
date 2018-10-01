<%@page import="kr.co.vol.dto.Bbs"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../header.jsp"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String grade = (String)session.getAttribute("grade"); 
  String id = (String)session.getAttribute("login_id");
  Bbs dto = (Bbs)request.getAttribute("dto");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vols.css" />
<script language="javascript">

$(function(){
	var window_height=window.innerHeight;
	$('#detail-wrap').css({ height: window_height , margin:'0px auto',width:'800px'}); // 여러 스타일 동시 변경
	
	$("#re_update_go").click(function(){
		var bbs_id=$("#bbs_id").val();
		location.href="./update.do?bbs_id="+bbs_id;
	});
	
	$("#re_del_go").click(function(){
		if(confirm("삭제하시겠습니까?")){
			var bbs_id=$("#bbs_id").val();
			$.ajax({
				url:"./del.do",
				data:{bbs_id:bbs_id},
				dataType:"json",
				success:function(data){
					location.href="./vols_recruit_list.do";
				}
			})
		}
	});
	
	var bbs_content_wrap=document.getElementById('bbs_content_wrap' ) ; 
	var table=document.getElementById('t_table' ) ;  
	if(table.offsetHeight+50>bbs_content_wrap.offsetHeight){
		bbs_content_wrap.style.height=table.offsetHeight+50+"px";
	}
	
})

function addComment(){
	var form = document.getElementById("form_addComment");
	form.submit();
}
function deleteComment(){
	var form = document.getElementById("form_deleteComment");
	form.submit();
}
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

#writer{
	float:right;
}
#title{
	float:left;
}

tr{
	border-bottom: 1px solid black;
}
.end_tr{
	border-bottom:none;
}

#text_content{
	min-height:500px;
}
.title{
	margin-bottom: 5px;
}

#comment_inputtext{

	width:800px;
}
.comment_id{
	width:100px;
}
.comment_content{
	width:600px;
}
.comment_date{
	width:100px;
}

</style>
<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->봉사인원모집
</div>
<div id="bbs_content_wrap">
	<div id="bbs_content_left">
		<div id="bbs_c_l_wrap" class="center_do">
			<h1>봉사정보</h1>
			<div class="menu-wrap"><a href="./vols_list.do"><span id="font-menu">봉사 목록</span></a></div><br/>
			<div class="menu-wrap bott" style="background: #ffedcc;"><a href="./vols_recruit_list.do"><span id="font-menu">봉사 인원 모집</span></a></div><br/>
		       <%if(grade!=null){if(grade.equals("B")){%>
		    	   <div class="bott"><a href="./recruit_write.do"><span id="font-menu">구인 공고</span></a></div><br/>
		       <%}} %> 
		</div>
	</div>
	<div id="bbs_content_right">
	<input type="hidden" value="${dto.id }" id="bbs_id" name="bbs_id"/>
	<table width="800" border="0" cellpadding="0" cellspacing="0" id="t_table">
	<tr>
		<td colspan="3"><div id="title" class="title">${dto.title }</div><div id="writer" class="title">작성자:${dto.writer }</div></td>
	</tr>
	<tr>
		<td colspan="4"><div id="text_content"><br/>${dto.content }</div></td>
	</tr>
	<tr class="end_tr">
		<% if(id!=null){ if (id.equals(dto.getWriter())){ %>
		<td colspan="4" >
			<div align="center">
				<button type="button" id="re_update_go">수정</button>
				<button type="button" id="re_del_go">삭제</button>
			</div>
		</td>
		<%}} %>
	</tr>
	<c:set var="recNo" value="${recNo}"/>   
		<c:forEach var="dto" items="${list}">
		<c:set var="recNo" value="${recNo-1 }"/>
		<tr>
			<td class="comment_id">${dto.writer}</td>
			<td class="comment_content">${dto.content}</td>
			<td class="comment_date">${dto.write_date }</td>
			<td><form id="form_deleteComment" action="deleteComment_ok.do" method="post">
					<input type="button" value="삭제" onclick="deleteComment();"/>
					<input type="hidden" name="party_id" value="<%=request.getAttribute("bbs_id")%>"/>
					<input type="hidden" name="id" value="${dto.id}"/>
				</form></td>
		</tr>
		</c:forEach>
		<tr class="end_tr">
			<td colspan="6"><div align="center">${paging}</div></td>
		</tr>
		<tr class="inputComment">
			<form id="form_addComment" action="addComment_ok.do" method = "post">
			<td colspan="3"><input type="text" id="comment_inputtext" name="comment_inputtext"/></td>
			<td><input type="button" value="작성" onclick="addComment();"/>
			<input type="hidden" name="party_id" value="<%=request.getAttribute("bbs_id")%>"/></td>
			</form>
		</tr>
	</table>
	</div>
</div>
<%@ include file="../footer.jsp"%>