<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#help_div{
	margin: 0px auto;
	width:80%;
	height:800px;
	display: block;
}
  #help_search{
  	width:100%;
  	height:600px;
  	padding-top: 200px;
  }
  #help_s_m{
  	width:70%;
  	height:80%;
  	margin: auto;
  	background: white;
  }
#help_header{
	position:absolute;
	top: 0px;
	left: 0px;
	width:100%;
	height:118px;
	background: #ccffff;
	border-bottom: 1px solid #99ffff;
	z-index: 2;
}

.help-li{
    padding: 0 0 0 0;
    border : 0;
    float: left;
  }
  #help-ul{
  list-style:none;
    margin:0;
    padding:0;
  }
  a{
  text-decoration: none;
  }
  

  .btn_home{
  	background-color: #87CEEB;
	padding: 8px 16px;
	margin: 2px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	display: inline-block;
	cursor: pointer;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	border-radius: 6px;
	margin-top: 7px;
	margin-left: 7px;
  }
  .btn_home:hover{
		background-color: #4169E1;
		color: white;
	}
	#ul_wrap{
		height:68px;
		width:468px;
		background: #87CEEB; 
		margin: 0px auto;
	}
	#ul_totalwrap{
		background: #87CEEB; 
		height:68px;
		width:100%;
	}
	.btn_content{
	background-color: #87CEEB;
	padding: 8px 16px;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	}
	.btn_wrap{
		width:200px;
		height:50px;
		border: 1px solid  #cc99ff;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
function search_id(){
	$.ajax({
		url:"search_id.do",
		type:"post",
		dataType:"html",
		success:function(data){
			 $("#help_s_m").html("");
			 $("#help_s_m").append(data); 
		},
		error:function(data){
			alert("error");
		}
	});
}

function search_pw(){
	$.ajax({
		url:"search_pw.do",
		type:"post",
		dataType:"html",
		success:function(data){
			 $("#help_s_m").html("");
			 $("#help_s_m").append(data); 
		},
		error:function(data){
			alert("error");
		}
	});
}

function id_search(n){
	var email=$("#search_email").val();
	var phone=$("#search_num").val();
	if(n==0){ //번호로 찾기
		$.ajax({
			url:"search_id_num_ok.do",
			type:"post",
			data:{phone : phone},
			dataType:"json",
			success:function(data){
				if(data.result==0){
					alert("번호가 등록되어 있지 않습니다.");
				}else{
					var ds=data["ids"];
					var d=JSON.parse(ds);
					$.ajax({
						url:"result.do",
						type:"post",
						dataType:"html",
						data:"",
						success:function(data){
							$("#help_s_m").html("");
							$("#help_s_m").append(data); 
							var str="";
							for(var i=0 ; i< d.length ; i++){
								var tmpId=toStar(d[i],2);
								str+='<span class="f_id">아이디:</span><span>'+tmpId+'</span><br/>';
							}
							$("#res_div").html(str);
						}
					}); 
				}
			},
			error:function(data){
				alert("error");
			}
		});
	}else if(n==1){ // 이메일로 찾기
		$.ajax({
			url:"search_id_email_ok.do",
			type:"post",
			data:{email:email},
			dataType:"json",
			success:function(data){
				if(data.result==0){
					alert("이메일 등록되어 있지 않습니다.");
				}else{
					var ds=data["ids"];
					var d=JSON.parse(ds);
					$.ajax({
						url:"result.do",
						type:"post",
						dataType:"html",
						data:"",
						success:function(data){
							$("#help_s_m").html("");
							$("#help_s_m").append(data); 
							var str="";
							for(var i=0 ; i< d.length ; i++){
								var tmpId=toStar(d[i],2);
								str+='<span class="f_id">아이디:</span><span>'+tmpId+'</span><br/>';
							}
							$("#res_div").html(str);
						}
					}); 
				}
			},
			error:function(data){
				alert("error");
			}
		});
	}	
}

function pw_search_email(){
	var id=$("#s_id").val();
	$.ajax({
		url:"search_pw_id_ok.do",
		type:"post",
		data:{id: id},
		dataType:"json",
		success:function(data){
			if(data.result==1){
				$.ajax({
					url:"search_pw_email.do",
					type:"post",
					dataType:"html",
					data:{id : id},
					success:function(data){
						$("#help_s_m").html("");
						$("#help_s_m").append(data);
					}
				});
			}else{
				alert("아이디가 등록되어 있지 않습니다.");
			}
		},
		error:function(data){
			alert("error");
		}
	});
}

function pw_search_go(){
	var email=$("#s_email").val();
	var hide_id=$("#hide_id").val();
	$.ajax({
		url:"search_pw_email_ok.do",
		data:{email : email,hide_id: hide_id},
		type:"post",
		dataType:"json",
		success:function(data){
	 		if(data.result >= 1){
	 			$.ajax({
	 				url:"search_pw_go.do",
	 				type:"post",
	 				dataType:"html",
	 				success:function(data){
	 					$("#help_s_m").html("");
	 					$("#help_s_m").append(data); 
	 				},
	 				error:function(data){
	 					alert("error");
	 				}
	 			});
	 		}else{
	 			alert("이메일이 등록되어 있지 않습니다");
	 		}
		},
		error:function(data){
			alert("error");
		}
	});
	
}

function go_main(){
	location.href="<%=request.getContextPath()%>";
}

 function toStar(str,sb){
	var tmp_str=str.substr(0, sb);
	var tmp2_str=str.substr(sb, str.length);
	var tmp3_str="";
	for(var i=0 ; i< tmp2_str.length ; i++){
		tmp3_str+="*";
	}
	tmp2_str=tmp3_str;
	str=tmp_str+tmp2_str;
	return str;
}  
</script>
</head>
<body>
<div style="width:100%; height:100%; position: absolute; top:0px; left:0px;">
<div id="help_header">
	<div style="height:50px; width:100%;"><a href="<%=request.getContextPath() %>" class="btn_home">HOME</a></div>
	<div id="ul_totalwrap">
		<div id="ul_wrap">
			<ul id="help-ul">
				<li class="help-li"><div class="btn_wrap btn_content" align="center"><div style="margin-top: 5px"><button type="button" onclick="search_id()" style="font-size: 25px; border: none; background: #87CEEB">아이디 찾기</button></div></div></li>
				<li class="help-li"><div class="btn_wrap btn_content" align="center"><div style="margin-top: 5px"><button type="button" onclick="search_pw()" style="font-size: 25px; border: none; background: #87CEEB">비밀번호 찾기</button></div></div></li>
			</ul>
		</div>
	</div>
</div>

<div id="help_div">
	<div id="help_search">
		<div id="help_s_m">
	
		</div>
	</div>
</div>
</div>
</body>
</html>