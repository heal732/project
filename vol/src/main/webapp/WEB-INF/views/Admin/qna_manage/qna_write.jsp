<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String content = (String)request.getAttribute("qna_content"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script type="text/javascript">
   $(function(){
	   $("#board_ok").click(function(){
		   var content=$("#text_write");
		   var bbs_id=$("#bbs_id");
		   var kind=$("#kind").val();
		   if(content.val().trim().length==0){
			   alert("내용을 입력해주세요.");
			   return false;
		   }
		   
		   $.ajax({
			   url:"./write_ok.do",
			   type:"post",
			   dataType:"json",
			   data:{content:content.val(),bbs_id:bbs_id.val(),kind:kind},
			   success:function(data){
				   if(data.result==1){
					  location.href="./detail.do?bbs_id="+bbs_id.val();
				   }else{
					   alert("글쓰기 실패");
				   }
			   }
		   })
		   
	   });
	  
	   
	   fix_height_modi("div_center","left_field");
	   
   })
    function fix_height_modi(fname,lname) {
			
			 if(document.getElementById(fname) && document.getElementById(lname)) {
			  var Fname = document.getElementById(fname);
			  var Lname = document.getElementById(lname);
			  if(Fname.offsetHeight>Lname.offsetHeight){
				  Lname.style.height = Fname.offsetHeight + "px";
			  }
			}
		} 
</script>
<!-- body 시작  -->
<style>

</style>
<body>
<input type="hidden" value="<%if(content!=null){%>1 <%}else{%>2<%} %>" id="kind"/>
<div class="div_left" id="div_left">
<div>
	<div >
		<textarea id="text_write" class="text_content" style="resize:none"><%if(content!=null){%><%=content %> <%} %></textarea>	
	</div>
	<button type="button" id="board_ok"><span>확인</span></button>
</div> 
</div>
</body>
</html>