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
    <title>NAEUM</title>
    <!-- CSS 불러오기 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
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
            	<p style="text-align: center;">당신에게 어울리는 향을 아직 찾지 못하셨나요?<br><br>매일 입고되는 NAEUM의 새로운 향들,<br>NAEUM과 함께 당신에게 어울리는 향을<br>찾아나가는 여정을 떠나보아요.</p>
            </div>
            <div id="article-slider" class="article-slider1" style="float:right;">
                <div><a href="${ path }/product/detail?no=7"><img src="${ path }/upload/product/PERFUME19-1.jpg"></a></div>
                <div><a href="${ path }/product/detail?no=14"><img src="${ path }/upload/product/PERFUME4-1.jpg"></a></div>
                <div><a href="${ path }/product/detail?no=9"><img src="${ path }/upload/product/PERFUME15-1.jpg"></a></div>
                <div><a href="${ path }/product/detail?no=20"><img src="${ path }/upload/product/PERFUME20-1.jpg"></a></div>
                <div><a href="${ path }/product/detail?no=2"><img src="${ path }/upload/product/PERFUME7-1.jpg"></a></div>
                <div><a href="${ path }/product/detail?no=13"><img src="${ path }/upload/product/PERFUME5-1.jpg"></a></div>
            </div>
    		<button class="next-slide1">다음</button>
        </div>
        <div id="banner" class="banner1">
        	<div><a href="${ path }/planning/special01"><img src="${ path }/images/planning/banner001.png"></a></div>
        </div>
        <div id="article" class="article2">
        	<div>
			    <h1>BRAND</h1>
			</div>
  			<div style="text-align: center;">
    			<div id="article-slider" class="article-slider2" style="display: flex;">
      				<div><a href="#"><img src="${ path }/images/planning/brand001.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/brand002.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/brand003.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/brand004.png"></a></div>
      				<div><a href="#"><img src="${ path }/images/planning/brand005.png"></a></div>
    			</div>
    			<div class="slider-buttons">
		            <button class="prev-slide2">&lt;</button>
		            <button class="next-slide2">&gt;</button>
		        </div>
  			</div>
		</div>
        <div id="banner" class="banner2">
        	<div><a href="${ path }/event/eventView?no=141"><img src="${ path }/images/planning/banner002.png"></a></div>
        </div>
        <div id="article" class="article3">
		    <div id="article-slider" class="article-slider3" style="float:left;">
		        <div><a href="${ path }/product/detail?no=28"><img src="${ path }/upload/product/PERFUME25-1.jpg"></a></div>
		        <div><a href="${ path }/product/detail?no=17"><img src="${ path }/upload/product/PERFUME9-1.jpg"></a></div>
		        <div><a href="${ path }/product/detail?no=12"><img src="${ path }/upload/product/PERFUME3-1.jpg"></a></div>
		        <div><a href="${ path }/product/detail?no=11"><img src="${ path }/upload/product/PERFUME13-1.jpg"></a></div>
		        <div><a href="${ path }/product/detail?no=5"><img src="${ path }/upload/product/PERFUME8-1.jpg"></a></div>
		        <div><a href="${ path }/product/detail?no=21"><img src="${ path }/upload/product/PERFUME21-1.jpg"></a></div>
		    </div>
		    <button class="next-slide3">다음</button>
		    <div style="float:right;">
		        <h1 style="text-align: center;">SALE</h1>
		        <p style="text-align: center;">현재 할인하고 있는 향수는 무엇일까요?<br><br>NAEUM에서 진행하는 특별 기획전!<br>잘 나가는 향수들 중에서도<br>5% 할인된 특가를 누려보세요.</p>
		    </div>
		</div>
    </section>
    
    <script>
	 // NEW 슬라이드
	    var slideIndex1 = 0;
	    var slides1 = document.querySelectorAll(".article-slider1 div");
	    var nextBtn1 = document.querySelector(".next-slide1");
	
	    showSlides();
	
	    function showSlides() {
	        var i;
	        for (i = 0; i < slides1.length; i++) {
	            slides1[i].style.display = "none";
	        }
	        for (i = slideIndex1; i < slideIndex1 + 4; i++) {
	            var j = i;
	            if (j >= slides1.length) {
	                j = j - slides1.length;
	            }
	            slides1[j].style.display = "block";
	        }
	    }
	
	    nextBtn1.addEventListener("click", function () {
	        slideIndex1 += 1;
	        if (slideIndex1 >= slides1.length) {
	            slideIndex1 = 0;
	        }
	        showSlides();
	    });
	    
	 // BRAND 슬라이드
	    var slideIndex2 = 0;
	    var slides2 = document.querySelectorAll(".article-slider2 div");
	    var prevBtn2 = document.querySelector(".prev-slide2");
	    var nextBtn2 = document.querySelector(".next-slide2");

	    showSlides2();

	    function showSlides2() {
	        var i;
	        for (i = 0; i < slides2.length; i++) {
	            slides2[i].style.display = "none";
	        }
	        for (i = slideIndex2; i < slideIndex2 + 4; i++) {
	            var j = i;
	            if (j >= slides2.length) {
	                j = j - slides2.length;
	            }
	            slides2[j].style.display = "block";
	        }
	    }

	    nextBtn2.addEventListener("click", function () {
	        slideIndex2 += 1;
	        if (slideIndex2 >= slides2.length) {
	            slideIndex2 = 0;
	        }
	        showSlides2();
	    });

	    prevBtn2.addEventListener("click", function () {
	        slideIndex2 -= 1;
	        if (slideIndex2 < 0) {
	            slideIndex2 = slides2.length - 1;
	        }
	        showSlides2();
	    });

	    
	 // BEST 슬라이드
	    var slideIndex3 = 0;
	    var slides3 = document.querySelectorAll(".article-slider3 div");
	    var nextBtn3 = document.querySelector(".next-slide3");
	
	    showSlides3();
	
	    function showSlides3() {
	        var i;
	        for (i = 0; i < slides3.length; i++) {
	            slides3[i].style.display = "none";
	        }
	        for (i = slideIndex3; i < slideIndex3 + 4; i++) {
	            var j = i;
	            if (j >= slides3.length) {
	                j = j - slides3.length;
	            }
	            slides3[j].style.display = "block";
	        }
	    }
	
	    nextBtn3.addEventListener("click", function () {
	        slideIndex3 += 1;
	        if (slideIndex3 >= slides3.length) {
	            slideIndex3 = 0;
	        }
	        showSlides3();
	    });


	</script>
    
    <jsp:include page="/WEB-INF/views/planning/footer.jsp"/>