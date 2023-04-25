<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지-home</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">
/* 관리자페이지-home */

*{
	border: 1px solid red;
}
.adminhomediv{
	height: calc(100%/6);
}



/* 관리자페이지-home */
</style> 
</head>
<body>

<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>
	
	
		<div class="row adminhomediv">1
		
		
		</div>
		<div class="row adminhomediv">
			<p>총 회원수 : <span></span> </p>
			<p>회원가입 경로 <span>perfume : </span> <span>kakao : </span> <span>naver : </span> </p>
			<p>비율 : <span>남성 : </span> <span>여성 : </span> </p>		
		</div>
		<div class="row adminhomediv">3
		
		
		</div>
		<div class="row adminhomediv">4
		
		
		</div>
		<div class="row adminhomediv">5
		
		
		</div>
		<div class="row adminhomediv">6
		
		
		</div>
		
		
	
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>


</body>
</html>