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
    <title>Perfume</title>
    <!-- CSS 불러오기 -->
    <link rel="stylesheet" href="${ path }/css/planning/main.css">
    <!-- jQuery 불러오기 -->
    <script src="${ path }/js/jquery-3.6.3.js"></script>
    
</head>
<body>
    <jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    <jsp:include page="/WEB-INF/views/planning/slider.jsp"/>
    
    <section id="main-content">
        <div id="article" class="article1">
            <div style="float:left;">
            	<h1 style="text-align: center;">NEW</h1>
            	<p style="text-align: center;">당신에게 어울리는 향을 아직 찾지 못하셨나요?<br><br>매일 입고되는 PERFUME의 새로운 향들,<br>PERFUME과 함께 당신에게 어울리는 향을<br>찾아나가는 여정을 떠나보아요.</p>
            </div>
            <div class="article-slider" style="float:right;">
                <div><a href="#"><img src="${ path }/images/planning/new001.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new002.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new003.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new004.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new005.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new006.png"></a></div>
            </div>
        </div>
        <div id="banner" class="banner1">
        	<div><a href="${ path }/planning/special01"><img src="${ path }/images/planning/banner001.png"></a></div>
        </div>
        <div id="article" class="article2">
        	<div style="height: 100px; display: flex; justify-content: center; align-items: center; background-color: #f8f7f2;">
			    <h1>BRAND</h1>
			</div>
  			<div style="text-align: center;">
    			<div class="article-slider" style="display: inline-block;">
      				<div><a href="#"><img src="${ path }/images/planning/new001.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/new002.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/new003.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/new004.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/new005.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/new006.png"></a></div>
    			</div>
  			</div>
		</div>
        <div id="banner" class="banner2">
        	<div><a href="${ path }/planning/special01"><img src="${ path }/images/planning/banner001.png"></a></div>
        </div>
        <div id="article" class="article3">
            <div class="article-slider" style="float:left;">
                <div><a href="#"><img src="${ path }/images/planning/new001.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new002.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new003.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new004.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new005.png"></a></div>
                <div><a href="#"><img src="${ path }/images/planning/new006.png"></a></div>
            </div>
            <div style="float:right;">
            	<h1 style="text-align: center;">BEST</h1>
            	<p style="text-align: center;">다른 사람들은 어떤 향을 제일 많이 찾을까요?<br><br>인기가 많은 향에는 '이유'가 존재합니다.<br>PERFUME에서 가장 잘 나가는 향수들 중<br>당신에게 꼭 맞는 향이 있을 수도 있습니다.</p>
            </div>
        </div>
        <div id="banner" class="banner3">
        	<div><a href="${ path }/planning/special01"><img src="${ path }/images/planning/banner001.png"></a></div>
        </div>
    </section>
    
    <script>
	</script>
    
    <jsp:include page="/WEB-INF/views/planning/footer.jsp"/>