<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
<%@ page errorPage="/WEB-INF/error/viewErrorMessage.jsp" %>
 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    ex02_02.jsp
    1. try~catch~finially 문 사용
    2. 예외가 발생하면 예외 페이지를 따로 설정 -> 응답
    	WEB-INF 폴더
    		ㄴ error 폴더 생성
    			ㄴ viewErrorMessage.jsp
    3. 응답 상태 코드별로 예외 페이지를 설정 -> 응답
    	[응답 상태 코드] p.149
          404 : 요청URL을 처리하기 위한 자원이 존재하지 않음
          500 : 서버 내부 에러가 발생( 자바 코딩 X )
          200 : 요청을 정상적으로 처리
          401 : 접근을 허용하지 않음
          400 : 클라이언트의 요청이 잘못된 구문으로 구성.
          403 : PUT 요청 X 
          등등    
    4. 예외 타입별로 예외 페이지를 설정 -> 응답
    	[예외 타입별]
    		NullPointException
    		SQLException
    		등등
    		
    5. 예외 처리 우선 순위
		1) page 지시자 errorPage 속성    page 디렉티브의 errorPage 속성에 지정한 에러 페이지를 보여준다.
		2) web.xml <exception-type>      JSP 페이지에서 발생한 익셉션 타입이 web.xml 파일의 <exception-type>에 지정한 익셉션 타입과 동일한 경우 지정한 에러 페이지를 보여준다.
		3) web.xml <error-code>          에러 코드가 web.xml 파일의 <error-code>에 지정한 에러 코드와 동일한 경우 지정한 에러 페이지를 보여준다.
		4) 아무것도 해당하지 않는 경우 웹 컨테이너가 제공하는 기본 에러 페이지를 보여준다.
  </xmp>
  
  name <%= request.getParameter("name").toUpperCase() %>
</div>
</body>
</html>