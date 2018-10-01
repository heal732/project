<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function goHome(){
	location.href="<%=request.getContextPath()%>";
}
</script>
<style>
#go_main{
background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
#go_main:hover{
  background:#fff;
  color:#1AAB8A;
}
#go_main:before,#go_main:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
#go_main:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#go_main:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<body>
<div>
	<h2>임시 비밀번호가 발급되었습니다.</h2>
	<span>메인 화면으로 가서 로그인 해주세요</span><br/>
</div>

<div id="" style="width:300px; height:300px; margin: 0px auto;">
	<button type="button" id="go_main" onclick="goHome()" style="margin-top: 200px; margin-left: 100px; width:200px; height:60px; font-size: 20px"><span>메인 페이지</span></button>
</div>

</body>
</html>