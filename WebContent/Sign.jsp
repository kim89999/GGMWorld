<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="Sign.css">
<script>
    function join(){
        if(document.f.name.value == ""){
            alert("이름을 입력하세요");
            document.f.name.focus();
            document.f.action = "join.jsp";
            return;
        }
       
        if(document.f.id.value == ""){
            alert("아이디를 입력하세요");
            document.f.id.focus();
            document.f.action = "join.jsp";
            return;
        }
       
        if(document.f.pw.value == ""){
            alert("패스워드를 입력하세요");
            document.f.pw.focus();
            document.f.action = "join.jsp";
            return;
        } else if (document.f.pw.value != document.f.rpw.value){
            alert("암호가 일치하지 않습니다. 다시 입력하세요");
            document.f.action = "join.jsp";
            document.f.pw.value = "";
            document.f.pwc.value = "";
            document.f.pwd.focus();
            return;
        }

    }
</script>
</head>
<body>
<div class="Sbig">
    <div class="s"><h1><img src="img/GGMW.png" class="aggm">회원가입</h1></div>
    <form action="Session_Sign.jsp" class="f" name="f">
            <h3><img src="img/GGM2.png" class="aggm1">는 필수입력 사항입니다.</h3>
            	<img src="img/GGM2.png" class="aggm1"><input type="text" class ="name" name= "name" placeholder="이름"><br><br>
            	<img src="img/GGM2.png" class="aggm1"><input type="text" class ="id" name= "id" placeholder="아이디"><br><br>
            	<img src="img/GGM2.png" class="aggm1"><input type="password" class ="pw" name= "pw" placeholder="비밀번호"><br><br>
            	<img src="img/GGM2.png" class="aggm1"><input type="password" class ="pwc" name= "pwc" placeholder="비밀번호 확인"><br><br>
            	<input type="email" class="email" name="email" placeholder="이메일"><br><br>
            	<%-- <input type="number" class="phone" name="phone" placeholder="전화번호 (숫자만 입력)"><br><br>
            	<input type="text" class="address" name="address" placeholder="주소"><br><br> --%>
            <input type="submit" value="가입하기" onclick="join()">
            <input type="submit" action="Login.jsp" value="취소">
    </form>
</div>
</body>
</html>