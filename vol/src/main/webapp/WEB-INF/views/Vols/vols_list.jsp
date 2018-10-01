<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<%String grade = (String)session.getAttribute("grade"); %>
  <!-- 데이트 피커 용 -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vols.css" />
<!-- body 시작  -->
<style>
#font-menu{
	color: black;
	font-size:20px;
	width:50%;
}
.menu-wrap{
	width:100%;
	border-top:1px solid #d9d9d9;
	float:left;
}
.menu-wrap:hover{
background: #ffedcc;
}
.bott{
	border-bottom:1px solid #d9d9d9;
}

#bbs_content_right{
	padding-top: 50px;
}

#search_table{
border-collapse: separate;
	width:80%;
	height:150px;
	border-spacing: 5px 5px;
}

#search_table td{
	background: #ddffcc;
	padding-left: 10px;
}
.btn_vols{
  border:1px solid #34495e;
  text-align:center;
  position:relative;
  box-sizing:border-box;
  margin:0 0 40px 0;
}

#btn_s_start{
  width:150px;
  height:40px;
  background-color: #94b8b8;
}

#btn_s_clear{
  width:200px;
  height:40px;
  background-color: white;
}
#sch_table_wrap{
	height:200px;
}
a{
color:black;
}
tr{
	border-bottom: 1px solid black;
	height:50px;
}
.bott{
	border-bottom:1px solid #d9d9d9;
}

#table_div{
	margin-top:20px;
}
.end_tr{
	border-bottom: none;
}
</style>
<script type="text/javascript">

$(function() {
	  var dates = $( "#from, #to " ).datepicker({
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  dateFormat: 'yy-mm-dd',
	  showMonthAfterYear: true,
	  yearSuffix: '년',
	maxDate:'+30d',
	  onSelect: function( selectedDate ) {
	    var option = this.id == "from" ? "minDate" : "maxDate",
	      instance = $( this ).data( "datepicker" ),
	      date = $.datepicker.parseDate(
	        instance.settings.dateFormat ||
	        $.datepicker._defaults.dateFormat,
	        selectedDate, instance.settings );
	    dates.not( this ).datepicker( "option", option, date );
	  }
	  });
	  
	  fix_height_modify('sch_table_wrap','table_div','bbs_content_wrap'); // 테이블 높이 조정
	});
	
function fix_height_modify(fname,lname,mname) {

	 if(document.getElementById(fname) && document.getElementById(lname)) {
	  var Fname = document.getElementById(fname);
	  var Lname = document.getElementById(lname);
	  var Mname = document.getElementById(mname);
	  
	  var total_height=Fname.offsetHeight+Lname.offsetHeight;
	  
	   Mname.style.height = (total_height+50) + "px";
	}
} 

function read(id){
	 var str="detail.do";
	 str= str+"?progrmRegistNo="+id;
	 location.href= str;
}

function search_clear(){
	$("#sido").val("전체");
	$("#gugun").val("전체");
	$("#word").val("");
	
	$('input:checkbox[name="posblAt"]').each(function() {
	      this.checked = false; //checked 처리
	 });
	$('#from').val("");
	$('#to').val("");
}

function search_start(){
	var sido=$('#sido').val();
	var gugun=$('#gugun').val();
	var word=$('#word').val();
	var yngbgsPosblAt = '';
	var adultPosblAt = '';
	
	var chbox=$('#posblAt:checked').each(function() { 
        if($(this).val()==0){
        	yngbgsPosblAt="Y";	
        }else{
        	adultPosblAt="Y";	
        }
   });
	
	var fromDate=$('#from').val();
	var toDate=$('#to').val();
	
	var str="?sido="+sido;
	str+="&gugun="+gugun;
	str+="&word="+word;
	str+="&yngbgsPosblAt="+yngbgsPosblAt;
	str+="&adultPosblAt="+adultPosblAt;
	str+="&progrmBgnde="+fromDate;
	str+="&progrmEndde="+toDate;
	location.href="./vols_list.do"+str;
	
}

function stau(stau,reg){
	if(stau==1){
		$("#stau_" + reg).html("모집대기");
	}else if(stau==2){
		$("#stau_" + reg).html("모집중");
	}else if(stau==3){
		$("#stau_" + reg).html("모집완료");
	}	
}

function shgugun(i){
	var values = [];
	$.ajax({
		type:"post",
		dataType:"json",
		data:{sido: i},
		url:"gugun_list",
		success:function(retVal){
			values = retVal.list;
			$('#gugun').empty();
			$('#gugun').append($('<option>',{ value: "전체", text: "전체" }));
			$.each(values, function(idx, val) {
				$('#gugun').append($('<option>',{ value: val, text: val }));
			});
		}
	});
}

</script>

<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="<%=request.getContextPath()%>/">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->봉사목록
</div>
<div id="bbs_content_wrap">
	<div id="bbs_content_left">
		<div id="bbs_c_l_wrap" class="center_do">
			<h1>봉사정보</h1>
			<div class="menu-wrap" style="background: #ffedcc;"><a href="./vols_list.do"><span id="font-menu">봉사 목록</span></a></div><br/>
			<div class="menu-wrap bott"><a href="./vols_recruit_list.do"><span id="font-menu">봉사 인원 모집</span></a></div><br/>
		       <%if(grade!=null){if(grade.equals("B")){%>
		    	   <div class="bott"><a href="./recruit_write.do"><span id="font-menu">구인 공고</span></a></div><br/>
		       <%}} %> 
		</div>
	</div>
	<div id="bbs_content_right">
	<div align="center" id="sch_table_wrap">
	<table id="search_table">
		<tr>	
			<td>
			<span><b>봉사지역 &nbsp&nbsp</b></span>
			<select id="sido" onchange="shgugun($('#sido').val())">
				<option value="전체">전체</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="울산광역시">울산광역시</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select>
	
			<select id="gugun">	
				<option value="전체">전체</option>		
			</select>			
			</td>
			<td>
				<span><b>봉사 자유형 &nbsp&nbsp</b></span>
				<input type="checkbox" id="posblAt" value="0">청소년 <input type="checkbox" id="posblAt" value="1">성인
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<span><b>봉사기간 &nbsp&nbsp</b></span>
			<input type="text" id="from" class="datePick"> ~ <input type="text" id="to" class="datePick">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span><b>봉사제목 &nbsp&nbsp&nbsp</b></span><input name="word" id="word" type="text" size="25">
			</td>
		</tr>
				
	</table>
		<button type="button" class="btn_vols" id="btn_s_start" onclick="search_start()"><span>조회하기</span></button>
		<button type="button" class="btn_vols" id="btn_s_clear" onclick="search_clear()"><span>선택 초기화</span></button>
		</div>
	<div id="table_div">
		<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
	<c:set var="recNo" value="${recNo }"/>    
	<c:forEach var="dto" items="${list }">
		<c:set var="recNo" value="${recNo-1 }"/>
		<tr>
			<td>
				<a href="javascript:read('${dto.progrmRegistNo }')">${dto.progrmSj}</a>
			</td>
			<td id="stau_${dto.progrmRegistNo }"><script>
				stau(${dto.progrmSttusSe},"${dto.progrmRegistNo }");
			</script></td>
			<td>${dto.nanmmbyNm }</td>
		</tr>
	</c:forEach>
	<tr class="end_tr">
		<td colspan="6"><div align="center">${paging }</div></td>
	</tr>
	</table>
	</div>
	</div>
</div>

<!-- body 끝  -->

<%@ include file="../footer.jsp"%>