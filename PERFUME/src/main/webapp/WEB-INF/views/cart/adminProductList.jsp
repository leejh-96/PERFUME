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
<title>관리자페이지-업데이트</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">
/* 상품등록 css */
#searchdiv2,#searchdiv1{
	margin: 10px;
}
#listbtngroup *{
	 background-color: rgb(255, 244, 164);
     font-weight: bolder;
     border: none;
}
.listdiv,.listmenu{
	margin: 10px;
	text-align: center;
	align-items: center;
	border: 1px solid navy;

}
/* 상품등록 css */

</style>
</head>
<body>
<div class="container" style="height: 100px;"></div>

<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

	                <div id="searchdiv1">
	                	<span>향선택</span>
	        			<select name="ptNo" id="" required>
	                        <option selected>------선택------</option>
	                        <option value="1">1.시트러스</option>
	                        <option value="2">2.라이트플로랄</option>
	                        <option value="3">3.프루티</option>
	                        <option value="4">4.스파이시</option>
	                        <option value="5">5.우디</option>
	                        <option value="6">6.플로랄</option>
	                    </select>
	                    <span>상품/사쉐선택</span>
	                    <select name="pmNo"  id="" required >
	                        <option selected>------선택------</option>
	                        <option value="1">1.상품</option>
	                        <option value="2">2.시향지</option>
	                    </select>
	                    <span>추천성별선택</span>
	                    <select name="productGender" id="" required>
				            <option selected>------선택------</option>
				            <option value="남성">1.남성</option>
				            <option value="여성">2.여성</option>
				        </select>
				        <span>브랜드선택</span>	
				        <select name="productBrand" id="" required>
				            <option selected>------선택------</option>
				            <option value="남성">1.남성</option>
				            <option value="여성">2.여성</option>
				        </select>
				    </div>
				    <div id="searchdiv2">
	        			<input type="text" placeholder="상품이름을 입력해주세요.">
	        			<button>검색</button>
        			</div>
        			<div class="row"></div><!-- 검색결과 상품보여주기 -->
        			
        			<div class="row listmenu">
        				<div class="col-2">썸네일</div>
        				<div class="col">상품번호</div>
	                    <div class="col-2">향구분</div>
	                    <div class="col">상품구분</div>
	                    <div class="col">상품명</div>
	                    <div class="col">기준금액</div>
	                    <div class="col-2">등록일자</div>
        			</div>
        			
        			<c:if test="${empty list}">
        				 <div class="col">등록된 상품이 없습니다.</div>
        			</c:if>
        			
        			<c:if test="${not empty list}">
        				<c:forEach var="product" items="${ list }">
		        			<div class="row listdiv">
	        					<c:if test="${ empty product.renameFileName && product.renameFileName eq null}">
	        						<div class="col">-</div>
	        					</c:if>
	        					<c:if test="${not empty product.renameFileName && product.renameFileName != null}">
	        						<div class="col-2">
	        							<%-- <img src="${path}/upload/product/${product.renameFileName}" width="100px"> --%>
	        							<img src="https://cdn.pixabay.com/photo/2017/09/06/12/05/perfume-2721147__480.jpg" class="rounded img-fluid">
	        						</div>
	        					</c:if>
	        					<div class="col">${product.productNo}</div>
			                    <div class="col-2">${product.topCategoryName}</div>
			                    <div class="col">${product.midCategoryName}</div>
			                    <div class="col"><a href="${path}/admin/productDetail?productNo=${product.productNo}">${product.productName}</a></div>
			                    <div class="col">${product.productPrice}</div>
			                    <div class="col-2"><fmt:formatDate type="date" value="${product.productDate}"/></div>
		        			</div>
	        			</c:forEach>
        			</c:if>
        			<div id="listbtngroup">
        				
	        			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/productList?page=1'"><<</button>
					    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/productList?page=${pageInfo.prevPage}'"><</button>
					    
					    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:choose>
								<c:when test="${ status.current == pageInfo.currentPage}">
									<button disabled>${ status.current }</button>
								</c:when>
								<c:otherwise>						
									<button onclick="location.href='${ path }/admin/productList?page=${ status.current }'">${ status.current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					    
					    <button type="button" class="btn btn-warning"  onclick="location.href='${ path }/admin/productList?page=${ pageInfo.nextPage }'">></button>
					    <button type="button" class="btn btn-warning" onclick="location.href='${ path }/admin/productList?page=${ pageInfo.maxPage }'">>></button>
					   
        			</div>
        			
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>

<div class="container" style="height: 100px;"></div>

</body>
</html>