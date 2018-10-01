<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
var value=$.cookie("login_id");

$(function(){
	if(value!=null){
		$("#login_id").val(value);
		$("#id_save").attr("checked", true);
	}

	 /* fix_height(silde-container,bbs_wrap);  */
})

function fix_height(fname,lname) {

	 if(document.getElementById(fname) && document.getElementById(lname)) {
	  var Fname = document.getElementById(fname);
	  var Lname = document.getElementById(lname);
		
	  if(Fname.offsetHeight < Lname.offsetHeight){
		  Fname.style.height = Lname.offsetHeight + "px";
	  }  
	}
}
function logout(){
	location.href="./logout";
}

window.fn=function(i){
	if(i==1){
		location.href="<%=request.getContextPath()%>/Bbs/Notice/notice_list.do";
	}else if(i==2){
		location.href="<%=request.getContextPath()%>/Vols/vols_recruit_list.do";
	}else if(i==3){
		location.href="<%=request.getContextPath()%>/Vols/vols_list.do";
	}else if(i==4){
		location.href="<%=request.getContextPath()%>/Bbs/QandA/qna_list.do";
	}
}

window.read=function(i,id){
	if(i==1){
		location.href="<%=request.getContextPath()%>/Bbs/Notice/detail.do?bbs_id="+id;
	}else if(i==2){
		location.href="<%=request.getContextPath()%>/Vols/recruit_detail.do?bbs_id="+id;
	}else if(i==3){
		location.href="<%=request.getContextPath()%>/Vols/detail.do?progrmRegistNo="+id;
	}else if(i==4){
		location.href="<%=request.getContextPath()%>/Bbs/QandA/detail.do?bbs_id="+id;
	}
}
</script>
<style>
#btn_logout{
width:70px;
  height:30px;
  border:2px solid #34495e;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 40px 0;
  background-color: white;
  }
  
  #btn_logout_text{
  	font-size:12px;
  }
 .silde-menu-container{
	align-self:center;
}
.silde-container{
	margin-left: 17%;
	width:40%;
}

#top-continer{
	width:100%;
	height:300px;
}
iframe{
	width:100%;
	height:100%;
	overflow:hidden;
	object-fit:cover;
}
.bwrap{
	height:300px;
	
}
#bbs_wrap{
	width:70%;
	margin-left:10%;
	background: green;
}
.bcontainer{
	width:80%;
	height:100%;
	margin:0px auto;
	border:1px solid #e6e6e6;
}

.bbsleft{
width:50%;
float:left;
}

.bbsright{
width:50%;
float:right;
}

.bbs_wrap_t{
	width:80%;
	margin-left:10%;
	height:350px;
}
</style>

<!-- body 시작  -->
<% String login_id=(String)session.getAttribute("login_id");
%>
<div id="main_wrap">
<div id="top-continer">
<div class="w3-content w3-display-container silde-container" id="main_leftdiv">
  <img class="mySlides max-small siz" src="./resources/images/example_vol1.jpg" >
  <img class="mySlides max-small siz" src="./resources/images/example_vol2.jpg">
  <img class="mySlides max-small siz" src="./resources/images/example_vol3.jpg">
  <img class="mySlides max-small siz" src="./resources/images/example_vol4.jpg">
  <div class="w3-center w3-display-bottommiddle silde-menu-container siz" style="width:100%">
    <span class="w3-badge demo w3-border" onclick="currentDiv(1)"></span>
    <span class="w3-badge demo w3-border" onclick="currentDiv(2)"></span>
    <span class="w3-badge demo w3-border" onclick="currentDiv(3)"></span>
    <span class="w3-badge demo w3-border" onclick="currentDiv(4)"></span>
     <div class="glyphicon glyphicon-backward" style="color:white; cursor:pointer; margin-left:50px;" onclick="plusDivs(1)"></div>
  	 <div class="glyphicon glyphicon-pause" style="color:white; cursor:pointer; margin-left:10px;" onclick="stopDivs()"></div>
  	 <div class="glyphicon glyphicon-play" style="color:white; cursor:pointer; margin-left:10px;" onclick="startDivs()"></div>
  	 <div class="glyphicon glyphicon-forward" style="color:white; cursor:pointer; margin-left:10px;" onclick="plusDivs(4)"></div>
  </div>
</div>
		 <div id="main_righttdiv">
		<%if(login_id==null || login_id.equals("guest")){%>
			<form method="post" action="./login" onsubmit="return login_check(this)" name="main_fomr">
			<input type="text" class="login_form" placeholder="아이디" name="login_id" id="login_id" /><br/>
			<input type="password" class="login_form" placeholder="비밀번호" name="login_pw"/><br/>
			<input type="submit"  class="login_form" value="로그인"/><br/>
			<div style="border: solid 1px black;"class="login_form" align="center">
				<input type="checkbox" name="id_save" id="id_save" value="1"/>아이디저장 | <a href="Help/join.do">회원가입</a>
			</div>
			<div style="border: solid 1px black;" class="login_form" align="center">
				<a href="Help/All_help.do">아이디찾기 | 비밀번호찾기</a>
			</div>
		</form>
		
			<%if(request.getParameter("login_result")!=null&&request.getParameter("login_result").equals("1")){%>
			<script>
			$(function(){
				alert("아이디와 비밀번호를 확인해주세요.");
			})
			</script>
		<%}}else{%>
			<b><%=login_id %> 님</b><button onclick="logout()" id="btn_logout"><span id="btn_logout_text">로그아웃</span></button>
		<%} %>
		</div>
</div>
<div class="bbs_wrap_t">
	<div id="bbs_wrap">
		<div class="bwrap bbsleft">
			<div class="bcontainer">
			<iframe src='notice.do' scrolling="no" frameBorder="0"></iframe>
			</div>
		</div>
		
		<div class="bwrap bbsright" >
			<div class="bcontainer">
			<iframe src='recruit.do' scrolling="no" frameBorder="0"></iframe>
			</div>
		</div>
	</div>
</div>
<div class="bbs_wrap_t">
<div id="bbs_wrap">
	<div class="bwrap bbsleft">
		<div class="bcontainer">
		<iframe src='vols.do' scrolling="no" frameBorder="0"></iframe>
		</div>
	</div>
	
	<div class="bwrap bbsright" >
		<div class="bcontainer">
		<iframe src='qna.do' scrolling="no" frameBorder="0"></iframe>
		</div>
	</div>
</div>
</div>
</div>
<script>
var slideIndex = 1;
showDivs(slideIndex);

var interval;
function startval(){
	interval = setInterval(function() {
		 slideIndex++;
		    if (slideIndex == 5) {
		    	slideIndex = 1;
		    }
		    showDivs(slideIndex);
		}, 2000);
}
startval();
function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
  
}

function login_check(f){
	var id=f.login_id.value;
	var pw=f.login_pw.value;
	if(id==null || id==""){
		alert("아이디를 입력해 주세요.");
		return false;
	}
	
	if(pw==null || pw ==""){
		alert("비밀번호를 입력해 주세요.");
		return false;
	}
	
	return true;
}
function plusDivs(di){
	currentDiv(di);
}

function stopDivs(){
	clearInterval(interval);
}

function startDivs(){
	startval();
}

</script>
<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>