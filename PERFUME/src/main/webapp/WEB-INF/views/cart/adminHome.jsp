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





/* 관리자페이지-home */
</style> 
</head>
<body>

<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>
	
	<h1>관리자페이지 HOME</h1>
	
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>


</body>
</html>