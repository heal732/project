<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인_iframe</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(function(){
	 for(var i =${recNo}-1 ; i>${recNo}-6;i-- ){
	 	var title=$("#hid_recNo_"+i).val();
	 	if(title.length>20){
	 		title=title.substring(0, 20)+"...";
	 	}
	 
		$("#recNo_"+i).html(title); 
	} 
	 
	 $(".btn_plus").click(function(){
		window.parent.fn(4);
	 });
});
function read(id){
	window.parent.read(4,id);
}
</script>
<style>
#iframe_line{
	margin-left:10%;
	width:80%;
	height:1px;
	background-color: black;
}

#iframe_title{
	font-size: 30px;
}
#iframe_header{
	width:100%;
	height:50px;
}
#iframe_left{
	margin-left:10%;
	float:left;
}

#iframe_rigth{
	margin-right:10%;
	float:right;
}

#con_wrap{
	width:80%;
	margin-left:10%;
}

a{
	text-decoration: none;
	color:black;
}

#one_wrap{
	margin-top: 8px;
}
.btn_plus{
	width:30px;
	height:30px;
	margin-top:5px;
}
</style>
<body>
<div id="iframe_header">
<div id="iframe_left">
<span id="iframe_title">
	<c:choose>
		<c:when test="${type eq 'N'}">
			알림판
		</c:when>
		<c:when test="${type eq 'R'}">
			모집공고
		</c:when>
		<c:when test="${type eq 'Q'}">
			질문/답변
		</c:when>
	</c:choose>
</span><br/>
</div>
<div id="iframe_rigth">
<button type="button" class="btn_plus"><span>+</span></button>
</div>
</div>
<div id="iframe_line"></div>
<div id="con_wrap">
	<c:set var="recNo" value="${recNo }"/>
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }"/>
	<div id="one_wrap">
		<a href="javascript:read('${dto.id }')">
		[질문]
		<input type="hidden" id='hid_recNo_${recNo }' value='${dto.title}'/>
		<span id="recNo_${recNo }"></span>
		</a><br/>
	</div>
	</c:forEach>
</div>
</body>
</html>