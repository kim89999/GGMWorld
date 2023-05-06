<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Object aid = session.getAttribute("id");
String aeid = (String)aid;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><% out.print(aeid); %>의 방명록 보내기</title>
</head>
<body>
<table width="800px" height="570px" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<form method="post" action="GuestDMProc.jsp?flag=insert" enctype="multipart/form-data">
		<table width="100%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF"><% out.print(aeid + " "); %>의 방명록 보내기</font></td>
		</tr>
		</tr>
		<td align="center">보낼계정</td>
		<td><textarea rows="1" cols="30" name="todm" width="100%" style="resize :none;" placeholder="반드시 입력하세요"></textarea></td>
		</tr>
		<tr> 
		<td align="center">작성내용</td>
		<td><textarea rows="25" cols="95" name="text" width="100%" style="resize :none;"></textarea></td>
		</tr>
		<tr> 
		<tr> 
		<td align="center">이미지</td>
		<td><input type="file" name="image"></td>
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="방명록등록">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시쓰기">
		</td>
		</tr>
		</table>
		<input type="hidden" class ="userid" name= "userid" value="<% out.print(aeid); %>">
		</form>
	</td>
	</tr>
	</table>
</body>
</html>