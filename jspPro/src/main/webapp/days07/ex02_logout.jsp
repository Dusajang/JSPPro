<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cname = "auth";
	String logonId = null;
	
	Cookies cookies = new Cookies(request);
	if(cookies.exists(cname)){
		logonId = cookies.getValue(cname);
		// 쿠키 삭제
		Cookie c = Cookies.createCookie("auth", "", "/", 0);
	    response.addCookie(c);
	}//if
%>
<script>
   alert("<%= logonId%> 로그아웃!!");
   location.href = "ex02_default.jsp";
</script>