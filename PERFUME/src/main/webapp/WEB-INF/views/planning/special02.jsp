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
	<title>성년의 날 기념 Spicy 향수 3종 기획전</title>
	<link rel="stylesheet" href="${ path }/css/planning/special.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    
	<div id="title">
		<h2>성년의 날 기념 Spicy 향수 3종 기획전</h2>
		<p style="text-align: center;">자극적이고 톡톡 튀는 Spicy 향수를 5% 할인된 금액에 구매하세요.</p>
	</div>
	
	<div id="product">
	<div class="pd1">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/spicy01.jpg"></a></div>
			<div class="product-text">
				<p><strong>딥디크 도손 오 드 퍼퓸</strong></p>
				<p style="text-decoration:line-through;">정가 : 215,800원</p>
				<p style="color:red;"><strong>특가 : 205,010원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd2">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/spicy02.jpg"></a></div>
			<div class="product-text">
				<p><strong>발렌티노 우모 오 드 뚜왈렛</strong></p>
				<p style="text-decoration:line-through;">정가 : 100,000원</p>
				<p style="color:red;"><strong>특가 : 95,000원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd3">
		<div class="product-info">
			<div class="product-img"><a><img src="${ path }/images/planning/spicy03.jpg"></a></div>
			<div class="product-text">
				<p><strong>톰포드 블랙 오키드 오 드 퍼퓸</strong></p>
				<p style="text-decoration:line-through;">정가 : 160,000원</p>
				<p style="color:red;"><strong>특가 : 152,000원</strong></p>
			</div>
		</div>
	</div>
</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>