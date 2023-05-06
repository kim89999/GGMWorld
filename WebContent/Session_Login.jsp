<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ggmProject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="regBean" class="ggmProject.RegisterBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean id="regGMM" class="ggmProject.RegisterGGM" scope="session" />
<jsp:setProperty name="regGMM" property="*" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String ch = regGMM.viewMember(id);

	if(pwd.equals(ch)){
    	session.setAttribute("id", id);
    	session.setAttribute("pwd", pwd);
    	response.sendRedirect("Main.jsp");
    	}else{
        	response.sendRedirect("Loginfail.jsp");
    	}
%>
