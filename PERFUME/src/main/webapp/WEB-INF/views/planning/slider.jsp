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
    <link rel="stylesheet" href="${ path }/css/planning/slider.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- jQuery 불러오기 -->
    <script src="${ path }/js/jquery-3.6.3.js"></script>
	<!-- 부트스트랩 자바스크립트 불러오기 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</head>
<section class="slider">
	  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	    <!-- 인디케이터 -->
	    <ol class="carousel-indicators">
	      <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
	      <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
	      <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
	    </ol>
	
	    <!-- 슬라이드 이미지 -->
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	        <c:if test="${ empty loginMember }">
				<a href="${ path }/join">
					<img src="${ path }/images/planning/slider001.png" class="d-block w-100" alt="Slider Image 1">
				</a>
			</c:if>

			<c:if test="${not empty loginMember}">
    			<img src="${path}/images/planning/slider001.png" class="d-block w-100" alt="Slider Image 1" onclick="showCouponMessage()">
			</c:if>

			<script>
				function showCouponMessage() {
				    alert("이미 5% 할인 쿠폰을 발급받으셨습니다. 마이페이지에서 쿠폰 내역을 확인해보세요.");
				    window.location.href = "${path}/mypage";
				}
			</script>
	      </div>
	      <div class="carousel-item">
	        <a href="${ path }/planning/special01">
	          <img src="${ path }/images/planning/slider002.png" class="d-block w-100" alt="Slider Image 2">
	        </a>
	      </div>
	      <div class="carousel-item">
	        <a href="${ path }/planning/special02">
	          <img src="${ path }/images/planning/slider003.png" class="d-block w-100" alt="Slider Image 3">
	        </a>
	      </div>
	    </div>
	
	    <!-- 이전, 다음 버튼 -->
	    <button class="carousel-control-prev border-0" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">이전</span>
		</button>
		<button class="carousel-control-next border-0" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">다음</span>
		</button>
	  </div>
	</section>

	<script>
		// 부트스트랩 캐러샐 슬라이드 구현
	    $(document).ready(function(){
		    $('#myCarousel').carousel();
		});
	    
	    $('.carousel-indicators li').click(function(){
	        var goToSlide = $(this).data('slide-to');
	        $('#myCarousel').carousel(goToSlide);
	    });
	    
	    // 캐러셀 객체 생성
		$('.carousel').carousel({
			interval: 4000, // 이미지 전환 시간(ms)
		    pause: "hover", // 마우스 호버 시 멈춤 여부
		    wrap: true // 무한 루프 여부
		})
	</script>

</body>
</html>