<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// ex02_ok.jsp?title=채식주의자&author=한강
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">dkrkdfla HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    
  </xmp>
	jsp EL 형식 <br>
  책 제목 : ${ param.title }<br>
  저자 : ${ param.author }<br>
  나이 : ${ param.age }<br>
  
  <a href="javascript:history.go(-1)">history 뒤로가기</a> <br>
  <a href="ex02.jsp">뒤로가기</a> <br>
</div>
</body>
</html>