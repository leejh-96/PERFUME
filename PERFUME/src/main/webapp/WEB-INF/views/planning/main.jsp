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
            <div style="float:left;">NEW</div>
            <div class="slick-slider" style="float:right;">
                <div>Slide 1</div>
                <div>Slide 2</div>
                <div>Slide 3</div>
                <div>Slide 4</div>
            </div>
        </div>
        <div id="banner" class="banner1">
        </div>
        <div id="article" class="article2">
            <div style="text-align: center; margin-bottom: 20px;">BRAND</div>
            <div class="slick-slider" style="float:center;">
                <div>Slide 1</div>
                <div>Slide 2</div>
                <div>Slide 3</div>
                <div>Slide 4</div>
            </div>
        </div>
        <div id="banner" class="banner2">
        </div>
        <div id="article" class="article3">
            <div style="float:right;">BEST</div>
            <div class="slick-slider" style="float:left;">
                <div>Slide 1</div>
                <div>Slide 2</div>
                <div>Slide 3</div>
                <div>Slide 4</div>
            </div>
        </div>
        <div id="banner" class="banner3">
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/planning/footer.jsp"/>