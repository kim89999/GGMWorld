<%@ page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="regBean" class="ggmProject.RegisterBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean id="regGMM" class="ggmProject.RegisterGGM" scope="session" />
<jsp:setProperty name="regGMM" property="*" />
<%
    boolean flag = regGMM.memberUpdate(regBean);
%>

<html>
<head>
<title>회원수정 처리</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<html>
<body bgcolor="#FFFFCC">
<br><br>
<center>
<%
if(flag){
	  out.println("<b>성공적으로 수정되었습니다..</b><p>");
	  out.println("<a href=Index.jsp>처음으로</a>");
	}else{
	  out.println("<b>다시 입력하여 주십시오.</b><p>");
	  out.println("<a href=Update.jsp>다시 입력</a>");
	}
%>
</center>
</body>
</html>