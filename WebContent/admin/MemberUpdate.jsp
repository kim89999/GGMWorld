<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*,ggmProject.*" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="regBean" class="ggmProject.RegisterBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean id="regGMM" class="ggmProject.RegisterGGM" scope="session" />
<jsp:setProperty name="regGMM" property="*" />


<html>
<head>
<title>회원수정</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600">
<br>

	<%@ include file="Top.jsp" %>
	<%
	String uid = request.getParameter("userid");
	regBean = regGMM.getDB(uid);
	%>
	 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<form name="regForm" method="post" action="MemberUpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3"><font color="#FFFFFF"><b> 
		<%= regBean.getName() %>
		회원님의 정보를 수정합니다.</b></font> </td>
		</tr>
		<tr> 
		<td>아이디</td>
		<td><%= regBean.getId() %></td>
		</tr>
		<tr> 
		<td>패스워드</td>
		<td><input type="text" name="mem_passwd" value="<%= regBean.getPw() %>"></td>
		</tr>
		<tr> 
		<td>이름</td>
		<td><input type="text" name="mem_name" value="<%= regBean.getName() %>"></td>
		</tr>
		<tr> 
		<td>이메일</td>
		<td><input type="text" name="mem_email"  size="30" value="<%= regBean.getEmail() %>"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="수정완료"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="다시쓰기"> 
		</td>
		</tr>
		<input type="hidden" name="uid" value="<%= uid %>">
		</form>
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="Bottom.jsp" %>
		
</body>
</html>
