<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
    ex09.jsp
    ex09_idcheck.jsp
  </xmp>
  
  <h2>회원 가입 페이지</h2>
  <form action="" method="get">
    deptno : <input type="text" name="deptno" value="10" /><br>
    empno(id) : <input type="text" name="empno" value="7369" />
    <input type="button" id="btnEmpnoCheck" 
           value="empno 중복체크 - jquery ajax" />
   <p id="notice"></p>
   <br>
   ename : <input type="text" name="ename" value="" /><br>
   job : <input type="text" name="job" value="" /><br>   
   <input type="submit" value="회원(emp) 가입" />   
  </form>
  
  <script>
  	$(function () {
		$("#btnEmpnoCheck").on("click", function () {
			// console.log("SSS")
			// deptno=10&empno=7369&ename=&job=
			let params = $("form").serialize();
			//alert(params);
			$.ajax({
					url:"ex09_idcheck.jsp"
					, dataType:"json"    // text, json, xml, jsonp 등등
					, type:"GET"
					, data:params
					, cache:false
					, success:function (data, textStatus, jqXHR){
						// {"count":0} -> js Object 변환
						// JSON.parse() X
						alert( data.count)
						if(data.count==1){
							$("#notice").css("color","red").text("이미 사용 중인 ID 입니다.");
						}else{
							$("#notice").css("color","black").text("사용 가능한 ID 입니다.");
						}
					} //:success
					,error:function (){
						alert("에러~~");
					}
					});//ajax
		}); // click
	}); // ready
  </script>
</div>
</body>
</html>