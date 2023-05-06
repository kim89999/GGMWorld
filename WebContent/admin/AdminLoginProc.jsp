<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="memMgr" class="ggmProject.RegisterGGM" />
<%
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	boolean adminCheck = memMgr.adminCheck(adminId, adminPw);
    if(adminCheck) {
	    session.setAttribute("adminKey", adminId);
%>

   <script>
   location.href="Index.jsp";
   </script>

<%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="AdminLogin.jsp";
   </script>

<%}%>