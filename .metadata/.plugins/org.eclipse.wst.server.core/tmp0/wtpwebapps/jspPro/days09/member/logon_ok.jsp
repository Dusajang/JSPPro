<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	String passwd =  request.getParameter("passwd");
	
	// DB처리 : id, pwd 인증처리 + 권한   // admin 관리자 계정
	session.setAttribute("auth", id);   // new AuthInfo("admin", "이시훈", ?)
	
	// 메인페이지
	String location = "/jspPro/days09/ex01.jsp";
	
	String referer = (String) session.getAttribute("referer");
	if(referer != null){
		location = referer;
		session.removeAttribute("referer");
	}//if
	
	response.sendRedirect(location);
%>

