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
<title>관리자페이지-혜택관리</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">
/* 혜택관리 LIST 페이지 */
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
#statusY{
	color: green;
}
#statusN{
	color: red;
}
.thead{
	background-color: rgb(118, 174, 135);
}
#myInput{
	margin-top: 50px;
	margin-bottom: 10px;
}
/* 혜택관리 LIST 페이지 */
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>
	
       			<input class="form-control" id="myInput" type="text" placeholder="검색을 통해 빠르게 찾을 수 있어요!">
       			<table class="table table-striped table-hover">
       			
	       			<thead class="listmenu thead">
	       				<tr>
		       				<th>번호</th>
		       				<th>혜택구분</th>
		                    <th>혜택명</th>
		                    <th>혜택적용율</th>
		                    <th>혜택기간</th>
		                    <th>혜택진행상태</th>
	                    </tr>
	       			</thead>
	       			<tbody id="myTable">
		       			<c:if test="${empty list}">
		       				<tr>
		       					<th class="col">등록된 혜택이 없습니다.</th>
		       				</tr>
		       			</c:if>
		       			
		       			<c:if test="${not empty list}">
		       				<c:forEach var="benefit" items="${ list }" varStatus="status">
			        			<tr class=" listdiv">
			        				<td >${status.count}</td>
		        					<td >${benefit.benefitName}</td>
		       						<td ><a href="${path}/admin/benefitDetail?benefitNo=${benefit.benefitNo}">${benefit.benefitTitle}</a></td>
		        					<td >${benefit.benefitRatio}%</td>
				                    <td >
					                    <fmt:formatDate type="date" value="${benefit.benefitCreateDate}"/>
					                    ~
					                    <fmt:formatDate type="date" value="${benefit.benefitEndDate}"/>
				                    </td>
				                    <td >
				                    	<c:if test="${benefit.benefitStatus == 'Y'}">
				                    		<span id="statusY">진행중인 혜택</span>
				                    	</c:if>
				                    	<c:if test="${benefit.benefitStatus == 'N'}">
				                    		<span id="statusN">종료된 혜택</span>
				                    	</c:if>
				                    </td>
			        			</tr>
		        			</c:forEach>
		       			</c:if>
	       			</tbody>
       			</table>
       			
       			<div class="container listbtngroup">
       				
        			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/benefitList?page=1'"><<</button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/benefitList?page=${pageInfo.prevPage}'"><</button>
				    
				    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:choose>
							<c:when test="${ status.current == pageInfo.currentPage}">
								<button class="btn btn-warning" disabled>${ status.current }</button>
							</c:when>
							<c:otherwise>						
								<button class="btn btn-warning" onclick="location.href='${ path }/admin/benefitList?page=${ status.current }'">${ status.current }</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				    
				    <button type="button" class="btn btn-warning"  onclick="location.href='${ path }/admin/benefitList?page=${ pageInfo.nextPage }'">></button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${ path }/admin/benefitList?page=${ pageInfo.maxPage }'">>></button>
				   
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