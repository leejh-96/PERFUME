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
    <title>Special</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ path }/css/planning/special.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    
	<div id="title">
		<h2>기획전</h2>
	</div>
	<div>
		<div id="special-content" class="special01">
			<div><a href="${ path }/planning/special01"><img src="${ path }/images/planning/special01.png"></a></div>
			<div class="text">
				<p>2023 봄 맞이 Floral 향수 특별 기획전</p>
				<p>청순하면서도 세련된 Floral 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2023.04.12 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special02">
			<div><a href="${ path }/planning/special02"><img src="${ path }/images/planning/special02.png"></a></div>
			<div class="text">
				<p>성년의 날 기념 Spicy 향수 3종 기획전</p>
				<p>자극적이고 톡톡 튀는 Spicy 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2022.04.24 ~ 2023.05.14</p>
			</div>
		</div>
		
		<div id="special-content" class="special03">
			<div><a href="${ path }/planning/special03"><img src="${ path }/images/planning/special03.png"></a></div>
			<div class="text">
				<p>기획전 3</p>
				<p>자극적이고 톡톡 튀는 Spicy 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special04">
			<div><a href="${ path }/planning/special04"><img src="${ path }/images/planning/special04.png"></a></div>
			<div class="text">
				<p>기획전 4</p>
				<p>자극적이고 톡톡 튀는 Spicy 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special05">
			<div><a href="${ path }/planning/special05"><img src="${ path }/images/planning/special05.png"></a></div>
			<div class="text">
				<p>기획전 5</p>
				<p>자극적이고 톡톡 튀는 Spicy 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special06">
			<div><a><img src="${ path }/images/planning/special06.png"></a></div>
			<div class="text">
				<p>기획전 6</p>
				<p>자극적이고 톡톡 튀는 Spicy 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2022.11.16 ~ 2023.03.31</p>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>