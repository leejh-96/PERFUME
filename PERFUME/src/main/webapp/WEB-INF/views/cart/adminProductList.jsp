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
.listbtngroup {
     font-weight: bolder;
     border: none;
     text-align: center;
}
.listdiv,.listmenu{
	margin: 10px;
	text-align: center;
	align-items: center;
	border: 1px solid navy;

}
.thead{
	background-color: rgb(118, 174, 135);
}
#myInput{
	margin-top: 50px;
	margin-bottom: 10px;
}
/* 상품등록 css */

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

        		<input class="form-control" id="myInput" type="text" placeholder="검색을 통해 빠르게 찾을 수 있어요!">
       			<table class="table table-striped table-hover">
	        		<thead class="listmenu thead">
	        			<tr>
	        				<th>썸네일</th>
	        				<th>상품번호</th>
		                    <th>향구분</th>
		                    <th>상품구분</th>
		                    <th>상품명</th>
		                    <th>기준금액</th>
		                    <th>등록일자</th>
	        			</tr>
	        		</thead>
	        		<tbody id="myTable">
	        			<c:if test="${empty list}">
		        			<tr>
		        				 <th colspan="7">등록된 상품이 없습니다.</th>
		        			</tr>
	        			</c:if>
	        			
	        			<c:if test="${not empty list}">
	        				<c:forEach var="product" items="${ list }">
			        			<tr class="listdiv">
		        					<c:if test="${ empty product.renameFileName && product.renameFileName eq null}">
		        						<th style="width: 150px; height: 150px;">-</th>
		        					</c:if>
		        					<c:if test="${not empty product.renameFileName && product.renameFileName != null}">
		        						<th style="width: 150px; height: 150px;" class="align-middle">
		        							<!-- <img src="https://cdn.pixabay.com/photo/2023/04/24/02/51/crimson-rosella-7947000_640.jpg" width="100%" height="100%" class="rounded img-fluid"> -->
		        							<img src="${path}/upload/product/${product.renameFileName}" width="100%" height="100%" class="rounded img-fluid">
		        						</th>
		        					</c:if>
		        					<th class="align-middle">${product.productNo}</th>
				                    <th class="align-middle">${product.topCategoryName}</th>
				                    <th class="align-middle">${product.midCategoryName}</th>
				                    <th class="align-middle"><a href="${path}/admin/productDetail?productNo=${product.productNo}">${product.productName}</a></th>
				                    <th class="align-middle">${product.productPrice}</th>
				                    <th class="align-middle"><fmt:formatDate type="date" value="${product.productDate}"/></th>
			        			</tr>
		        			</c:forEach>
	        			</c:if>
        			</tbody>
        		</table>
        			
        			<div class="container listbtngroup">
        				
	        			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/productList?page=1'"><<</button>
					    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/productList?page=${pageInfo.prevPage}'"><</button>
					    
					    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:choose>
								<c:when test="${ status.current == pageInfo.currentPage}">
									<button class="btn btn-warning" disabled>${ status.current }</button>
								</c:when>
								<c:otherwise>						
									<button class="btn btn-warning" onclick="location.href='${ path }/admin/productList?page=${ status.current }'">${ status.current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					    
					    <button type="button" class="btn btn-warning"  onclick="location.href='${ path }/admin/productList?page=${ pageInfo.nextPage }'">></button>
					    <button type="button" class="btn btn-warning" onclick="location.href='${ path }/admin/productList?page=${ pageInfo.maxPage }'">>></button>
					   
        			</div>
        			
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>

<script type="text/javascript">
$("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
});
</script> 

</body>
</html>