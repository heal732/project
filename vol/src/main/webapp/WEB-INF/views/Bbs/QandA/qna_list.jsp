<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../header.jsp"%>
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
#search_table{
border-collapse: separate;
	width:80%;
	height:60px;
	border-spacing: 10px 5px;
}

#search_table td{
	background: #ddffcc;
	padding-left: 10px;
}
.btn_vols{
  border:1px solid #34495e;
  text-align:center;
  box-sizing:border-box;
  margin:0 0 40px 0;
}

#btn_s_start{
  width:150px;
  height:40px;
  background-color: #94b8b8;
}

#sch_table_wrap{
	height:120px;
	margin-top: 5%;
}

#write_wrap{
	float:right;
}

#btn_write{
  width:100px;
  height:40px;
   background-color: #ffcccc;
}
a{
color:black;
}

tr{
	border-bottom: 1px solid black;
	height:50px;
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
</style>
<script type="text/javascript">
function read(id){
	 var str="detail.do";
	 str= str+"?bbs_id="+id;
	 location.href= str;
}


function wirte_go(){
	<%if(session.getAttribute("login_id")!=null && session.getAttribute("login_id")!="guest"){%>
	location.href="./write.do";	
	<%}else{%>
	alert("로그인 후 이용해주세요.");
	<%}%>
	
}

$(function(){
	$("#btn_s_start").click(function(){
		var isanswer_ing = '';
		var isanswer_com = '';
		var chbox=$('.isanswer:checked').each(function() { 
	        if($(this).val()==0){
	        	isanswer_ing="1";	
	        }else{
	        	isanswer_com="1";	
	        }
	   });
		
		if($(".isanswer:checked").length==2){
			alert("체크박스를 하나만 눌러주세요.");
			return false;
		}
		
		var str="./qna_list.do";
		 str+="?col="+$("#col").val();
		 str+="&word="+$("#search_txt").val();
		 str+="&nowPage=${nowPage}";
		 str+="&isanswer_ing="+isanswer_ing;
		 str+="&isanswer_com="+isanswer_com;
		 location.href=str;
	});
	
	var col="${col}";
	if(col=="title"){
		$('#title').attr("selected", "selected");
		$("#search_txt").val("${word}");
	}else if(col=="content_q"){
		$('#content_q').attr("selected", "selected");
		$("#search_txt").val("${word}");
	}
	
	var isanswer_ing="${isanswer_ing}";
	var isanswer_com="${isanswer_com}";
	if(isanswer_com==1){
		$("#com").attr('checked', true);
	}
	if(isanswer_ing==1){
		$("#ing").attr('checked', true);
	}
	
	fix_height_modify("table_div", "sch_table_wrap", "bbs_content_wrap");
})

function fix_height_modify(fname,lname,mname) {

	 if(document.getElementById(fname) && document.getElementById(lname)) {
	  var Fname = document.getElementById(fname);
	  var Lname = document.getElementById(lname);
	  var Mname = document.getElementById(mname);
	  
	  var total_height=Fname.offsetHeight+Lname.offsetHeight;
	  
	   Mname.style.height = (total_height+50) + "px";
	}
} 

</script>

<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="<%=request.getContextPath()%>/">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->Q&A
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
	<div align="center" id="sch_table_wrap">
	<table id="search_table">
		<tr>
			<td><div align="center">
				<select id="col" style="height:25px;">
					<option value="title" id="title">제목</option>
					<option value="content_q" id="content_q">내용</option>
				</select>
				<input id="search_txt" type="text" size="25">
				<input type="checkbox" class="isanswer" id="ing" value=0>답변 중
		<input type="checkbox" class="isanswer" id="com" value=1>답변 완료
				</div>
			</td>
		</tr>
	</table><br/>
	<button type="button" class="btn_vols" id="btn_s_start">검색</button>
	</div>
	<div id="table_div">
		<table id="table_" width="650" border="0" cellspacting="0" cellpadding="0" align="center">
		<tr>
			<th><div align="center">제목</div></th>
			<th width="90"><div align="center">날짜</div></th>
			<th width="53"><div align="center">조회</div></th>
		</tr>
	<c:set var="recNo" value="${recNo }"/>    
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }"/>
		<tr>
			<td>
			<c:set var="isanswer" value="${dto.isanswer }"/>
			<c:choose>
				<c:when test="${isanswer eq '1' }">[답변 없음]</c:when>
				<c:when test="${isanswer eq '2' }">[답변 완료]</c:when>
			</c:choose>
				&nbsp&nbsp<a href="javascript:read('${dto.id }')">${dto.title}</a>
			</td>
			<td><div align="center">${dto.date_Q }</div></td>
			<td><div align="center">${dto.hit }</div></td>
		</tr>
	</c:forEach>
	<tr class="end_tr">
		<td colspan="3"><div align="center">${paging }</div></td>
	</tr>
	<tr class="end_tr">
		<td  colspan="3">
			<div id="write_wrap">
				<button type="button" class="btn_vols" id="btn_write" onclick="wirte_go()"><span>글쓰기</span></button>
			</div>
		</td>
	</tr>
	</table>
	</div>
	</div>
</div>


<!-- body 끝  -->

<%@ include file="../../footer.jsp"%>