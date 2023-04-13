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
	<title>마이페이지</title>
		
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
                    <h5><b>최근 본 상품</b></h5>
                </div>
                <div>
                    <div class="row g-3 mb-3">
                    	<c:if test="${productList.size() < 1}">
                    		<div style="text-align: center; ">
	   							<img class="no-review-img" src="https://image.hmall.com/p/img/co/icon/ico-nodata-type12-1x.svg" />
	   							<h5 class="no_result" style="margin-top: 0px;">최근 본 상품이 없습니다.</h5>
   							</div>
                    	</c:if>
                    	<c:forEach var="productDTO" items="${productList}">
                    		<div class="col-3">
	                            <div class="border border-2 mb-1 p-3">
	                            	<a href="${contextPath}/category/1/${productDTO.categoryID}/detail/${productDTO.productID}">
	                                	<img src="${productDTO.prodimgurl}" style="width: 100%; height: 100%">
                                	</a>
	                            </div>
	                            <div class="text-truncate" align="center">
	                            	<a href="${contextPath}/category/1/${productDTO.categoryID}/detail/${productDTO.productID}">
	                            		${productDTO.productName}
	                            	</a>
	                            </div>
	                        </div>
                    	</c:forEach>
                    </div>
                </div>
                <ul class="pagination justify-content-center">
                	<c:if test="${startPage ne 1}">
                		<li class="page-item">
                			<a class="page-link" href="${contextPath}/mypage?page=${startPage-1}" aria-label="Previous">
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
                					<a class="page-link" href="${contextPath}/mypage?page=${pageNum}">
                						${pageNum}
                					</a>
                				</li>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	<c:if test="${endPage ne pageCount}">
                		<li class="page-item">
                			<a class="page-link" href="${contextPath}/mypage?page=${endPage+1}" aria-label="Next">
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
</html>