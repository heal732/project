<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>봉사활동 여기서 구해라</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  <link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet" type="text/css">
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
      height: 200px;
       background: #ffffff;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
	  background-color: #ffffff;
      padding: 25px;
    }

    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
      max-height: 500px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  
  #container_txt-center2{
  height:100px;
  }
    
  #left-main-header{
  float:left;
  }
  
  #right-main-header{
  float:right;
  }
  
  .main-li{
  	margin: 0 10px 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
  }
  #main-ul{
  list-style:none;
    margin:0;
    padding:0;
  }
  
  #navi-main{
  float: right;
  }
  
  #top-menu{
  	 position:absolute;
  	 top:20px;
  	 right:100px;
  	
  }
  
  </style>
</head>
<script type="text/javascript">
function go_main(){
	location.href="<%=request.getContextPath()%>";
}
</script>
<body>

<div class="jumbotron" style="background-image: url('<%=request.getContextPath()%>/resources/images/background.png');">
	<a href="/vol/"><img  src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:100px; height : 100px; margin-left: 100px; "></a>
  <div id="container_txt-center2">
   <div id="left-main-header">
   </div>
   <div id="right-main-header">
   <div id="top-menu">
     	<ul id="main-ul">
     	<%if(session.getAttribute("grade")!=null){if(session.getAttribute("grade").equals("A")){%>
     	 <li class="main-li"><a href="<%=request.getContextPath() %>/admin_main.do">관리자 페이지</a></li>
     	<%}}%>
        <li class="main-li"><a href="<%=request.getContextPath() %>/Mypage/main.do" >My Page</a></li>
          <li class="main-li"><a href="https://www.1365.go.kr/vols/main.do" target="_blank"> 사이트맵</a></li>
      </ul>
   </div>

   </div>    
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<%=request.getContextPath() %>/">Home</a></li>
        <li><a href="<%=request.getContextPath() %>/Bbs/Infomation/vol_info.do">봉사안내</a></li>
        <li><a href="<%=request.getContextPath() %>/Vols/vols_list.do">봉사정보</a></li>
        <li><a href="<%=request.getContextPath() %>/Bbs/Notice/notice_list.do">고객센터</a></li>
      </ul>
    </div>
  </div>
</nav>