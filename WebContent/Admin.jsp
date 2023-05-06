<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import= "java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean class="ggmProject.RegisterBean" id="regBean" scope="session"/>
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="ggmProject.RegisterGGM" id="regGGM" scope="session"/>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자화면</title>
</head>
<body>
<div align="center">
<H2>회원관리화면 </H2>
<HR>
[<a href=Main.jsp?action=list>메인화면</a>] <p>
<form name=form1 method=post action=Session_Admin.jsp>
<input type=hidden name="ab_id" value="<%= regBean.getId() %>">
<input type=hidden name="action" value="update">

<table border="1">
  <tr>
    <th>이 름</th>
    <td><input type="text" name="name" value="<%= regBean.getName() %>"></td>
  </tr>
  <tr>
    <th>Email</th>
    <td><input type="text" name="email" value="<%= regBean.getEmail() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>
<table border="1">
	<tr><th>아이디</th><th>이 름</th><th>비밀번호</th><th>이메일</th></tr>
	<tr>
		<td><a href="javascript:check(<%=regBean.getId()%>)"><%=regBean.getId() %></a></td>
		<td><%=regBean.getName() %></td>
		<td><%=regBean.getPw() %></td>
		<td><%=regBean.getEmail() %></td>
	</tr>
</table>
</div>
</body>
</html>