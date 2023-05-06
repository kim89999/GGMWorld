<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="ggmProject.RegisterBean" id="regBean" scope="session"/>
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="ggmProject.RegisterGGM" id="regGGM" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String action = request.getParameter("action");

if(action.equals("delete")) {
		if(regGGM.DeleteDB(regBean.getId())) {
			response.sendRedirect("Session_Admin.jsp?action=list");
}
else
	throw new Exception("DB 삭제 오류");
}
%>
</body>
</html>