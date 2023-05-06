<%@ page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="regBean" class="ggmProject.RegisterBean" scope="session" />
<jsp:setProperty name="regBean" property="*" />
<jsp:useBean id="regGMM" class="ggmProject.RegisterGGM" scope="session" />
<jsp:setProperty name="regGMM" property="*" />
<%
    boolean flag = regGMM.memberUpdate(regBean);
%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="Index.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>
