<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vols.css" />
<!-- body 시작  -->
<script type="text/javascript">
function read(bbs_no){
	 var str="read.do";
	 str= str+"?bbs_no="+bbs_no;
	 str= str+"&nowPage=${nowPage}";
	 str= str+"&col=${col}";
	 str= str+"&word=${word}";
	 //alert(str);
	 location.href= str;
}

function searchCheck(f){
	if(f.word.value == ""){
		alert("검색어를 입력하세요");
		f.word.focus();
		return;
	}
	f.submit();
}

function fix_height(fname,lname) {

	 if(document.getElementById(fname) && document.getElementById(lname)) {
	  var Fname = document.getElementById(fname);
	  var Lname = document.getElementById(lname);
		
	  if(Fname.offsetHeight < Lname.offsetHeight){		  
		  Fname.style.height = (Lname.offsetHeight+50) + "px";
	  }  
	}
} 


$(function(){
	fix_height('bbs_content_wrap','content_view'); // 테이블 높이 조정
})
</script>

<div id="bbs_header_wrap">
	<span class="glyphicon glyphicon-home"><a href="<%=request.getContextPath()%>/">Home</a></span><span>></span><span>고객센터</span><span>></span><!-- navi -->봉사안내
</div>
<div id="bbs_content_wrap">
	<div id="bbs_content_left">
		<div id="bbs_c_l_wrap" class="center_do">
			<h1>봉사안내</h1>

		</div>
	</div>
	<div id="bbs_content_right">
		<div class="content_view" id="content_view">
			<div class="service_guide">
				<div class="txt_group">
					<h3 class="tit_lv2">자원봉사란?</h3>
					<ul class="bull_list h_decs">
						<li class="triangle">라틴어 <em>voluntas</em>에서 유래</li>
						<li class="triangle">
							<em>volo(의지)</em>
							<p>1. 영어의 will</p>
							<p>2. voluntus라는 말 생성</p> 
							<p>3. 의미: 자발적인 것, 자주적&middot;임의적 자유의지</p>
						</li>
						<li class="triangle">
							<em>자원봉사 활동</em>
							<p>개인 또는 단체가 지역사회·국가 및 인류사회를 위하여 대가 없이 자발적으로 시간과 노력을 제공하는 행위</p>
						</li>
					</ul>
				</div>
				<div class="txt_group">
					<h3 class="tit_lv2">자원봉사의 특성</h3>
					<div class="box_pink">
						<ul class="bull_list">
							<li class="triangle point"><strong>자발성</strong> : 자신의 의사로써 시간과 재능, 경험을 도움이 필요한 이웃과 지역사회 공동체 형성에 아무런 대가 없이 활동하는 것</li>
							<li class="triangle point"><strong>무보수성</strong> : 경제적 보상과 관련되는 것으로 자원봉사활동에 대해 금전적 대가를 받지 않는 것</li>
							<li class="triangle point"><strong>공익성</strong> : 이웃과 지역사회 내에 산재하고 있는 문제를 해결하여 삶의 질을 향상시키기 위하여 활동하는 것</li>
							<li class="triangle point"><strong>지속성</strong> : 자원봉사활동에 참여하게 되면 일정기간 동안 지속성과 정기적으로 봉사활동에 참여하는 것</li>
						</ul>
					</div>
				</div>
				<div class="txt_group">
					<h3 class="tit_lv2">봉사자의 자세</h3>
					<ul class="bull_list h_decs">
						<li class="triangle">자원봉사 활동을 하는 목적을 분명히 알고 처음의 순수함을 돌아보는 자세를 갖습니다.</li>
						<li class="triangle">매사에 긍정적인 생각을 가지고 타인에게 모범을 보일 수 있는 성품을 지닐 수 있도록 노력합니다.</li>
						<li class="triangle">다른 사람들을 보살피고 맡은 바 직책을 충실히 이행합니다.</li>
						<li class="triangle">자신의 말이나 행동이 어떠한 영향을 미치는지 항상 생각하고 신중한 자세로 임합니다.</li>
						<li class="triangle">활동에 대한 책임감을 가지고 봉사활동을 시작합니다.</li>
						<li class="triangle">활동은 성실히 하며, 활동 시간에 대한 약속을 꼭 지킵니다.</li>
						<li class="triangle">자신의 개인 적인 문제나 감정이 있더라도 이를 자신의 일과 분리할 수 있는 능력과 자질이 있어야 합니다. </li>
						<li class="triangle">자원봉사자는 양심적이어야 합니다.</li>
						<li class="triangle">자원봉사자는 끊임없이 공부하며 배우는 자세를 가져야 합니다.</li>
					</ul>
				</div>
				<div class="txt_group">
					<h3 class="tit_lv2">봉사참여과정</h3>
					<div class="service_process">
						<div class="global_steps">
							<ul>
								<li class="first"><span class="haze">1.</span>신청</li>
								<li><span class="haze">2.</span>교육</li>
								<li><span class="haze">3.</span>배치</li>
								<li><span class="haze">4.</span>봉사</li>
								<li><span class="haze">5.</span>실적인증</li>
								<li class="last"><span class="haze">6.</span>인증서발급</li>
							</ul>
						</div>
						<div class="detail">
							<h4 class="haze">봉사 참여 안내</h4>
							<div class="detail_step">
								<ul>
									<li><span class="num">1</span>www.1365.go.kr에 접속</li>
									<li><span class="num">2</span>지역, 분야 등 자신의 조건에 맞는 자원봉사를 조회</li>
									<li><span class="num">3</span>자원봉사 상세정보를 꼼꼼히 확인하여 자원봉사 신청 </li>
								</ul>
								<div class="guide_link">
									<a href="/vols/1472176623798/wpge/volsguide1365.do" class="btn yellow_r"><span>이용가이드 바로가기</span></a>
								</div>
							</div>
							<p class="main_txt">늘 마음뿐이던 자원봉사!<i>이제 1365와 함께 자원봉사의 주인공이 되어보세요!</i></p>
							<ul class="bull_list h_list">
								<li class="hypen">- 내게 꼭 맞는 ‘맞춤형 자원봉사’를 검색할 수 있습니다.</li>
								<li class="hypen">- 자원봉사 실적관리에서 확인서 발급까지 한번에 해결할 수 있습니다</li>
								<li class="hypen">- 자원봉사종합보험을 통해 자원봉사 활동 중 발생할 수 있는 사고위험으로부터 자원봉사자를 보호합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--// contents :: End -->

		


<!-- body 끝  -->

<%@ include file="../../footer.jsp"%>