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
<title>관리자페이지-회원리스트</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style>
/* 관리자 memberList */
.member-unactive{
    color: slategrey;
}
.member-active{
    color: green;
}
.membertable-th>a{
    color: black;
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
.listbtngroup{
	font-weight: bolder;
    border: none;
    text-align: center;
}
/* 관리자 memberList */
</style>
<script type="text/javascript">

function memberRecover(memberNo){
	
	if (confirm(memberNo+'번 회원님 계정을 복구 하시겠습니까?')) {
		
		let adminPwd = prompt('\n\n관리자님의 비밀번호 인증이 필요한 서비스입니다.\n\n비밀번호를 입력해주세요.');
		
		console.log(adminPwd)
		
		if (adminPwd !== null) {
			
			$.ajax({
				url : '${path}/admin/adminPwdCheck',
				type : 'post',
				data : {adminPwd},
				dataType : 'json',
				success : function(result){
					if (result === true) {
						$.ajax({
							url : '${path}/admin/memberRecover',
							type : 'post',
							data : {memberNo},
							dataType : 'json',
							success : function(result){
								if (result > 0) {
									alert(memberNo+'번 회원님 계정 복구에 성공했습니다.')
									window.location.href='${path}/admin/memberList';
								}else {
									alert(memberNo+'번 회원님 계정 복구에 실패했습니다.')
									return false;
								}
							},
							error : function(error){
								alert('에러 발생')
							}
						})
					}else if (result === false) {
						alert('입력하신 비밀번호와 관리자님의 비밀번호가 일치하지 않습니다.')
						return false;
					}
				},
				error : function(error){
					alert('에러')
				}
			})
		}else {
			return false;
		}
	}
	
}


</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

   			<input class="form-control" id="myInput" type="text" placeholder="검색을 통해 빠르게 찾을 수 있어요!">
       		<table class="table table-striped table-hover">
   				<thead class="listmenu thead">
		   			<tr>
		   				<th>회원번호</th>
		   				<th>이름</th>
		                <th>아이디</th>
		                <th>이메일</th>
		                <th>핸드폰</th>
		                <th>상태</th>
		                <th>-</th>
		   			</tr>
   				</thead>
   				<tbody id="myTable">
		   			<c:if test="${empty list}">
		   				<tr>
		   					<th class="col">등록된 회원이 없습니다.</th>
		   				</tr>
		   			</c:if>
		   			<c:if test="${not empty list}">
		                <c:forEach var="member" items="${list}">
			     			<tr class="listdiv">
		  					  <td>${member.memberNo}</td>
		  					  <c:if test="${member.memberStatus == 'Y'}">
			    			  	  <td><a href="${path}/admin/memberDetail?memberNo=${member.memberNo}">${member.memberName}</a></td>
		   					  </c:if>
		   					  <c:if test="${member.memberStatus == 'N'}">
		   					  	  <td>${member.memberName}</td>
		   					  </c:if> 
		   					  <td>${member.memberId}</td>
			                  <td>${member.memberMail}</td>
			                  <td>${member.memberPhone}</td>
			                  <c:if test="${member.memberStatus == 'Y'}">
			                  	  <td>
		                          		<i class="fa-solid fa-circle member-active">활동</i>
		                          </td>
		                      </c:if>
				              <!-- 활동유무에 따라 처리 -->
		                      <c:if test="${member.memberStatus == 'N'}">
			                      <td>
			                      		<i class="fa-solid fa-circle member-unactive">비활동</i>
			                      </td>
		                      </c:if>         
				              <!-- 활동유무에 따라 처리 -->
		                      <c:if test="${member.memberStatus == 'Y'}">
		                       	 <td>
			                        <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/admin/memberDetail?memberNo=${member.memberNo}'">
			                            상세보기
			                        </button>
		                       	 </td>
		                      </c:if>         
				              <!-- 활동유무에 따라 처리 -->
		                      <c:if test="${member.memberStatus == 'N'}">
			                      <td>
				                       <button type="button" class="btn btn-outline-secondary" onclick="memberRecover('${member.memberNo}')">
				                           복구하기
				                       </button>
			                      </td>
		                      </c:if>    
			     			</tr>
		    			</c:forEach>
		   			</c:if>
   				</tbody>
   			</table>
            
            <div class="container listbtngroup">
        				
       			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/memberList?page=1'"><<</button>
			    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/memberList?page=${pageInfo.prevPage}'"><</button>
			    
			    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button class="btn btn-warning" disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>						
							<button class="btn btn-warning" onclick="location.href='${ path }/admin/memberList?page=${ status.current }'">${ status.current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			    
			    <button type="button" class="btn btn-warning"  onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.nextPage }'">></button>
			    <button type="button" class="btn btn-warning" onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.maxPage }'">>></button>
			   
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