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
<title>주문리스트</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/ecdfb9b41a.js"></script>
<style>
    *{
        /* border: 1px solid red; */
    }
    /* 주문완료페이지 css */
    #cart-wrap{
        background-color: rgb(246, 247, 242);
    }
    .ordercomplete-page{
        height: 3px;
        background-color: orangered;
    }
    #cart-sup{
    text-align: right;
    }
    .sequence{
    font-weight: bolder;
    font-size: xx-large;
    color: steelblue;
    }
    #plan-sale{
        color: aliceblue;
        background-color: thistle;
    }
    #save-sale{
        color: aliceblue;
        background-color: coral;
    }
    #coupon-sale{
        color: aliceblue;
        background-color: yellowgreen;
    }
    .ordercp-div{
        padding-top: 20px;
        padding-bottom: 20px;
        font-size: medium;
        font-weight: bolder;
        color: steelblue;
    }
    .media{
        padding-top: 10px;
        border-bottom: 1px solid violet;
    }
    .media-div{
        max-height: 600px;
        overflow-y: auto;
    }
    .ordercomplete-table{
        padding-top: 20px;
    }
    .ordercomplete-table>table{
        background-color: orangered;
        color: white;
        font-weight: bolder;
    }
    .media-components{
        padding-left: 10px;
    }
    .cart-shopping{
        text-align: center;
    }
    
    /* 주문완료페이지 css 끝 */
    </style>
    
</head>
<body>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>

<div id="cart-wrap" ><!-- 전체 div 시작 -->
    <div class="container"><!-- content div 시작 -->
        <div id="cart-sup">
            <span>01장바구니</span>
            <i class="fa-solid fa-angle-right"></i>
            <span>02주문서작성/결제</span>
            <i class="fa-solid fa-angle-right"></i>
            <span  class="sequence">03주문완료</span>
        </div>
        <p class=" ordercomplete-page"></p>

        <div class="row"><!-- 구역 나누는 div 시작 -->
            <!-- 왼쪽 content 시작 -->
            <div class="col-8">

                <h1>주문이 확인되었습니다.</h1>
                <div class="container ordercp-div">
	                <input id="memberNo" type="hidden" value="${order.memberNo}">
	                ${order.recipientName}님 저희 쇼핑몰을 이용해주셔서 감사합니다.<br>
	                정확한 배송 일정은 문의주시기 바랍니다.
                </div>
                <!-- 배송정보 -->
                <table class="table table-bordered">
                	<tr>
                        <th>주문번호</th>
                        <td>${order.orderNo}</td>
                    </tr>
                    <tr>
                    	<th>주문구분</th>
	                    <c:if test="${order.memberNo eq 0}">
	                    	<td>비회원결제</td>
	                    </c:if>
	                    <c:if test="${order.memberNo != 0}">
	                    	<td>[회원결제]</td>
	                    </c:if>
                    </tr>
                    <tr>
                        <th rowspan="4">배송정보</th>
                        <td>${order.recipientName}</td>
                    </tr>
                    <tr>
                        <td>${order.recipientAddr}</td>
                    </tr>
                    <tr>
                        <td>${order.orderPhone}</td>
                    </tr>
                    <tr>
                        <td>배송비 <span>${order.delivery}</span>원</td>
                    </tr>
                    <tr>
                        <th>배송메모</th>
                        <td>${order.memo}</td>
                    </tr>
                    <tr>
                        <th rowspan="3">할인/적립/쿠폰 사용내역</th>
                        <td>
                            <span id="plan-sale">기획전 할인금액 : <span>${order.discount}</span>원</span>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span id="save-sale">적립금 사용 : <span>${order.point}</span>point</span>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span id="coupon-sale">쿠폰 사용 할인 : <span>${order.coupon}</span>원</span>
                        </td>
                    </tr>
                    <tr>
                        <th rowspan="2">결제정보</th>
                        <td>${order.orderMethod}</td>
                    </tr>
                    <tr>
                        <td>최종상품결제금액 :  <span>${order.finalPrice}</span>원</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            구매혜택
                        </th>
                    </tr>
                    <tr>
                        <th colspan="2">
                            결제완료 후 결제금액의 5%의 적립금이 적립됩니다.
                        </th>
                    </tr>
                    <tr>
                        <th colspan="2">이번 결제 적립금 : <span>${plusPoint} POINT</span></th>
                    </tr>
                </table>
                <!-- 배송정보 끝 -->
            </div>
            <!-- 왼쪽 content 끝 -->
            <!-- 오른쪽 content 시작 -->
            <div class="col-4">
                <div class="col media-div">
                    <!-- 주문상품리스트 보여주기 -->
                    <c:forEach var="oList" items="${order.orderList}">
                    <div class="media">
                        <c:if test="${ empty oList}">
                        	등록된 사진이 없습니다.
                        </c:if>
                        <c:if test="${ not empty oList}">
                       		<img src="${path}/upload/product/${oList.orderFileName}" class="align-self-center rounded-circle" width="110px" height="110px">
                        </c:if>
                        <div class="media-body">
                            <a href="${path}/product/detail?no=${oList.productNo}">
                                <h4 class="media-components"><span>${oList.productBrand}-</span>${oList.productName}</h4>
                                <p class="media-components">${oList.productEng}</p>
                                <p class="media-components"><span>[${oList.orderSize}ml]</span> 주문수량 : <span>${oList.orderCount}</span>개</p>
                                <p class="media-components">상품금액 : <span>${oList.orderPrice}</span>원</p>
                                <p class="media-components">주문수량 : <span>${oList.orderCount}</span>개</p>
                            </a>
                        </div>
                    </div>
                    </c:forEach>
                    
                    <!-- 주문상품리스트 보여주기 끝 -->
                </div>
                <div class="col ordercomplete-table">
                    <!-- 주문상품정보 -->
                    <table class="table table-borderless table-sm">
                        <tr>
                            <td>배송비</td>
                            <td>+${order.delivery}원</td>
                        </tr>
                        <tr>
                            <td>할인금액</td>
                            <td>-<span>${order.discount}</span>원</td>
                        </tr>
                        <tr>
                            <td>적립금사용</td>
                            <td>-<span id="point">${order.point}</span>point</td>
                        </tr>
                        <tr>
                            <td>쿠폰할인</td>
                            <td>-<span>${order.coupon}</span>원</td>
                        </tr>
                        <tr>
                            <th>최종결제금액</th>
                            <td><span id="finalPrice">${order.finalPrice}</span>원</td>
                        </tr>
                    </table>
                    <!-- 주문상품정보 끝 -->
                </div>
            </div><!-- 오른쪽 content 끝 -->
        </div><!-- 구역 나누는 div 끝 -->
    </div><!-- content div 끝 -->
	<div class="container">
	   	<div class="row">
	   		<div class="col cart-shopping">
	               <button type="button" class="btn btn-primary" onclick="location.href='${path}/product/list'">
	                   <i class="fa-solid fa-less-than"></i>
	                       쇼핑 계속하기
	               </button>
	           </div>
	   	</div>
   	</div>
</div><!-- 전체 div 끝 -->

<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>
    
</body>
</html>