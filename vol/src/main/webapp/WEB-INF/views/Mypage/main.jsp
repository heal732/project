<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/views/header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
	<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- body 시작  -->
<script>

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

 $(function(){
   	var email="${member.mem_email}";
	var sp_email=email.split("@");
	var sp_sp_email=sp_email[1].split(".");
	sp_email[0]=toStar(sp_email[0],2);
	sp_email[1]=toStar(sp_sp_email[0],2)+"."+sp_sp_email[1];
	email=sp_email[0]+"@"+sp_email[1]; 
	
 	var phone="${member.mem_phone}";
	var phone=phone.substr(0, 3)+" - "+toStar(phone.substr(3, 4),1)+" - "+toStar(phone.substr(7, 4),1);
	$("#email").html(email);
	$("#phone").html(phone); 		
})

$(function(){
	$('#modi').click(function(){
		location.href="./modi_profile.do";
    });
	
	$("#modi_pw").click(function(){
		location.href="./modi_chk_pw.do";
	});
	
	$("#grade_regi").click(function(){
		location.href="./grade_regi.do";
	});
})


 
 
</script>
<style>
#total_wrap{
	padding-top:50px;
	height:700px;
	background: #f2f2f2;
}

#up_wrap{
	width:60%;
	height:250px;
}
.left_div{
	float:left;
}

.right_div{
	float:right;
}
#id_pw{
	width:40%;
	height:250px;
	margin-left: 80px;
	border: 1px solid #e6e6e6;
	background: white;
}

#name_phone{
	width:40%;
	height:250px;
	margin-right: 80px;
	border: 1px solid #e6e6e6;
	background: white;
}
#grade{
	width:40%;
	height:250px;
	border: 1px solid #e6e6e6;
	background: white;
}
#down_wrap{
	margin-top:50px;
	width:60%;
	height:250px;
}

#fback{
	background: #f2f2f2;
}

.myPage{
	font-size: 20px;
}
.wrap1{
	width:80%;
	height:100%;
	padding-top: 20px;
}
.margin_clas{
	margin-top: 20px;
}
</style>
<div align="center" id="total_wrap" >
	<div id="up_wrap">
		<div class="left_div" id="id_pw">
			<div align="justify" class="wrap1">
				<div>
					<span class="myPage">프로필</span><br/>
				</div>
				<div class="margin_clas">
					<span >아이디:&nbsp&nbsp&nbsp${member.mem_id }</span><br/>
					<span >이름:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${member.mem_name }</span><br/>
				</div>
				<div class="margin_clas">
					<button type="button" id="modi_pw"><span>비밀번호 변경하기</span></button>
				</div>
			</div>
		</div>
		<div class="right_div" id="name_phone">
			<div align="justify" class="wrap1">
				<div>
					<span class="myPage">연락처</span><br/>
				</div>
				<div class="margin_clas">
						<span><b>이메일:</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="email"></span><br/>
						<span><b>휴대전화:</b>&nbsp&nbsp&nbsp</span><span id="phone"></span><br/>
				</div>
				<div class="margin_clas">
					<button type="button" id="modi"><span>수정하기</span></button><br/>
				</div>
			</div>
		</div>
	</div>

	<div id="down_wrap" align="center">
		<div id="grade">
			<div class="wrap1"align="justify">
				<div>
					<span class="myPage">등급</span><br/>
				</div>
				<div class="margin_clas">
						<span>등급: 
							<c:set var="grade" value="${member.mem_grade }"/>
							<c:choose>
								<c:when test="${grade eq 'F' }">일반 회원</c:when>
								<c:when test="${grade eq 'B' }">단체(장) 회원</c:when>
								<c:when test="${grade eq 'A' }">관리자</c:when>
							</c:choose>
						</span><br/>
				</div>
				<div class="margin_clas">
					<button type="button" id="grade_regi"><span>등급 변경 신청하기</span></button>
				</div>
			</div>
		</div>
	</div>
</div>




<!-- body 끝  -->

<%@ include file="/WEB-INF/views/footer.jsp"%>