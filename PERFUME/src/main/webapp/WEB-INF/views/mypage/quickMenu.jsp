<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<div class="d-flex flex-row justify-content-evenly border border-2 rounded p-3 mb-3">
    <div class="d-flex flex-row align-items-center">
        <div class="me-2">
        </div>
        <div class="lh-sm" align="center">
            <div>
                <a href="${path}/mypage/confirmPassword/changeInfo" style="font-size: 20px">
                	<b>${memberDTO.name}님</b>
                </a>
            </div>
            <a href="${path}/mypage/membershipZone" class="btn btn-sm border" style="font-size: 10pt; padding:1px 8px 1px 8px">혜택보기</a>
        </div>
    </div>
    <a href="${path}/mypage/pointHistory/all?page=1" class="d-flex flex-column align-items-center align-self-center lh-sm">
    	<span>포인트</span>
       	<span><fmt:formatNumber value="${point}" />P</span>
    </a>
    <a href="${path}/mypage/couponHistory/available?page=1" class="d-flex flex-column align-items-center align-self-center lh-sm">
    	<span>쿠폰</span>
     	<span><fmt:formatNumber value="${couponCount}" />장</span>
    </a>
    <a href="${path}/mypage/writeableReview" class="d-flex flex-column align-items-center align-self-center lh-sm">
    	<span>작성 가능한 상품평</span>
      	<span><fmt:formatNumber value="${writeableCount}" />건</span>
    </a> 
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="${ path }/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>