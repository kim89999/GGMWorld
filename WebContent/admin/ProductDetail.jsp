<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,ggmProject.*"%>
<jsp:useBean id="proMgr" class="ggmProject.PostMgr" />

<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %>
	
	<%PostBean product= proMgr.getPost(request.getParameter("no"));%>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="3" align="center"><font color="#FFFFFF"><%=product.getText()%></font></td>
		</tr>
		<tr> 
		<td width="20%">
		<img src="<%=request.getContextPath()%>/data/<%=product.getImage()%> "        > 
		</td>
		<td width="30%" valign="top">

			<table border="1" width="100%" heigth="100%">
			<tr>
			<td><b>내    용 : </b><%=product.getText()%></td>
			</tr>			
			<tr>
			<td><b>댓    글 : </b><%=product.getUserid()%></td>
			</tr>
			<tr>
			<td><b>등록날짜 : </b><%=product.getDate()%></td>
			</tr>
			<tr>
			<td><b>이 미 지 : </b><%=product.getImage()%></td>
			</tr>
			</table>
		
		<tr> 
		<td colspan="3" align="center">
		<a href="javascript:productUpdate('<%=product.getNo()%>')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:productDelete('<%=product.getNo()%>')">삭제하기</a>
		</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>

	<%@ include file="Bottom.jsp" %>

	<form name="update" method="post" action="ProductUpdate.jsp">
	<input type=hidden name=no>
	</form>
	
	<form name="del" method="post" action="ProductProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


</body>
</html>


