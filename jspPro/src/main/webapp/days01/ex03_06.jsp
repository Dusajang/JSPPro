<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// ex03_06.jsp?num 값을 주지 않을경우
	// ex03_06.jsp?num=    ""
	// ex03_06.jsp?num     ""
	// ex03_06.jsp 요청       ?num=5
	// request.getParameter("num") == null
	// Integer.parseInt(null) 500 서버 오류 발생.
	
	//int num = Integer.parseInt(request.getParameter("num"));
	String pNum = request.getParameter("num");
	
	int num = 0;
	if(pNum != null && !pNum.equals("")){
		num = Integer.parseInt(pNum);
	}
	
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
  <!-- <form> -->
  <%-- 
  정수 : <input type="text" id="num" name="name" autofocus="autofocus" value='<%= pNum == null ? "" : pNum %>'> <br> 
  --%>
  
  정수 : <input type="text" id="num" name="name" autofocus="autofocus"> <br>
  <p id="demo">
    <%
    if(pNum != null && pNum != null && !pNum.equals("")){
		  int sum = 0;
		  for(int i =1; i<=num; i++){
			  sum += i;
		  %><%= i %>+<%
		  }//for
		  %>=<%= sum %>
		  <%
    }
  %>
  </p>
  <!-- </form> -->
  
  <!--  숫자 n을 입력하고 enter치면 그 1~n까지의 총합을 구한다.
   n이 숫자가 아니면 alert("숫자만 입력하세요") 유효성 검사까지 -->



<script>
		$("#num")
		.css("text-align","center")
		<%-- .val('<%= pNum == null ? "" : pNum %>') --%>
		.val('${param.num}')
		.on({
		   "keydown":function (e){
		      if ( !(e.which >= 48 && e.which <= 57
		    		   || e.which >= 96 && e.which <= 105
		               || e.which == 8
		               || e.which == 13
		               || e.which == 229
		               || e.which == 37
	                   || e.which == 39
		           )){
		         alert("숫자만 입력하세요.");
		         e.preventDefault();
		      } // if
		   },
		   "keyup":function (event){
		     //if( event.which == 13 && $("#num").val().length != 0){
		     if( event.which == 13){
		        // js BOM
		        $("form").submit();
		        let numValue = $("#num").val();
		        location.href = `ex03_06.jsp?num=\${numValue}`;
		        
		     } // if
		     $("#num").val(numValue);
		   }
		})
		.select();
</script>


</div>
</body>
</html>