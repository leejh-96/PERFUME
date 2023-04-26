<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <title>아이디 찾기 결과</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
	<h2>아이디 찾기 결과</h2>
		<c:if test="${ id != null }">
		    <p>찾으시는 아이디는 <span style="color:red;">${id}</span> 입니다.</p>
		</c:if>

		<c:if test="${ id == null }">
		    <p>해당하는 아이디가 없습니다. 다시 시도해주세요.</p>
		    <p><a href="${path}/planning/findId">아이디 찾기 화면으로 돌아가기</a></p>
		</c:if>
</body>
</html>