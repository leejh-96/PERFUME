<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinSuccess</title>
</head>
<body>
	<div style="margin: 100px;">
		<!-- 로고 넣을 거면 넣기 -->
		<%-- <a><img src="${pageContext.request.contextPath}/images/ms-logo.png"	style="height: 80px; margin-left: 10px;" /></a> <br> --%>
		<br>
		<h3>안녕하세요, ${param.m_id} 님</h3>
		<!-- 넘어오는 값의 name으로 값을 불러옴 -->
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br><a href="${ path }/">홈페이지로 이동하기</a>		
	</div>
	
</body>
</html>