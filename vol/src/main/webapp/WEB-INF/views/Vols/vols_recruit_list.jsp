<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<%String grade = (String)session.getAttribute("grade"); %>
  <!-- 데이트 피커 용 -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-ui.js"></script>
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
a{
color:black;
}
tr{
	border-bottom: 1px solid black;
	height:50px;
}

.end_tr{
	border-bottom: none;
}

#recruit_img{
	width:100%;
	height:250px;
}

#img_wrap{
	margin:15%;
	margin-top:20px;
	margin-bottom: 20px;
}
</style>
<script type="text/javascript">
	
function read(id){
	 var str="recruit_detail.do";
	 str= str+"?bbs_id="+id;
	 location.href= str;
}
$(function(){
	fix_height_modify("img_wrap", "table_div", "bbs_content_wrap");
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
	<span class="glyphicon glyphicon-home"><a href="<%=request.getContextPath()%>/">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->봉사인원모집
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
		<div id="img_wrap">
			<img src="<%=request.getContextPath()%>/resources/upload/img_happy.jpg" id="recruit_img" />
		</div>
		<div id="table_div">
		<table width="700" border="0" cellspacting="0" cellpadding="0" align="center">
		<tr>
			<th ><div align="center">제목</div></th>
			<th width="100"><div align="center">작성날짜</div></th>
			<th width="90"><div align="center">작성자</div></th>
		</tr>
	<c:set var="recNo" value="${recNo }"/>    
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }"/>
		<tr>
			<td>
				<a href="javascript:read('${dto.id }')">${dto.title}</a>
			</td>
			<td><div align="center">${dto.write_date }</div></td>
			<td><div align="center">${dto.writer }</div></td>
		</tr>
	</c:forEach>
	<tr class="end_tr">
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
	</table>
	</div>
	</div>
</div>

<!-- body 끝  -->

<%@ include file="../footer.jsp"%>