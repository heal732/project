<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../header.jsp"%>
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "content",
            sSkinURI: "<%=request.getContextPath() %>/resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
         //전송버튼
         $("#board_ok").click(function(){
        	 var title=$("#title_txt");
            obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
            var content=$("#content");
          
            if(title.val()==""){
    			alert("제목을 입력하세요");
    			title.focus();
    			return;
    		}
            if(content.val()=="" || content.val()=="<p>&nbsp;</p>"){
    			alert("내용을 입력하세요");
    			content.focus();
    			return;
    		}
         
             $.ajax({
            	url:"./create_ok.do",
            	type:"post",
            	data:{title: title.val(), content: content.val()},
            	dataType:"json",
            	success:function(data){
            		if(data.result==0){
            			<%
            			request.setAttribute("msg1", "글쓰기 실패!!<br/><br/>");
           			 	request.setAttribute("link1", "<input type='button' value='뒤로가기' onclick=\"history.back();\">");
           			 	request.setAttribute("link2", "<input type='button' value='목록' onclick=\"location.href='./notice_list.do' \" >");
            			%>
            			location.href="Admin/notice_manage/error";
            		}else if(data.result==1){
            			location.href="./vols_recruit_list.do";
            		}else if(data.result == 2){
            			alert("파일 이동 안됨");
            		}
            	},
            	error:function(){
            		alert("에러");
            	}
            });
        });  
    });
    
</script>
<!-- body 시작  -->
<style>
#wirte_field{
width:900px;
	margin:0px auto;
}

#board_ok{
width:70px;
  height:30px;
  border:1px solid #cc99ff;
  text-align:center;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 40px 0;
  background-color: white;
 }
 
 #title_txt{
border:none; 
width:89%; 
height:30px; 
border-bottom: 1px solid black
}
</style>
<div id="wirte_field">
	<input type="text" name="title_txt" id="title_txt" placeholder="제목">
	<div><br/>
		<textarea name="content" id="content" style="width: 800px; height: 600px;" ></textarea>	
	</div>
	<button type="button" id="board_ok"><span id="bbs_ok">확인</span></button>
</div> 
<!-- body 끝  -->

<%@ include file="../footer.jsp"%>