<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../adminheader.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">

<!-- body 시작  -->
<title>글 수정</title> 
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
         $("#update_go").click(function(){
        	 var title=$("#title");
            obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
            var content=$("#content");
            var id=$("#bbs_id");
          
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
            	url:"./update_ok.do",
            	type:"post",
            	data:{title: title.val(), content: content.val() , id: id.val()},
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
            			location.href="./notice_list.do";
            		}
            	},
            	error:function(){
            		alert("에러");
            	}
            });
             
             
        });  
    });
    
</script>
<form method="post" name="form1" >
			<input type="hidden" name="nowPage" value="${param.nowPage }">
	 		<input type="hidden" name="col" value="${param.col }">
	 		<input type="hidden" name="word" value="${param.word }">
	 		<input type="hidden" name="bbs_id" id="bbs_id" value="${param.bbs_id }">
	<table width="900" border="1" cellpadding="0" cellspacing="0">
		<caption>글수정 (* 필수 입력사항)</caption>
		<tr>
			<th height="34">제목*</th>
			<td><input type="text" name="title" id="title" value="${dto.title }" size="40"></td>
		</tr>
		<tr>
			<th height="209">내용*</th>
			<td><textarea name="content" style="width: 800px; height: 600px;" id="content">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td height="54" colspan="2">
				<div align="center">
					<button type="button" id="update_go"><span>글수정</span></button>
				</div>
			</td>
		</tr>
	</table>
	</form>
	<br/>
	<div align="center"><a href="./notice_list.do">[글목록]</a></div>

<!-- body 끝  -->

<%@ include file="../adminfooter.jsp"%>