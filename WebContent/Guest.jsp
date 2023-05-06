<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import = "java.sql.*, java.util.*, ggmProject.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.GuestBean" id="gtBean" />
<jsp:setProperty name="gtBean" property="*"/>
<jsp:useBean class="ggmProject.GuestMgr" id="gtMgr" />
<jsp:setProperty name="gtMgr" property="*"/>
<% Object aid = session.getAttribute("id");
String aeid = (String)aid;
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset=UTF-8">
<title><% out.print(aeid); %>의 방명록</title> 
</head> 
<body> 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
 
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td align="center"><font color="#FFFFFF">글내용</font></td>
		<td align="center"><font color="#FFFFFF">날짜</font></td>
		<td align="center"><font color="#FFFFFF">보낸계정</td>
		<td align="center"><font color="#FFFFFF">사진</td>
		<td align="center"><font color="#FFFFFF">자세히보기</td>
		</tr>
		<%
		Vector<GuestBean> vResult = gtMgr.getGuestList(aeid);
		if(vResult.size() == 0){
		%>
		<%}else{
			for(int i = 0; i < vResult.size(); i++){
			gtBean = (GuestBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%= gtBean.getText()%></td>
		<td align="center"><%= gtBean.getDate()%></td>
		<td align="center"><%= gtBean.getUserid()%></td>
		<td align="center"><%= gtBean.getImage()%></td>
		<td align="center"><a href="javascript:productDetail('<%= gtBean.getNo()%>')">상세보기</a></td>
		</tr>
		<%}
		}%>
		<tr>
		<td colspan="5" align="center"><a href="Main.jsp?CONTENTPAGE=GuestDM.jsp">방명록보내기</a></td>
		</tr>
		</table>
		
	</td>
	</tr>
	</table> 
</body> 
</html>

