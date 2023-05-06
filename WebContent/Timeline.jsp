<%@page import="ggmProject.PostBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*, ggmProject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.PostBean" id="ptBean" />
<jsp:setProperty name="ptBean" property="*"/>
<jsp:useBean class="ggmProject.PostMgr" id="ptMgr" />
<jsp:setProperty name="ptMgr" property="*"/>
<%
Object aid = session.getAttribute("id");
String aeid = (String)aid;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><% out.print(aeid); %>의 타임라인</title>
<link href="Timeline.css" rel="stylesheet" type="text/css">
</head>
<body class="body">
<% Vector<PostBean> vResult = ptMgr.getPostList(); %>
	<div class="over">
	<%
	   for(int i = 0; i < vResult.size(); i++) {
	  		ptBean = (PostBean)vResult.get(i);
	%>
	<table class="t1">
			<tr>
			<td align="center"><b><%= ptBean.getUserid() %></b></td>
			</tr>			
			<tr>
			<td align="center"><b><img src="data/<%= ptBean.getImage() %>" height="550px" width="550px"></b></td>
			</tr>
			<tr>
			<td align="center"><b><%= ptBean.getDate() %></b></td>
			</tr>
			<tr>
			<td align="center"><b><%= ptBean.getText() %></b></td>
			</tr>
			<tr>
			<td align="center">
				<INPUT type='button' value='좋아요'>
				<INPUT type='button' value='댓글'>
				<INPUT type='button' value='공유하기'>
			</td>
			</tr>
			</table>
	<%
	   } 
	%>
	</div>
</body>
</html>