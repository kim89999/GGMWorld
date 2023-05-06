<%@page import="ggmProject.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.GuestBean" id="gtBean" />
<jsp:setProperty name="gtBean" property="*"/>
<jsp:useBean class="ggmProject.GuestMgr" id="gtMgr" />
<jsp:setProperty name="gtMgr" property="*"/>
<%
	Object aid = session.getAttribute("id");
	String aeid = (String)aid;
	
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("insert")){
    	result=gtMgr.insertGuest(request);
	}else if(flag.equals("update")){
    	result=gtMgr.updateGuest(request);
    }else if(flag.equals("delete")){
		result=gtMgr.deleteGuest(request.getParameter("no"));
	}else{
		response.sendRedirect("GuestDM.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="Main.jsp?CONTENTPAGE=Guest.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="Main.jsp?CONTENTPAGE=GuestDM.jsp";
	  </script>
<%	}%>