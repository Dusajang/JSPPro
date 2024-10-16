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
    
  </xmp>
  
  정수 : <input type="text" id="num" autofocus="autofocus"> <br>
  <p id="demo"></p>
  // 숫자 n을 입력하고 enter치면 그 1~n까지의 총합을 구한다.
  // n이 숫자가 아니면 alert("숫자만 입력하세요") 유효성 검사까지



<script>
    $("#num")
      .css("text-align","center")
      .on({
         "keydown":function (e){
            if ( !(e.which >= 48 && e.which <= 57
                     || e.which == 8
                     || e.which == 13
                     || e.which == 229
                 )){
               alert("숫자만 입력하세요.");
               e.preventDefault();
            } // if
         },
         "keyup":function (event){
           if( event.which == 13){
              // alert("출력 처리...")
              $("#demo").empty();
              
              let n = $(this).val();
              let sum = 0;
              for (var i = 1; i <= n; i++) {
                 sum += i;
                $("#demo").html(function (index, oldhtml) {
                   return oldhtml + i + (i==n?"":"+");
                });
             }
              // =55
              $("#demo").html(function (index, oldhtml) {
                return oldhtml + "=" + sum ;
              })
             
              $(this).select();
              
           } // if
         }
      });
  </script>
  <script>
    /* $("#num").keypress(function(event) {
      if (event.which === 13) { // Enter key
        var n = parseInt($('#num').val());
        if (isNaN(n)) {
          alert("숫자만 입력하세요");
          $(this).val("").focus();
        } else {
          var sum = 0;
          for (var i = 1; i <= n; i++) {
            sum += i;
          }
          $("#demo").text(sum);
        }
      }
    }); */
  </script>

</div>
</body>
</html>