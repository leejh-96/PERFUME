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
	<title>봄맞이 플로럴 향수 기획전</title>
	<link rel="stylesheet" href="${ path }/css/planning/special.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    
	<div id="title">
		<h2>봄맞이 플로럴 향수 기획전</h2>
		<p style="text-align: center;">4월 30일까지 봄꽃내음을 연상시키는 플로럴 향수를 5% 할인된 특가에 만나보세요.</p>
	</div>
	
	<div id="product">
	<div class="pd1">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/new001.png"></a></div>
			<div class="product-text">
				<p>구찌 플로럴 뭐시기</p>
				<p>100,000원</p>
				<p>특가 : 95,000원</p>
			</div>
		</div>
	</div>
	
	<div class="pd2">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/new002.png"></a></div>
			<div class="product-text">
				<p>샤넬 플로럴 뭐시기</p>
				<p>150,000원</p>
				<p>특가 : 142,500원</p>
			</div>
		</div>
	</div>
	
	<div class="pd3">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/new003.png"></a></div>
			<div class="product-text">
				<p>크리드 플로럴 뭐시기</p>
				<p>130,000원</p>
				<p>특가 : 123,500원</p>
			</div>
		</div>
	</div>
</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>