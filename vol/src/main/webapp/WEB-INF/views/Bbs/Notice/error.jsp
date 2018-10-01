<%@ page contentType="text/html; charset=UTF-8" %> 
<% if(session.getAttribute("login_id")==null||session.getAttribute("login_id")=="guest" ){%>
	<meta http-equiv="refresh" content="0; URL=<%=request.getContextPath() %>/"/>
	<%}%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>알림</title> 
</head> 
<body>
<div style="text-align: center; font-size: 2em;">알림</div>

<div style="width: 100%; text-align: center; margin:0 auto; font-size:20px">
<%
String msg1 = (String)request.getAttribute("msg1");
String link1 = (String)request.getAttribute("link1");
String link2 = (String)request.getAttribute("link2");

out.println("<DL>");
if(msg1 != null){
	out.println("<DT>ERROR</DT>");
	out.println("<DD><img src=''>"+msg1+"</DD>");
}
out.println("</DL>");
out.println("<br><br>");

if(link1 !=null){
	out.println(link1);
}
if(link2 != null){
	out.println(link2);
}
%>
</div>
</body> 
</html>