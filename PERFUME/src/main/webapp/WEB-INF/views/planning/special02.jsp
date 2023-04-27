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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
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
			<div class="product-img"><a href="${ path }/product/detail?no=11"><img src="${ path }/upload/product/PERFUME13-1.jpg"></a></div>
			<div class="product-text">
				<p><strong>알뤼르 오 드 빠르펭</strong></p>
				<p style="text-decoration:line-through;">정가 : 255,000원</p>
				<p style="color:red;"><strong>특가 : 242,250
원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd2">
		<div class="product-info">
			<div class="product-img"><a href="${ path }/product/detail?no=5"><img src="${ path }/upload/product/PERFUME8-1.jpg"></a></div>
			<div class="product-text">
				<p><strong>보체 비바 오 드 퍼퓸</strong></p>
				<p style="text-decoration:line-through;">정가 : 90,000원</p>
				<p style="color:red;"><strong>특가 : 85,500원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd3">
		<div class="product-info">
			<div class="product-img"><a href="${ path }/product/detail?no=21"><img src="${ path }/upload/product/PERFUME21-1.jpg"></a></div>
			<div class="product-text">
				<p><strong>캔디 플로럴 오 드 뚜왈렛</strong></p>
				<p style="text-decoration:line-through;">정가 : 87,500원</p>
				<p style="color:red;"><strong>특가 : 83,125원</strong></p>
			</div>
		</div>
	</div>
</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>