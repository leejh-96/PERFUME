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
	<title>2023 봄 맞이 Floral 향수 특별 기획전</title>
	<link rel="stylesheet" href="${ path }/css/planning/special.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    
	<div id="title">
		<h2>2023 봄 맞이 Floral 향수 특별 기획전</h2>
		<p style="text-align: center;">청순하면서도 세련된 Floral 향수를 5% 할인된 금액에 구매하세요.</p>
	</div>
	
	<div id="product">
	<div class="pd1">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/floral01.jpg"></a></div>
			<div class="product-text">
				<p><strong>메종마르지엘라 플라워마켓</strong></p>
				<p style="text-decoration:line-through;">정가 : 147,800원</p>
				<p style="color:red;"><strong>특가 : 140,410원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd2">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/floral02.jpg"></a></div>
			<div class="product-text">
				<p><strong>구찌 블룸 오 드 퍼퓸</strong></p>
				<p style="text-decoration:line-through;">정가 : 80,000원</p>
				<p style="color:red;"><strong>특가 : 76,000원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd3">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/floral03.jpg"></a></div>
			<div class="product-text">
				<p><strong>디올 포에버 앤 에버 오 드 뚜왈렛</strong></p>
				<p style="text-decoration:line-through;">정가 : 123,000원</p>
				<p style="color:red;"><strong>특가 : 116,850원</strong></p>
			</div>
		</div>
	</div>
</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>