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
<div class="container" style="height: 100px;"></div>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

            
            <!-- 회원관리 검색 폼 시작 -->
            <form action="" method="" class="form-inline">
                <div class="input-group mt-3 mb-3">
                    <div class="input-group-prepend">
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
                            선택하세요.
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">이름</a>
                            <a class="dropdown-item" href="#">아이디</a>
                            <a class="dropdown-item" href="#">핸드폰</a>
                        </div>
                    </div>
                    <input type="text" class="form-control" placeholder="Username">
                    <button type="button" class="btn btn-outline-secondary">검색</button>
                </div>
            </form>
            <!-- 회원관리 검색 폼 끝 -->

            <!-- 회원 table 시작 -->
            <div class="row listmenu">
   				<div class="col">회원번호</div>
   				<div class="col">이름</div>
                <div class="col">아이디</div>
                <div class="col-2">이메일</div>
                <div class="col">핸드폰</div>
                <div class="col">상태</div>
                <div class="col-2">-</div>
   			</div>
   			<c:if test="${empty list}">
   				 <div class="col">등록된 회원이 없습니다.</div>
   			</c:if>
   			<c:if test="${not empty list}">
                <c:forEach var="member" items="${list}">
	     			<div class="row listdiv">
  					  <div class="col">${member.memberNo}</div>
  					  <c:if test="${member.memberStatus == 'Y'}">
	    			  	  <div class="col"><a href="${path}/admin/memberDetail?memberNo=${member.memberNo}">${member.memberName}</a></div>
   					  </c:if>
   					  <c:if test="${member.memberStatus == 'N'}">
   					  	  <div class="col">${member.memberName}</div>
   					  </c:if> 
   					  <div class="col">${member.memberId}</div>
	                  <div class="col-2">${member.memberMail}</div>
	                  <div class="col">${member.memberPhone}</div>
	                  <c:if test="${member.memberStatus == 'Y'}">
	                  	  <div class="col">
                          		<i class="fa-solid fa-circle member-active">활동</i>
                          </div>
                      </c:if>
		              <!-- 활동유무에 따라 처리 -->
                      <c:if test="${member.memberStatus == 'N'}">
	                      <div class="col">
	                      		<i class="fa-solid fa-circle member-unactive">비활동</i>
	                      </div>
                      </c:if>         
		              <!-- 활동유무에 따라 처리 -->
                      <c:if test="${member.memberStatus == 'Y'}">
                       	 <div class="col-2">
	                        <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/admin/memberDetail?memberNo=${member.memberNo}'">
	                            상세보기
	                        </button>
                       	 </div>
                      </c:if>         
		              <!-- 활동유무에 따라 처리 -->
                      <c:if test="${member.memberStatus == 'N'}">
	                      <div class="col-2">
		                       <button type="button" class="btn btn-outline-secondary" onclick="memberRecover('${member.memberNo}')">
		                           복구하기
		                       </button>
	                      </div>
                      </c:if>    
		                        
		                        
	                  
	                  
	     			</div>
    			</c:forEach>
   			</c:if>
            
	            <div id="listbtngroup">
	        				
	       			<button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/memberList?page=1'"><<</button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${path}/admin/memberList?page=${pageInfo.prevPage}'"><</button>
				    
				    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:choose>
							<c:when test="${ status.current == pageInfo.currentPage}">
								<button disabled>${ status.current }</button>
							</c:when>
							<c:otherwise>						
								<button onclick="location.href='${ path }/admin/memberList?page=${ status.current }'">${ status.current }</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				    
				    <button type="button" class="btn btn-warning"  onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.nextPage }'">></button>
				    <button type="button" class="btn btn-warning" onclick="location.href='${ path }/admin/memberList?page=${ pageInfo.maxPage }'">>></button>
				   
	   			</div>
                
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>


<div class="container" style="height: 100px;"></div>
</body>
</html>