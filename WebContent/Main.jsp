<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% String contentPage = request.getParameter("CONTENTPAGE");
   if (contentPage==null){
   		contentPage="Home.jsp";
   }
%>
<meta charset="UTF-8">
<title>GGMW 미니홈피</title>
</head>
<link rel="stylesheet" href="Main.css">
<body onresize="window.top.resizeTo(1350, 850)" onload="window.top.resizeTo(1350, 850)">
<div class="big">
	<img id="background" src="img/ttle.png" width="1300" height="700">
	
	<div class="top">
		<jsp:include page="Top.jsp" flush="false" />
	</div>

	<div class="bgm">
		<jsp:include page="Audio.jsp" flush="false" />
	</div>
	<div class="content">
		<section id="areaMain">
			<jsp:include page='<%= contentPage %>' flush="false" />
		</section>
	</div>
</div>
</body>
</html>