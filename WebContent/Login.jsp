<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGMW</title>
<link rel="stylesheet" href="Login.css">
</head>
<body>
<div class="big">
<form action="Session_Login.jsp" method="post" class="small">
<img src="img/GGMW.png" class="logo">
	<p><input class="id" type = "text" name="id" placeholder="아이디"></p>
	<p><input class="pwd" type = "password" name="pwd" placeholder="비밀번호"></p>
	<p><input class="login" type = "submit" value = "로그인"></p>
</form>
<form action="Sign.jsp" method="get" class="small2">
		<p><input class="sign" type = "submit" value = "회원가입"></p>
</form>
</div>
</body>
</html>