<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<html>
<head>
<title>로그아웃</title>
</head>
<body>
<%
   session.removeAttribute("id");
   session.removeAttribute("pwd");
   response.sendRedirect("Login.jsp");
%>
</body>
</html>