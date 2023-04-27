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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
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
			<div class="product-img"><a href="${ path }/product/detail?no=28"><img src="${ path }/upload/product/PERFUME25-1.jpg"></a></div>
			<div class="product-text">
				<p><strong>로즈 페탈 25 오 드 뚜왈렛</strong></p>
				<p style="text-decoration:line-through;">정가 : 259,000원</p>
				<p style="color:red;"><strong>특가 : 246,050
원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd2">
		<div class="product-info">
			<div class="product-img"><a href="${ path }/product/detail?no=17"><img src="${ path }/upload/product/PERFUME9-1.jpg"></a></div>
			<div class="product-text">
				<p><strong>우모 오 드 뚜왈렛</strong></p>
				<p style="text-decoration:line-through;">정가 : 100,000원</p>
				<p style="color:red;"><strong>특가 : 95,000원</strong></p>
			</div>
		</div>
	</div>
	
	<div class="pd3">
		<div class="product-info">
			<div class="product-img"><a href="${ path }/product/detail?no=12"><img src="${ path }/upload/product/PERFUME3-1.jpg"></a></div>
			<div class="product-text">
				<p><strong>앤쏠로지램프하트리스</strong></p>
				<p style="text-decoration:line-through;">정가 : 54,000원</p>
				<p style="color:red;"><strong>특가 : 51,300
원</strong></p>
			</div>
		</div>
	</div>
</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>