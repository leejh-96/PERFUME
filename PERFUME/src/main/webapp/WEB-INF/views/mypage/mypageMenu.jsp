<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<style>
	a:hover {
		color: #FF493C;
	}
</style>
<div class="col-3">
    <div class="col mb-4">
        <h3><a href="${path}/mypage?page=1"><b>마이페이지</b></a></h3>
    </div>
    <div class="col mb-4">
        <div>
            <h5><b>MY 쇼핑</b></h5>
        </div>
        <div>
            <a href="${path}/mypage/orderHistory">주문내역 조회</a>
        </div>
    </div>
    <div class="col mb-4">
        <div>
            <h5><b>MY 혜택</b></h5>
        </div>
        <div>
            <a href="${path}/mypage/pointHistory/all?page=1">포인트 내역</a>
        </div>
        <div>
            <a href="${path}/mypage/couponHistory/available?page=1">쿠폰 내역</a>
        </div>
    </div>
    <div class="col mb-4">
        <h5><b>MY 활동</b></h5>
        <div>
            <a href="${path}/mypage/myReview">내가 작성한 상품평</a>
        </div>
    </div>
    <div class="col">
        <h5><b>MY 정보</b></h5>
        <div>
            <a href="${path}/mypage/confirmPassword">회원정보변경</a>
        </div>
        <div>
            <a href="${path}/mypage/confirmPassword/changePassword">비밀번호변경</a>
        </div>
	    <div>
	 		<a href="${path}/mypage/manageAddress">배송지관리</a>
	    </div>
        <div>
            <a href="${path}/mypage/resignMember">회원탈퇴</a>
        </div>
    </div>
</div>