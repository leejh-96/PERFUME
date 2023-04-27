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
<title>주문관리리스트</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">
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
#statusY{
	color: green;
}
#statusN{
	color: red;
}

.statusrd,.statusrc{
	color: red;
}
.statusdr,.statusdc{
	color: blue;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>
				<input class="form-control" id="myInput" type="text" placeholder="검색을 통해 빠르게 찾을 수 있어요!">
       			<table class="table table-striped table-hover">
       			
	       			<thead class="listmenu thead">
	       				<tr>
	       					<th>번호</th>
		       				<th>주문번호</th>
		       				<th>회원구분</th>
		                    <th>최종결제금액</th>
		                    <th>결제수단</th>
		                    <th>결제날짜</th>
		                    <th>주문상태</th>
	                    </tr>
	       			</thead>
	       			<tbody id="myTable">
		       			<c:if test="${empty list}">
		       				<tr>
		       					<th class="col">진행된 주문내역이 없습니다.</th>
		       				</tr>
		       			</c:if>
		       			
		       			<c:if test="${not empty list}">
		       				<c:forEach var="order" items="${ list }" varStatus="status">
			        			<tr class=" listdiv">
			        				<td>${status.count}</td>
			        				<td><a href="${path}/admin/orderDetail?orderNo=${order.orderNo}">${order.orderNo}</a></td>
			        				<c:if test="${order.memberNo eq 0}">
		        						<td>비회원주문</td>
		        					</c:if>
		        					<c:if test="${order.memberNo != 0}">
		        						<td >회원번호 : ${order.memberNo}</td>
		        					</c:if>
		       						<td>${order.finalPrice}</td>
		        					<td>${order.orderMethod}</td>
				                    <td>
					                    <fmt:formatDate type="date" value="${order.orderDate}"/>
				                    </td>
				                    <td>
				                    	<c:if test="${order.status eq 'Y'}">
				                    		<span id="statusY">결제완료</span>
				                    	</c:if>
				                    	<c:if test="${order.status eq '출고준비중'}">
				                    		<span class="statusrd">${order.status}</span>
				                    	</c:if>
				                    	<c:if test="${order.status eq '출고완료'}">
				                    		<span class="statusrc">${order.status}</span>
				                    	</c:if>
				                    	<c:if test="${order.status eq '배송준비중'}">
				                    		<span class="statusdr">${order.status}</span>
				                    	</c:if>
				                    	<c:if test="${order.status eq '배송완료'}">
				                    		<span class="statusdc">${order.status}</span>
				                    	</c:if>
				                    	<c:if test="${order.status eq '결제취소'}">
			       							<span style="color: hotpink">${order.status}</span>
			       						</c:if>
				                    </td>
			        			</tr>
		        			</c:forEach>
		       			</c:if>
	       			</tbody>
       			</table>
       			
       			<div class="container listbtngroup">
       				
        			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/orderList?page=1'"><<</button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/orderList?page=${pageInfo.prevPage}'"><</button>
				    
				    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:choose>
							<c:when test="${ status.current == pageInfo.currentPage}">
								<button class="btn btn-warning" disabled>${ status.current }</button>
							</c:when>
							<c:otherwise>						
								<button class="btn btn-warning" onclick="location.href='${ path }/admin/orderList?page=${ status.current }'">${ status.current }</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				    
				    <button type="button" class="btn btn-warning"  onclick="location.href='${ path }/admin/orderList?page=${ pageInfo.nextPage }'">></button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${ path }/admin/orderList?page=${ pageInfo.maxPage }'">>></button>
				   
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