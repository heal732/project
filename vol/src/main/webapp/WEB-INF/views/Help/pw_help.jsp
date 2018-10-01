<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#id_s_total{
	width:100%;
	height:80%;
	margin-top:5%;
}
#id_s_pw{
	width:49%;
	height: 100%;
	border: 1px solid #e6e6e6;
	margin: 0px auto;
}

#num_div{
	width:60%;
	height:40px;
	float:right;
	margin-right: 10%;
	border:1px solid black;
	background: white;
}
#search_num{
	width:90%;
	height:28px;
	margin-left: 5%;
	margin-top: 3px;
	border: none;
}
#search_email{
	width:90%;
	height:28px;
	margin-left: 5%;
	margin-top: 3px;
	border: none;	
}
#s_span{
	font-size: 20px;
	
}
.btn_s{
	width:100%;
	height:100%;
}

#s_id{
	width:90%;
	height:28px;
	margin-left: 5%;
	margin-top: 3px;
	border: none;
}
</style>
<body>
<h2 style="margin-left: 10%;">비밀번호 찾기</h2>
<div style="width:80%; height:1px; background: black; margin-left: 10%;"></div>
<div id="id_s_total">
	<div id="id_s_pw">
		<div style="width:auto; height:30px;" >
			<div style=" margin-left: 5%; width:200px; height:50px; margin-top: 50px;"><span id="s_span">비밀번호 찾기</span>
			</div>
		</div><br/>
		<div style="width:100%; height:60px; margin-top:60px;">
			<div style="float:left; margin-top: 10px; margin-left: 5%; ">아이디: 
			</div>
			<div id="num_div"><input type="text" name="s_id" id="s_id"/><br/>
			</div><br/>
		</div>
		<div style="margin-top: 80px; width:100%; height:60px;">
			<div style="width:40%; height:40px; margin:0px auto;">
				<button type="button" class="btn_s" onclick="pw_search_email()">찾기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>