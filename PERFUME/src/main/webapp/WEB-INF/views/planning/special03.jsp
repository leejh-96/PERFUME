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
	<title>기획전 3</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${ path }/css/planning/special.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    
	<div id="title">
		<h2>기획전 3</h2>
		<p style="text-align: center;">기획전 3에 대한 설명</p>
	</div>
	
	<div id="product">
	<div class="pd1">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/new001.png"></a></div>
			<div class="product-text">
				<p><strong>구찌 플로럴 뭐시기</strong></p>
				<p style="text-decoration:line-through;">정가 : 100,000원</p>
				<p style="color:red;"><strong>특가 : 95,000원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd2">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/new002.png"></a></div>
			<div class="product-text">
				<p><strong>샤넬 플로럴 뭐시기</strong></p>
				<p style="text-decoration:line-through;">정가 : 150,000원</p>
				<p style="color:red;"><strong>특가 : 142,500원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd3">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/new003.png"></a></div>
			<div class="product-text">
				<p><strong>크리드 플로럴 뭐시기</strong></p>
				<p style="text-decoration:line-through;">정가 : 130,000원</p>
				<p style="color:red;"><strong>특가 : 123,500원</strong></p>
			</div>
		</div>
	</div>
</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>