<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.PostBean" id="ptBean" />
<jsp:setProperty name="ptBean" property="*"/>
<jsp:useBean class="ggmProject.PostMgr" id="ptMgr" />
<jsp:setProperty name="ptMgr" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>audio</title>
<link rel="stylesheet" href="Audio.css">
</head>
<body>

<% 
Object aid = session.getAttribute("id");
String aeid = (String)aid;

out.println(aeid + " 님 환영합니다");
String m1 = "audio/DONT TOUCH ME.mp3";
String m2 = "audio/프리스타일 - Y.mp3";
%>

<audio class="player" autoplay controls>
		<source src="audio/프리스타일 - Y.mp3" type="audio/mp3">
</audio>
</body>
</html>