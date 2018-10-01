<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../../header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script type="text/javascript">
   $(function(){
	   $("#board_ok").click(function(){
		   var title=$("#title");
		   var content=$("#content");
		   
		   if(title.val()==null || title.val()==""){
			   alert("제목을 입력해주세요.");
			   return false;
		   }
		   
		   var blank_pattern = /^\s+|\s+$/g;
		   if( title.val().replace( blank_pattern, '' ) == "" ){
		       alert(' 공백만 입력되었습니다 ');
		       return false;
		   }
		   if(content.val().trim().length==0){
			   alert("내용을 입력해주세요.");
			   return false;
		   }
		   
		   $.ajax({
			   url:"./write_ok.do",
			   type:"post",
			   dataType:"json",
			   data:{title:title.val(), content:content.val()},
			   success:function(data){
				   if(data.result==1){
					  location.href="./qna_list.do";
				   }else{
					   alert("글쓰기 실패");
				   }
			   }
		   })
		   
	   });
   })
    
</script>
<!-- body 시작  -->
<style>
#wirte_field{
width:900px;
	margin:0px auto;
}

#title{
border:none; 
width:89%; 
height:30px; 
border-bottom: 1px solid black
}
</style>
<div id="wirte_field">
<input type="text" name="title" id="title" placeholder="제목"><br/><br/>
	<div >
		<textarea name="content" id="content" style="width: 800px; height: 600px; resize:none;"> </textarea>	
	</div>
	<button type="button" id="board_ok"><span>확인</span></button>
</div> 
<!-- body 끝  -->

<%@ include file="../../footer.jsp"%>