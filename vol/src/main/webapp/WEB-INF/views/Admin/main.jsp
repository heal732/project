<%@page import="net.util.CountManager"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./adminheader.jsp"%>

<script>
var counter = 0;
var interval = setInterval(function() {
	var wrap_fullscreen = $('#wrap_fullscreen');
    $("#alert").html(counter);
    counter--;
    if (counter == -1) {
    	wrap_fullscreen.fadeOut("fast");  
        clearInterval(interval);
    }
}, 1000);

</script>
	<style>
		#wrap_fullscreen{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10;
			width:100%;
			height:100%;
			clear:both; 
			background-color:skyblue; 
			border:1px solid skyblue; 
			border-radius:10px;
		}
		.ad-font{
		
			font-size: 30px;
		}
		#ad-first-wrap{
			margin-top: 40%;
		}
	</style>
<!-- body 시작 -->
<div id="wrap_fullscreen">
	<div id="ad-first-wrap" align="center">
		<span id="alert" class="ad-font"></span><span class="ad-font">후에 admin Page로 접속 됩니다.</span>
	</div>
	
</div>

<div>

<div align="center">
	<div style="height:150px; width:300px; margin-top:200px">
	<span style="font-size: 20px;">접속자수: <%=CountManager.getCount()%></span>
	<br/><br/>
	<div style="height:1px; width:300px; background: black;"></div>
	</div>
</div>
</div>



<!-- body 끝 -->

<%@ include file="./adminfooter.jsp"%>
