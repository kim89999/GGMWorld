<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*,ggmProject.*" %> 
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="regBean" class="ggmProject.RegisterBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean id="regGMM" class="ggmProject.RegisterGGM" scope="session" />
<jsp:setProperty name="regGMM" property="*" />


<html>
<head>
<title>ȸ������</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600">
<br>

	<%@ include file="Top.jsp" %>
	<%
	String userid = request.getParameter("userid");
	regBean= regGMM.getDB(userid);
	%>
	 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<form name="regForm" method="post" action="UpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3"><font color="#FFFFFF"><b> 
		<%= regBean.getName() %>
		ȸ������ ������ �����մϴ�.</b></font> </td>
		</tr>
		<tr> 
		<td>���̵�</td>
		<td><%= regBean.getId() %></td>
		</tr>
		<tr> 
		<td>�н�����</td>
		<td><input type="text" name="pw" value="<%= regBean.getPw() %>"></td>
		</tr>
		<tr> 
		<td>�̸�</td>
		<td><input type="text" name="name" value="<%= regBean.getName() %>"></td>
		</tr>
		<tr> 
		<td>�̸���</td>
		<td><input type="text" name="email"  size="30" value="<%= regBean.getEmail() %>"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="�����Ϸ�"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="�ٽþ���"> 
		</td>
		</tr>
		<input type="hidden" name="userid" value="<%= userid %>">
		</form>
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="Bottom.jsp" %>
		
</body>
</html>
