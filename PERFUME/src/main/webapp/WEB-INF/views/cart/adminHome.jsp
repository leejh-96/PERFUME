<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지-home</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="${ path }/js/jquery.fade-in.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>
		<section>
			<div id="carouselExampleInterval" class="row carousel slide" data-ride="carousel">
                <div class="col  carousel-inner">
                    <div class="carousel-item active" data-interval="1500">
                    	<img class="img fade-in d-block w-100 img-carousel" width="100%" height="1000px" src="${ path }/images/aboutSite/001.png">
                    </div>
                    <div class="carousel-item " data-interval="1500">
                    	<img class="img fade-in d-block w-100 img-carousel" width="100%" height="1000px" src="${ path }/images/aboutSite/002.png">
                    </div>
                    <div class="carousel-item " data-interval="1500">
                    	<img class="img fade-in d-block w-100 img-carousel" width="100%" height="1000px" src="${ path }/images/aboutSite/003.png">
                    </div>
                    <button class="carousel-control-prev" type="button" data-target="#carouselExampleInterval" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">이전</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-target="#carouselExampleInterval" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">다음</span>
                    </button>
                </div>
            </div>
		</section>
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>
</body>
</html>