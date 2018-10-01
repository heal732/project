<%@ page contentType="text/html; charset=UTF-8" %> 
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/error.do"/>
	<%}else if(!session.getAttribute("login_id").equals("admin1")){ %>
		<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/error.do"/>
<%}%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>AdminPage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
  
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1000px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 10px;
      }
      .row.content {height: auto;} 
    }
    
    .nav-pills>li.active2>a:focus, .nav-pills>li.active2>a:hover{
		color: #fff;
	background-color: #337ab7
}
.nav-pills>li.act>a{
	color: #000d1a;
	background-color: #80ffbf;
	border-radius: 10px 10px 10px 10px
}
  </style>
  <script>
  $(function(){
	  var path="${pre_page}";
	  if(path=="M"){
		  $("#m").addClass("act");
	  }else if(path=="N"){
		  $("#n").addClass("act");
	  }else if(path=="Q"){
		  $("#q").addClass("act");
	  }else if(path=="G"){
		  $("#g").addClass("act");
	  }  
  })
  </script>
</head>
<body>

<div class="container-fluid">
  <div class="row content" id="left_field">
    <div class="col-sm-sx sidenav" id="sidena">
      <h4>관리자페이지</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="<%=request.getContextPath() %>/admin_main.do">Home</a></li>
        <li class="active2" id="n"><a href="<%=request.getContextPath() %>/notice_manage/notice_list.do">공지사항관리</a></li>
        <li class="active2" id="q"><a href="<%=request.getContextPath() %>/qna_manage/qna_list.do">Q&A답변</a></li>
        <li class="active2" id="m"><a href="<%=request.getContextPath() %>/member_manage/member_manage.do">회원목록</a></li>
        <li class="active2" id="g"><a href="<%=request.getContextPath() %>/member_manage/member_regist.do">등급 변경 신청 목록 </a></li>
      </ul><br>
    </div>
    
   