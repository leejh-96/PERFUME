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
				<p>봄맞이 특별 기획전</p>
				<p>살랑살랑, 봄맞이 특별 기획전을 진행합니다! 향긋한 플로럴 향수를 5% 할인된 금액에 구매하세요.</p>
				<p>2023.04.12 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special02">
			<div><a href="${ path }/planning/special02"><img src="${ path }/images/planning/special02.png"></a></div>
			<div class="text">
				<p>기획전 2</p>
				<p>기획전 2 디테일 내용</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special03">
			<div><a href="${ path }/planning/special03"><img src="${ path }/images/planning/special03.png"></a></div>
			<div class="text">
				<p>기획전 3</p>
				<p>기획전 3 디테일 내용</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special04">
			<div><a href="${ path }/planning/special04"><img src="${ path }/images/planning/special04.png"></a></div>
			<div class="text">
				<p>기획전 4</p>
				<p>기획전 4 디테일 내용</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special05">
			<div><a href="${ path }/planning/special05"><img src="${ path }/images/planning/special05.png"></a></div>
			<div class="text">
				<p>기획전 5</p>
				<p>기획전 5 디테일 내용</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
		
		<div id="special-content" class="special06">
			<div><a><img src="${ path }/images/planning/special06.png"></a></div>
			<div class="text">
				<p>기획전 6</p>
				<p>기획전 6 디테일 내용</p>
				<p>2022.11.16 ~ 2023.04.28</p>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
</body>
</html>