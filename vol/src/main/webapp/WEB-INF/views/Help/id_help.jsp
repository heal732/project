<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%int num=0; int email=1; %>
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
#id_s_left{
	float:left;
	width:49%;
	height: 100%;
	border: 1px solid #e6e6e6;
}
#id_s_right{
	float:right;
	width:49%;
	height: 100%;
	border: 1px solid #e6e6e6;
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
</style>
<body>
<h2 style="margin-left: 10%;">아이디찾기</h2>
<div style="width:80%; height:1px; background: black; margin-left: 10%;"></div>
<div id="id_s_total">
	<div id="id_s_left">
		<div style="width:auto; height:30px;" >
			<div style=" margin-left: 5%; width:200px; height:50px; margin-top: 50px;"><span id="s_span">번호로 찾기</span>
			</div>
		</div><br/>
		<div style="width:100%; height:60px; margin-top:60px;">
			<div style="float:left; margin-top: 10px; margin-left: 5%; ">전화번호: 
			</div>
			<div id="num_div"><input type="text" id="search_num"/>
			</div><br/>
		</div>
		<div style="margin-top: 80px; width:100%; height:60px;">
			<div style="width:40%; height:40px; margin:0px auto;">
				<button type="button" class="btn_s" onclick="id_search(<%=num%>)">찾기</button>
			</div>
		</div>
	</div>
	<div id="id_s_right">
		<div style="width:auto; height:30px;" >
			<div style=" margin-left: 9%; width:200px; height:50px; margin-top: 50px;"><span id="s_span">이메일로 찾기</span>
			</div>
		</div><br/>
		<div style="width:100%; height:60px; margin-top:60px;">
			<div style="float:left; margin-top: 10px; margin-left: 9%;">이메일: 
			</div>
			<div id="num_div"><input type="text" id="search_email"/>
			</div><br/>
		</div>
		<div style="margin-top: 80px; width:100%; height:60px;">
			<div style="width:40%; height:40px; margin:0px auto;">
				<button type="button" class="btn_s" onclick="id_search(<%=email%>)">찾기</button>
			</div>
		</div>
	

	</div>
</div>

</body>
</html>