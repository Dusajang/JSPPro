<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//?ok&name=이시훈  인증성공
	// error           인증실패
	String ok = request.getParameter("ok");
	String logonName = request.getParameter("name");
	String error = request.getParameter("error");
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
<style>
  #logon, #logout{
    border:1px solid gray;
    width:300px;
    padding:20px;
    border-radius: 10px;
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
        	ex09.jsp  메인페이지
    	[로그인부분]
    	설문조사   인증O + 권한O
    	일정관리   인증O
    	게시판     인증X도 사용 가능
    	
    	ex09_ok.jsp
    	[인증처리하는 페이지]
  </xmp>
  
  <div id="logon">  
     <form action="ex09_ok.jsp" method="get">
      아이디 : <input type="text"  name="id"  value="admin"><br>
      비밀번호 : <input type="password"  name="passwd"  value="1234"><br>
      <input type="submit"  value="logon"> 
     </form>  
  </div>
  
	<div id="logout" style="display: none">
		[<%= logonName %>] 로그인하셨습니다. <br>
		<button>로그아웃</button>
	</div>
	
	<%
		// 로그인 성공, 인증 성공
		if(ok!=null){
	%>
	<a href="#">설문조사</a> <br>
	<a href="#">일정관리</a> <br>
	<script>
		alert("로그인 성공!!");
		$("#logon").hide();
		$("#logout").show();
	</script>
	<%
		}//if
	%>
	
	
	
	<a href="#">게시판</a> <br>
	
	<%
	if(error != null){
	%>
	<script>
		alert("로그인 실패~~");
	</script>
	<%	
	}
	%>
	
	<script>
	$("#logout button").on("click", function () {
		alert("인증, 권한 삭제 후 메인 페이지 이동.")
		location.href = "ex09.jsp"
	})
	</script>
  
  
</div>
</body>
</html>