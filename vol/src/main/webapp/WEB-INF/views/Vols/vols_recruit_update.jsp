<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../header.jsp"%>
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
            			location.href="./vols_recruit_list.do";
            		}
            	},
            	error:function(){
            		alert("에러");
            	}
            });
             
             
        });  
    });
    
</script>
<style>
#wirte_field{
width:900px;
	margin:0px auto;
}
</style>
<input type="hidden" id="bbs_id" value="${dto.id }"/>
	<div id="wirte_field">
	<table width="900" border="0" cellpadding="0" cellspacing="0">
		<tr height="60">
			<td><div style="float:left; width:50px; font-size: 20px;">제목</div><input type="text" name="title" id="title" value="${dto.title }" size="40"></td>
		</tr>
		<tr>
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
	</div>

<!-- body 끝  -->

<%@ include file="../footer.jsp"%>