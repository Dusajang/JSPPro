<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    ex02_07.jsp
    국제화 fmt 접두어
    	ㄴ 특정 지역에 따라 알맞은 메세지를 출력할 때 사용
    	예) 화폐단위: 원 / 엔
    	ㄴ 주로 사용 : 숫자, 날짜 포맷팅
    	
    	fmt:formatNumber
    	fmt:formatDate
    	
    	fmt:parseNumber
    	fmt:parseDate
    	
  </xmp>
  <%
  	String strPrice = "1,200.34";
  	double douPrice = Double.parseDouble( strPrice.replaceAll(",", ""));
  
  // String -> double ( 1200.34 )  실수형으로 변환해서 사용...
  %>
  double price = <%= douPrice %><br>
  
  <hr>
  
  <fmt:parseNumber value="<%= strPrice %>" pattern="0,000.00" var="douPrice2"/>
   double price2 = ${ douPrice2 }<br>
   
   <hr>
   
   <%
   	long price = 22345;
    // 22,345.00
   %>
   <c:set value="<%= price %>" var="lprice"></c:set>
   long price = ${ lprice }<br>
   
   <fmt:formatNumber value="${ lprice }" var="sPrice" type="number" pattern="##,###.00"/>
   String price = ${sPrice}<br>
  
  
  
</div>
</body>
</html>





