<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    [request 객체]
    1. 웹 브라우저 -> 요청
    
    
    클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
	서버와 관련된 정보 읽기 기능
	클라이언트가 전송한 요청 파라미터 읽기 기능
	클라이언트가 전송한 요청 헤더 읽기 기능
	클라이언트가 전송한 쿠키 읽기 기능
	속성 처리 기능
	
	
  </xmp>
  [암기] <br>
	***1. 컨텍스트 경로 		= <%= request.getContextPath() %> <br>
	***2. 클라이언트 IP 		= <%= request.getRemoteAddr() %> <br>
	***3. 요청 정보 전송 방식 	= <%= request.getMethod() %> <br>
	***4. 요청 URI 			= <%= request.getRequestURI() %> <br>
	***5. 요청 URL 			= <%= request.getRequestURL() %> <br>
	
	요청 정보 길이 = <%= request.getContentLength() %> <br>
	요청 정보 인코딩 = <%= request.getCharacterEncoding() %> <br>
	요청 정보 컨텐츠 타입 = <%= request.getContentType() %> <br>
	요청 정보 프로토콜 = <%= request.getProtocol() %> <br>
	서버 이름 = <%= request.getServerName() %> <br>
</div>
</body>
</html>