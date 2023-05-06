<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.*,ggmProject.*"%>
<jsp:useBean id="regBean" class="ggmProject.RegisterBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean id="regGMM" class="ggmProject.RegisterGGM" scope="session" />
<jsp:setProperty name="regGMM" property="*" />

<html>
<head>
<title>GGMWorld Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %> 
	
	<%Vector vResult= regGMM.getDBList();%>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td align="center"><font color="#FFFFFF">회원이름</font></td>
		<td align="center"><font color="#FFFFFF">회원아이디</font></td>
		<td align="center"><font color="#FFFFFF">패스워드</font></td>
		<td align="center"><font color="#FFFFFF">이메일</font></td>
		<td align="center"><font color="#FFFFFF">수정</font></td>
		</tr>
		<%
		for(int i=0; i<vResult.size(); i++){
		regBean = (RegisterBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%= regBean.getName() %></a></td>
		<td align="center"><%= regBean.getId() %></td>
		<td align="center"><%= regBean.getPw() %></td>
		<td align="center"><%= regBean.getEmail() %></td>
		<td align="center"><a href="javascript:Update('<%=regBean.getId()%>')">수정하기</a></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>


	<%@ include file="Bottom.jsp" %>

	<form name="update" method="post" action="MemberUpdate.jsp">
	<input type=hidden name="userid">
	</form>

</body>
</html>
