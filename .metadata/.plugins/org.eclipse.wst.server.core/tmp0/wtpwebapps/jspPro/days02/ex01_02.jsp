<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   String sql = " SELECT * "
            + " FROM dept";
   ResultSet rs = null;
   int deptno;
   String dname, loc;
   DeptVO vo = null;
   ArrayList<DeptVO> list = null;
   Iterator<DeptVO> ir = null;
   
   try{
      conn = DBConn.getConnection();
      //System.out.println("conn은 " +conn);
      //System.out.println("닫혀있나 " + conn.isClosed());
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if( rs.next() ){
         list = new ArrayList<>();
         do{
            
            deptno = rs.getInt("deptno");
            dname = rs.getString("dname");
            loc = rs.getString("loc");
            
            vo = new DeptVO().builder().deptno(deptno).dname(dname).loc(loc).build();
            list.add(vo);
         }while(rs.next());
      }
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      try{
         pstmt.close();
         DBConn.close();
      }catch(Exception e){
         e.printStackTrace();
      }
      
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>


 <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
  
   <script>
  $( function() {
    $( "#dept :checkbox" ).checkboxradio();
  } );
  </script>
  
  <style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }  
</style>
  
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">Seeker Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
 <xmp class="code">
    
  </xmp>
<h2>Checkbox</h2>

<!-- <form action="ex01_emp_02.jsp" method="get"> -->

<fieldset id="dept">
  <legend>dept check : </legend>
  <!-- <label for="deptno-부서번호">부서명/label>
  <input type="checkbox" name="deptno" id="deptno-부서번호" value="부서번호">
  
  <label for="checkbox-2">3 Star</label>
  <input type="checkbox" name="checkbox-2" id="checkbox-2">
  
  <label for="checkbox-3">4 Star</label>
  <input type="checkbox" name="checkbox-3" id="checkbox-3">
  
  <label for="checkbox-4">5 Star</label>
  <input type="checkbox" name="checkbox-4" id="checkbox-4"> -->
  <%
    ir = list.iterator();
    while(ir.hasNext()){
       vo = ir.next();
       deptno = vo.getDeptno();
       dname = vo.getDname();
 %>
    <label for="deptno-<%= deptno %>"><%= dname %></label>
     <input type="checkbox" name="deptno" id="deptno-<%= deptno %>" value="<%= deptno %>">
<%      
    }//while
%>
</fieldset>

<!-- 지금은 폼태그 안 묶어 location.href 사용 한다 -->
 <input type="button" value="사원 확인">
 
<!-- <input type="submit" value="사원 확인"> -->

<!-- </form> -->
<script>
   // ex01_emp_02.jsp?deptno=20
         $(":button[value='사원 확인']").on("click", function (event) {
           if ($(":checkbox[name=deptno]:checked").length == 0) {
              alert("부서를 체크 하시오");
              return;
           }
           
           // href 속성을 만드는게 목적이다.
           
           // 2번째 방법
           const deptnoArr = []; //3
           $(":checkbox[name=deptno]:checked").each(function (index, element) {
              let deptno = element.value;
              deptnoArr.push(`deptno=\${deptno}`) // 2 4
           })
           location.href = `ex01_emp_02.jsp?\${deptnoArr.join('&')}` // 5
           
         }); 
         
           // 1번째 방법
           /* 
           let hrefValue = "ex01_emp_02.jsp?" //2
           
           $(":checkbox[name=deptno]:checked").each(function (index, element) {
              let deptno = element.value;
              hrefValue += `deptno=\${deptno}&` //3
           })
           
           location.hret = `hrefValue; // 4
           */

      
        
</script>
    
</div> 
</body>
</html>