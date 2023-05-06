<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.RegisterBean" id="regBean" scope="session"/>
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="ggmProject.RegisterGGM" id="regGGM" scope="session"/>

<% 
	regGGM.insertMember(regBean);
	response.sendRedirect("Login.jsp");
%>