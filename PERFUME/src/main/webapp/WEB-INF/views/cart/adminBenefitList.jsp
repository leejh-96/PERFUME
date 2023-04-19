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
#statusY{
	color: green;
}
#statusN{
	color: red;
}


/* 혜택관리 LIST 페이지 */
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>
	
				<input class="form-control" id="myInput" type="text" placeholder="검색을 통해 빠르게 찾을 수 있어요!">
				
				<div class="row listmenu">
       				<div class="col">번호</div>
       				<div class="col">혜택구분</div>
                    <div class="col">혜택명</div>
                    <div class="col">혜택적용율</div>
                    <div class="col">혜택기간</div>
                    <div class="col">혜택진행상태</div>
                    <!-- <div class="col-2">등록일자</div> -->
       			</div>
       			
       			<c:if test="${empty list}">
       				 <div class="col">등록된 혜택이 없습니다.</div>
       			</c:if>
       			
       			<c:if test="${not empty list}">
       				<c:forEach var="benefit" items="${ list }" varStatus="status">
	        			<div class="row listdiv">
	        				<div class="col">${status.count}</div>
        					<div class="col">${benefit.benefitName}</div>
       						<div class="col"><a href="${path}/admin/benefitDetail?benefitNo=${benefit.benefitNo}">${benefit.benefitTitle}</a></div>
        					<div class="col">${benefit.benefitRatio}%</div>
		                    <div class="col">
			                    <fmt:formatDate type="date" value="${benefit.benefitCreateDate}"/>
			                    ~
			                    <fmt:formatDate type="date" value="${benefit.benefitEndDate}"/>
		                    </div>
		                    <div class="col">
		                    	<c:if test="${benefit.benefitStatus == 'Y'}">
		                    		<span id="statusY">진행중인 혜택</span>
		                    	</c:if>
		                    	<c:if test="${benefit.benefitStatus == 'N'}">
		                    		<span id="statusN">종료된 혜택</span>
		                    	</c:if>
		                    </div>
	        			</div>
        			</c:forEach>
       			</c:if>
       			<div id="listbtngroup">
       				
        			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/benefitList?page=1'"><<</button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/benefitList?page=${pageInfo.prevPage}'"><</button>
				    
				    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:choose>
							<c:when test="${ status.current == pageInfo.currentPage}">
								<button disabled>${ status.current }</button>
							</c:when>
							<c:otherwise>						
								<button onclick="location.href='${ path }/admin/benefitList?page=${ status.current }'">${ status.current }</button>
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
    $(".listdiv div").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
});
</script> 
</body>
</html>