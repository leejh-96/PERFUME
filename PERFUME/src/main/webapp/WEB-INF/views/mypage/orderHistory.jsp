<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<title>주문 내역 조회</title>
    <!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- bootstrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<style>
        a {
            text-decoration: none;
        }
        a:link {
            color: black;
        }
        a:visited {
            color: black;
        }
        .orderHistoryImg {
            width: 100%;
            height: 100%;
        }
        table {
        	table-layout: fixed;
        	word-break: break-all;
        }
    </style>
    <style>
	<%@ include file="/resources/css/mypage/myreview.css" %>
	</style>
</head>
<body>
	<%@ include file="../planning/header.jsp" %>
	<div class="container mt-5" style="min-width: 1200px">
		<div class="row">
			<%@ include file="mypageMenu.jsp" %>
            <div class="col">
                <%@ include file="quickMenu.jsp" %>
                <div>
                    <h5><b>주문내역</b></h5>
                </div>
                <c:if test="${receiptHistory.size() < 1}">
					<div style="text-align: center;">
						<img class="no-review-img" src="https://image.hmall.com/p/img/co/icon/ico-nodata-type12-1x.svg" />
					   	<h5 class="no_result" style="margin-top: 0px;">조회 내역이 없습니다.</h5>
			   		</div>
		         </c:if>
				<c:forEach var="receiptDTO" items="${receiptHistory}">
					<!-- 결제 forEach 시작 -->
					<input type="hidden" id="impUid${receiptDTO.receiptId}" value="${receiptDTO.impUid}" />
					<div class="col border border-2 rounded p-4 mb-3">
	                    <div class="d-flex flex-row">
	                        <div class="col">
	                            <h5><b><fmt:formatDate pattern="yyyy-MM-dd" value="${receiptDTO.orderDate}" /></b></h5>
	                            <div class="d-flex justify-content-between mb-2">
		                        	<span>결제번호 : ${fn:split(receiptDTO.impUid,'_')[1]}</span>
		                        	<span><a href="${contextPath}/mypage/orderHistory/${receiptDTO.receiptId}">주문 상세보기</a></span>
		                        </div>
	                        </div>
	                    </div>
	                    <div class="border border-1 rounded">
	                        <table>
	                            <tbody>
		                    		<c:forEach var="orderDTO" items="${receiptDTO.orderList}" varStatus="status">
	                            		<!-- 주문 forEach 시작 -->
	                            		<input type="hidden" id="price${orderDTO.orderId}" value="${orderDTO.price}"/>
	                            		<input type="hidden" id="count${orderDTO.orderId}" value="${orderDTO.count}"/>
		                                <tr>
		                                    <td class="col-1 p-3 border-bottom">
		                                    	<a href="${path}/category/1/${orderDTO.categoryId}/detail/${orderDTO.productId}">
		                                        	<img class="orderHistoryImg" src="${orderDTO.image}" style="width:100px; height:100px;">
		                                        </a>
		                                    </td>
		                                    <td class="col-5 border-end border-bottom">
		                                    	<a href="${path}/category/1/${orderDTO.categoryId}/detail/${orderDTO.productId}" class="text-truncate">
		                                    		<span class="d-inline-block text-truncate" style="max-width: 300px;">
		                                    			<b>${orderDTO.pname}</b>
		                                    		</span>
		                                    		<br>
		                                    		<span class="d-inline-block text-truncate" style="max-width: 300px;">
		                                    			옵션 : ${orderDTO.cname}
		                                    		</span>
		                                    	</a>
		                                    </td>
		                                    <td class="border-end border-bottom">
		                                        <div class="col m-auto" style="width: 100px; text-align: center;">
		                                            <div>
		                                                <fmt:formatNumber value="${orderDTO.price}" />원
		                                            </div>
		                                            <div>
		                                                (${orderDTO.count}개)
		                                            </div>
		                                        </div>
		                                    </td>
		                                    <c:choose>
		                                    	<c:when test="${receiptDTO.couponDiscount > 0 || receiptDTO.usagePoint > 0 || orderDTO.status == 'V'}">
		                                    		<c:if test="${status.first}">
				                                    	<td rowspan="${receiptDTO.orderList.size()}" align="center">
				                                    		<c:choose>
				                                    			<c:when test="${orderDTO.status eq 'N'}">
					                                        		<div>
						                                                <h5><b>주문 완료</b></h5>
						                                            </div>
						                                            <div class="mb-2">
						                                                <button type="button" class="btn btn-sm btn-outline-dark" onclick="configAllBtn(${receiptDTO.receiptId})">구매확정</button>
						                                            </div>
						                                            <div class="mt-2">
						                                                <button type="button" class="btn btn-sm btn-outline-dark" onclick="cancelAllBtn(${receiptDTO.receiptId}, ${receiptDTO.totalPrice }, ${receiptDTO.membershipDiscount}, ${receiptDTO.couponDiscount}, ${receiptDTO.usagePoint})">주문취소</button>
						                                            </div>
				                                        		</c:when>
				                                        		<c:when test="${orderDTO.status eq 'F'}">
				                                        			<div>
						                                                <h5><b>구매 완료</b></h5>
						                                            </div>
				                                        		</c:when>
				                                        		<c:when test="${orderDTO.status eq 'V'}">
				                                        			<div>
						                                                <h5><b>입금 예정</b></h5>
						                                            </div>
				                                        		</c:when>
				                                        		<c:otherwise>
				                                        			<div>
						                                                <h5><b>취소 완료</b></h5>
						                                            </div>
				                                        		</c:otherwise>
				                                    		</c:choose>
				                                    	</td>
				                                    </c:if>
		                                    	</c:when>
		                                    	<c:otherwise>
			                                    	<td class="border-bottom">
				                                        <div class="col" align="center">
				                                        	<c:choose>
				                                        		<c:when test="${orderDTO.status eq 'N'}">
					                                        		<div>
						                                                <h5><b>주문 완료</b></h5>
						                                            </div>
						                                            <div class="mb-2">
						                                                <button type="button" class="btn btn-sm btn-outline-dark" onclick="configBtn(${orderDTO.orderId})">구매확정</button>
						                                            </div>
						                                            
						                                            <div class="mt-2">
						                                                <button type="button" class="btn btn-sm btn-outline-dark" onclick="cancelBtn(${receiptDTO.receiptId}, ${orderDTO.orderId}, ${receiptDTO.membershipDiscount}, ${receiptDTO.couponDiscount}, ${receiptDTO.usagePoint})">주문취소</button>
						                                            </div>
				                                        		</c:when>
				                                        		<c:when test="${orderDTO.status eq 'F'}">
						                                            <div>
						                                                <h5><b>구매 완료</b></h5>
						                                            </div>
				                                        		</c:when>
				                                        		<c:when test="${orderDTO.status eq 'V'}">
				                                        			<div>
						                                                <h5><b>입금 예정</b></h5>
						                                            </div>
				                                        		</c:when>
				                                        		<c:otherwise>
				                                        			<div>
						                                                <h5><b>취소 완료</b></h5>
						                                            </div>
				                                        		</c:otherwise>
				                                        	</c:choose>
				                                        </div>
				                                    </td>
			                                    </c:otherwise>
		                                    </c:choose>
		                                </tr>
		                                <!-- 주문 forEach 종료 -->
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <!-- 결제 forEach 종료 -->
				</c:forEach>
				<ul class="pagination justify-content-center">
                	<c:if test="${startPage ne 1}">
                		<li class="page-item">
                			<a class="page-link" href="${path}/mypage/orderHistory?page=${startPage-1}" aria-label="Previous">
	                			<span aria-hidden="true">&laquo;</span>
	                		</a>
                		</li>
                	</c:if>
                	<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                		<c:choose>
                			<c:when test="${page == pageNum}">
                				<li class="page-item active">
                					<p class="page-link">${pageNum}</p>
                				</li>
                			</c:when>
                			<c:otherwise>
                				<li class="page-item">
                					<a class="page-link" href="${path}/mypage/orderHistory?page=${pageNum}">
                						${pageNum}
                					</a>
                				</li>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	<c:if test="${endPage ne pageCount}">
                		<li class="page-item">
                			<a class="page-link" href="${path}/mypage/orderHistory?page=${endPage+1}" aria-label="Next">
					    		<span aria-hidden="true">&raquo;</span>
					    	</a>
                		</li>
                	</c:if>
                </ul>
            </div>
        </div>
    </div>
   	<%@ include file="../planning/footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/dist/jquery.js' />"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  console.log("${receiptHistory}");
	});
	function configBtn(orderId) {
		if(confirm("구매확정 하시겠습니까?")) {
			let token = $("meta[name='_csrf']").attr("content");
		    let header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url : "${path}/mypage/orderHistory/updateOrderStatus",
				type : "POST",
				data : {
					orderId : orderId,
					status : 'F'
				},
				beforeSend : function(xhr) {
		            xhr.setRequestHeader(header, token);
	            },
				success:function(result) {
					if(result==1) {
						window.location.href = "${path}/mypage/orderHistory";
					} else {
						alert('구매확정 오류');
					}
				},
				error:function(xhr, status, error) {
    				var errorResponse = JSON.parse(xhr.responseText);
    				var errorCode = errorResponse.code;
    				var message = errorResponse.message;
    				alert(message);
    			}
			});
		}
	}
	function configAllBtn(receiptId) {
		if(confirm("구매확정 하시겠습니까?")) {
			let token = $("meta[name='_csrf']").attr("content");
		    let header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url : "${path}/mypage/orderHistory/updateAllOrderStatus",
				type : "POST",
				data : {
				  	receiptId : receiptId,
					status : 'F'
				},
				beforeSend : function(xhr) {
		            xhr.setRequestHeader(header, token);
	            },
				success:function(result) {
					if(result==1) {
						window.location.href = "${path}/mypage/orderHistory";
					} else {
						alert('구매확정 오류');
					}
				},
				error:function(xhr, status, error) {
    				var errorResponse = JSON.parse(xhr.responseText);
    				var errorCode = errorResponse.code;
    				var message = errorResponse.message;
    				alert(message);
    			}
			});
		}
	}
	function cancelPay(receiptId, orderId, membershipDiscount) {
	  	let token = $("meta[name='_csrf']").attr("content");
    	let header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			url : "${path}/mypage/api/payment/cancel",
			type : "POST",
			data : {
			    uid : $("#impUid"+receiptId).val(),
			  	cancelAmount : ($("#price"+orderId).val() - membershipDiscount) * $("#count"+orderId).val(),
			  	reason : "",
			  	refundBank : "",
			  	refundHolder : "",
			  	refundAccount : ""
			},
			beforeSend : function(xhr) {
        		xhr.setRequestHeader(header, token);
        	},
        	success:function(result) {
        		return;
        	},
        	error:function(xhr, status, error) {
				var errorResponse = JSON.parse(xhr.responseText);
				var errorCode = errorResponse.code;
				var message = errorResponse.message;
				alert(message);
			}
        });
	}
	//각각의 상품 취소 버튼 
	function cancelBtn(receiptId, orderId, membershipDiscount, couponDiscount, usagePoint) {
		if(confirm("해당 상품의 주문을 취소하시겠습니까?")) {
			let token = $("meta[name='_csrf']").attr("content");
		    let header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url : "${path}/mypage/orderHistory/updateOrderStatus",
				type : "POST",
				data : {
					orderId : orderId,
					status : 'C'
				},
				beforeSend : function(xhr) {
		            xhr.setRequestHeader(header, token);
	            },
				success:function(result) {
					if(result==1) {
				  		if(couponDiscount == 0 && usagePoint == 0) {
				  			cancelPay(receiptId, orderId, membershipDiscount);
				  		}
				  		alert("주문하신 상품이 취소되었습니다. 빠른 시일 이내에 환불 처리 됩니다.");
						window.location.href = "${path}/mypage/orderHistory";
					} 
					else {
						alert('주문을 취소하는 과정에서 오류가 발생했습니다.');
					}
				},
				error:function(xhr, status, error) {
    				var errorResponse = JSON.parse(xhr.responseText);
    				var errorCode = errorResponse.code;
    				var message = errorResponse.message;
    				alert(message);
    			}
			});
		}
	}
	 function cancelAllPay(receiptId, totalPrice, membershipDiscount, couponDiscount, usagePoint) {
	  	let token = $("meta[name='_csrf']").attr("content");
   		let header = $("meta[name='_csrf_header']").attr("content");
   		console.log("총 금액 : " + (totalPrice - couponDiscount) );
		$.ajax({
			url : "${path}/mypage/api/payment/cancel",
			type : "POST",
			data : {
			    uid : $("#impUid"+receiptId).val(),
			  	cancelAmount : 0, //(totalPrice - couponDiscount)총결제 금액 없다면 전체환불,
			  	reason : "",
			  	refundBank : "",
			  	refundHolder : "",
			  	refundAccount : ""
			},
			beforeSend : function(xhr) {
       		xhr.setRequestHeader(header, token);
       	},
       	success:function(result) {
       		return;
       	},
       	error:function(xhr, status, error) {
				var errorResponse = JSON.parse(xhr.responseText);
				var errorCode = errorResponse.code;
				var message = errorResponse.message;
				alert(message);
			}
       });
	}
	//전체 상품 취소 버튼 
	function cancelAllBtn(receiptId, totalPrice, membershipDiscount, couponDiscount, usagePoint) {
		if(confirm("주문을 전체 취소하시겠습니까?")) {
			let token = $("meta[name='_csrf']").attr("content");
		    let header = $("meta[name='_csrf_header']").attr("content");
			$.ajax({
				url : "${path}/mypage/orderHistory/updateAllOrderStatus",
				type : "POST",
				data : {
					receiptId : receiptId,
					status : 'C'
				},
				beforeSend : function(xhr) {
		            xhr.setRequestHeader(header, token);
	            },
				success:function(result) {
					if(result==1) {
				  		cancelAllPay(receiptId, totalPrice, membershipDiscount, couponDiscount, usagePoint);
				  		alert("주문하신 상품이 전체 취소되었습니다. 빠른 시일 이내에 환불 처리 됩니다.");
						window.location.href = "${contextPath}/mypage/orderHistory";
					} else {
						alert('주문을 취소하는 과정에서 오류가 발생했습니다.');
					}
				},
				error:function(xhr, status, error) {
    				var errorResponse = JSON.parse(xhr.responseText);
    				var errorCode = errorResponse.code;
    				var message = errorResponse.message;
    				alert(message);
    			}
			});
		}
	}
	 
</script>
</html>