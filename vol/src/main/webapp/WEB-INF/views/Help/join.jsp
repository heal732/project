<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.join2{
	height:auto;
	width:500px;
		margin: 0px auto;
	}
	.join-font{
		color:gray;
	}
	
	.join-form{
		height:40px;
		width:400px;
	}
	#join_wrap{
	height:1000px;
	}
.cho_gender {float:left; list-style:none; margin:1px;}
.cho_gender span {display:block; width:150px; height:40px; background:#c00; color:#fff; border1px solid blue; font-size:20px; font-family:"돋움";
 text-align:center; padding-top:10px; text-decoration:none;}
.cho_gender span:hover {background:#099; text-decoration:none;}
p{
fo
}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function checkForm(){
	var id=$("#join_id").val();
	var pw=$("#join_pw").val();
	var pw2=$("#join_pw2").val();
	var name=$("#join_name").val();
	var birth=$("#join_birth").val();
	var email=$("#join_email").val();
	var phone=$("#join_phone").val();
	var gender=$("#gender_val").val();
	var count=0;
	if(id==null || id ==""){
		count++;
	}
	if(pw==null || pw ==""){
		count++;
	}
	
	if(pw2==null || pw2==""){
		count++;
	}
	
	if(name==null || name==""){
		count++;
	}
	if(birth==null || birth==""){
		count++;
	}
	if(email==null || email==""){
		count++;
	}
	if(phone==null || phone==""){
		count++;
	}
	if(gender==null || gender==""){
		count++;
	}
	var r=email.includes("@");
	if(!r){
		alert("이메일 형식을 맞춰 주세요.");
		return false;
	}
	
	r=phone.includes("-");
	if(r){
		alert("-를 빼주세요.");
		return false;
	}
	
	if(r.length==11){
		alert("전화번호를 정확히 입력해주시기 바랍니다.");
		return false;
	}
	if(count==0){
		if(pw==pw2){
			return true;	
		}
		alert("비밀번호가 같지 않습니다.");
	}else{
		alert("모두 입력해주세요.");
		return false;
	}
}

function click_span(n){
	if(n==0){
		if($("#gender_val").val()==1){
			$("#female").css("background","#099");
		}
		$("#male").css("background","#da8938");
	}else if(n==1){
		if($("#gender_val").val()==0){
			$("#male").css("background","#099");
		}
		$("#female").css("background","#da8938");
	}
	$("#gender_val").val(n);
	
}

function check_str(str) {
	 res1 = (/[a-z]/i).test(str); //영문이 있는지
	 res2 = (/[0-9]/).test(str); //숫자가 있는지
	 res3 = (/[!@#$%^&+-]/).test(str); //특수문자가 포함인지
	 
	 return res1 && res2 && res3;
}

function check_id(str) {
	 res1 = (/[a-z]/i).test(str); //영문이 있는지
	 res2 = (/[0-9]/).test(str); //숫자가 있는지
	 
	 return res1 && res2;
}


function check_dupe(){
	var str = $("#join_id").val();
	if(str!=null && str!="" && check_id(str) && str.length>=6){
		$.ajax({
			url:"../id_dupe_check",
			type:"post",
			data:{ str: str},
			dataType:"json",
			success:function(data){
				if(data.result==0){
					$("#dupe_result").css("color","blue");
					$("#dupe_result").html("사용 가능합니다.");
				}else{
					$("#dupe_result").css("color","red");
					$("#dupe_result").html("사용 불가능합니다.");
				}
			},
			error:function(){
				alert("error");
			}
		});
	}else{
		$("#dupe_result").css("color","red");
		$("#dupe_result").html("사용 불가능합니다.");
	}
}

function check_pw(){
	var pw = $("#join_pw").val();
	if(pw!=null && pw!="" && check_str(pw) && pw.length>=6){
		$("#pw_result").css("color","blue");
		$("#pw_result").html("사용 가능합니다.");
	}else{
		$("#pw_result").css("color","red");
		$("#pw_result").html("사용 불가능합니다.");
	}
}

function check_pw2(){
	var pw2 = $("#join_pw2").val();
	var pw = $("#join_pw").val();
	if(pw2==pw){
		$("#pw2_result").css("color","blue");
		$("#pw2_result").html("사용 가능합니다.");
	}else{
		$("#pw2_result").css("color","red");
		$("#pw2_result").html("사용 불가능합니다.");
		$("#join_pw2").val("");
	}
}
</script>
<body>

	<div id="join_wrap">
	<form method="post" name="join_form" action="../join" onsubmit="return checkForm()">
	<input type="hidden" id="gender_val" name="gender_val"/>
	<div class="join2">
	<p class="join-font" >아이디</p>
	<input type="text" class="join-form" id="join_id" name="join_id" placeholder="ex)영어, 숫자 조합으로 6자이상" onblur="check_dupe()"/>
	<p id="dupe_result"></p>
	<p class="join-font">비밀번호</p>
	<input type="password" class="join-form" id="join_pw" name="join_pw" placeholder="ex)영어, 숫자, 특수문자 조합으로 6자이상" onblur="check_pw()"/>
	<p id="pw_result"></p>
	<p class="join-font">비밀번호 재확인</p>
	<input type="password" class="join-form" id="join_pw2" placeholder="ex)영어, 숫자, 특수문자 조합으로 6자이상" onblur="check_pw2()"/>
	<p id="pw2_result"></p>
	<p class="join-font">이름</p>
	<input type="text" class="join-form" id="join_name" name="join_name" placeholder="ex)김가게"/>
	<p class="join-font">생년월일</p>
	<input type="text" class="join-form" id="join_birth" name="join_birth" placeholder="ex)19920328"/>
		<p class="join-font">이메일</p>
	<input type="text" class="join-form" id="join_email" name="join_email" placeholder="ex)exam@gmail.com"/>
		<p class="join-font">휴대전화</p>
	<input type="text" class="join-form" id="join_phone" name="join_phone" placeholder="ex)-없이 입력해주세요"/><br/>
	<br/>
	<ul>
		<li class="cho_gender" ><span id="male" onclick="click_span(0)">남</span></li>
		<li class="cho_gender" ><span id="female" onclick="click_span(1)">여</span></li>
	</ul>
	<br/><br/>	<br/><br/>
	<input type="submit" class="join-form" value="가입하기"/>
	</div>
	</form>
	</div>

</body>
</html>