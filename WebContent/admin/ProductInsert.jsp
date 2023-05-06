<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#996600" topmargin="100">

	<%@ include file="Top.jsp" %>

	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<form method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center"><font color="#FFFFFF">게시글 등록</font></td>
		</tr>
		<tr> 
		<td align="center">내용</td>
		<td align="left"><input type="text" name="text" size="20"></td>
		</tr>
		<tr> 
		<td align="center">등록일자</td>
		<td align="left"><input type="text" name="date" size="20">원</td>
		</tr>
		<tr> 
		<td align="center">댓글</td>
		<td><textarea rows="10" cols="45" name="comment"></textarea></td>
		</tr>
		<tr> 
		<td align="center">이미지</td>
		<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="게시글등록">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시쓰기">
		</td>
		</tr>
		</table>
		</form>
	
	</td>
	</tr>
	</table>

	<%@ include file="Bottom.jsp" %>

</body>
</html>

