<%@page import="ggmProject.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.PostBean" id="ptBean" />
<jsp:setProperty name="ptBean" property="*"/>
<jsp:useBean class="ggmProject.PostMgr" id="ptMgr" />
<jsp:setProperty name="ptMgr" property="*"/>
<%
	Object aid = session.getAttribute("id");
	String aeid = (String)aid;
	
	String flag = request.getParameter("flag");
	boolean result = false;
	
	if(flag.equals("insert")){
    	result=ptMgr.insertPost(request);
	}else if(flag.equals("update")){
    	result=ptMgr.updatePost(request);
    }else if(flag.equals("delete")){
		result=ptMgr.deletePost(request.getParameter("no"));
	}else{
		response.sendRedirect("ProductMgr.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="Main.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="Main.jsp";
	  </script>
<%	}%>