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
<title>관리자페이지-주문상세내역</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">
.tabledetail{
	margin-top :50px;
}
.buttonlist{
	margin-top: 50px;
	text-align: center;
}
#orderModal{
	z-index: 2000;
}
.ordertable{
	text-align: center;
}
.thead{
	background-color: rgb(118, 174, 135);
}
#orderdelModal{
	z-index: 2000;
}
</style>
<script type="text/javascript">

function statusUpdate(orderNo){
	
	let status = $('#status').val();
	
     if (status === 'rd') {
		status = '출고준비중';
	}else if (status === 'rc') {
		status = '출고완료';
	}else if (status === 'dr') {
		status = '배송준비중';
	}else if (status === 'dc') {
		status = '배송완료';
	}else if (status === 'oc') {
		status = '결제취소';
	}
     
	
     if (confirm(status+'(으)로 배송상태를 변경하시겠습니까?')) {
		
    	 $.ajax({
    		url : '${path}/admin/statusUpdate',
    		type : 'post',
    		data : {orderNo,status},
    		dataType : 'json',
    		success : function(result){
    			
    			if (result > 0) {
    				
    				let statusth = $('#statusth').text();
    				statusth = '';
    				
    				if (status === '출고준비중') {
    					
    					statusth = status;
    					$('#statusth').text(statusth).css('color','red');
    					$('#orderdelModal').modal('hide');
    					
					}else if (status === '출고완료') {
						
						statusth = status;
    					$('#statusth').text(statusth).css('color','red');
    					$('#orderdelModal').modal('hide');
    					
					}else if (status === '배송준비중') {
						
						statusth = status;
    					$('#statusth').text(statusth).css('color','blue');
    					$('#orderdelModal').modal('hide');
						
					}else if (status === '배송완료') {
						
						statusth = status;
    					$('#statusth').text(statusth).css('color','blue');
    					$('#orderdelModal').modal('hide');
						
					}else if (status === '결제취소') {
						
						statusth = status;
    					$('#statusth').text(statusth).css('color','green');
    					$('#orderdelModal').modal('hide');
						
					}
				}
    		}
    	 })
	}else {
		return false;
	}
}

function deleteOrder(orderNo){
	
	alert(orderNo)
	
	if (confirm('정말로 주문번호 '+orderNo+'(을)를 삭제하시겠습니까?')) {
		$.ajax({
			url : '${path}/admin/deleteOrder',
			type : 'post',
			data : {orderNo},
			dataType : 'json',
			success : function(result){
				
				if (result > 0) {
					console.log('성공')
					window.location.href='${path}/admin/orderList';
				}else {
					console.log('실패')
				}
			},
			error : function(error){
				console.log(error)
			}
		})
	}else {
		return false;
	}
}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

					<table class="table table-hover tabledetail">
						<tbody>
	               			<tr class="table-warning">
	               				<th>주문번호</th>
	               				<th colspan="2">
	               					${order.orderNo}
	               				</th>
	               			</tr>
	               			<tr>	
			       				<th class="align-middle">배송상태</th>
		       					<th id="statusth" class="align-middle">
			       					<c:if test="${order.status eq 'Y'}">
			       						<span style="color: green">결제완료</span>
			       					</c:if>
			       					<c:if test="${order.status eq '출고준비중'}">
			       						<span style="color: red">${order.status}</span>
			       					</c:if>
			       					<c:if test="${order.status eq '출고완료'}">
			       						<span style="color: red">${order.status}</span>
			       					</c:if>
			       					<c:if test="${order.status eq '배송준비중'}">
			       						<span style="color: blue">${order.status}</span>
			       					</c:if>
			       					<c:if test="${order.status eq '배송완료'}">
			       						<span style="color: blue">${order.status}</span>
			       					</c:if>
			       					<c:if test="${order.status eq '결제취소'}">
			       						<span style="color: hotpink">${order.status}</span>
			       					</c:if>
		       					</th>
		       					<th>
		       						<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#orderdelModal">상태변경하기</button>
		       					</th>
			                </tr> 
	               			<tr>
		       					<th>회원구분</th>
		       					<c:if test="${order.memberNo eq 0}">
               						<th colspan="2">비회원주문</th>
               					</c:if>
               					<c:if test="${order.memberNo != 0}">
               						<th colspan="2">회원주문</th>
               					</c:if>
			       			</tr>
			       			<tr>	
			       				<th>결제수단</th>
			                	<th colspan="2">${order.orderMethod}</th>
			                </tr> 
			                <tr>   
			                    <th>결제날짜</th>
			                    <th colspan="2"><fmt:formatDate type="date" value="${order.orderDate}"/> </th>
			               	</tr> 
			               	<tr>
			                    <th>최종결제금액</th>
			                    <th colspan="2"><fmt:formatNumber pattern="###,###,###,###,###,###" value="${order.finalPrice}"/>원</th>
			       			</tr>
			       			<tr>	
			       				<th>기획전할인금액</th>
			       				<th colspan="2"><fmt:formatNumber pattern="###,###,###,###,###,###" value="${order.discount}"/>원</th>
			       			</tr>
			       			<tr>
			                    <th>적립금사용금액</th>
			                    <th colspan="2"><fmt:formatNumber pattern="###,###,###,###,###,###" value="${order.point}"/>point</th>
			                </tr>
			                <tr>
			                    <th>쿠폰사용금액</th>
			                    <th colspan="2"><fmt:formatNumber pattern="###,###,###,###,###,###" value="${order.coupon}"/>원</th>
			                </tr>
			                <tr>
			                    <th>배송비</th>
			                    <th colspan="2"><fmt:formatNumber pattern="###,###,###,###,###,###" value="${order.delivery}"/>원</th>
	               			</tr>
               			</tbody>
               		</table>
               		<div class="buttonlist">
               			<button class="btn btn-warning" data-toggle="modal" data-target="#orderModal">리스트확인하기</button>
               		</div>
               		
               		<div class="row">
               		
               			<div class="col-6">
               				<table class="table table-hover tabledetail">
			               			<tr class="table-warning">
			               				<th colspan="2">주문자정보</th>
			               			</tr>
			               			<tr>
				       					<th>주문자성함</th>
		               					<th>${order.orderName}</th>
					       			</tr>
					       			<tr>
				       					<th class="align-middle">주문자주소</th>
		               					<th class="align-middle">${order.recipientAddr}</th>
					       			</tr>
					       			<tr>
				       					<th>주문자핸드폰번호</th>
		               					<th>${order.orderPhone}</th>
					       			</tr>
					       			<tr>
				       					<th>이메일</th>
		               					<th>${order.orderEmail}</th>
					       			</tr>
					       	</table>		
					    </div>   			
               			<div class="col-6">
               			
	               			<table class="table table-hover tabledetail">
		               			<tr class="table-warning">
		               				<th colspan="2">배송지정보</th>
		               			</tr>
		               			<tr>
			       					<th>받는분성함</th>
	               					<th>${order.recipientName}</th>
				       			</tr>
				       			<tr>
			       					<th class="align-middle">받는분주소</th>
	               					<th class="align-middle">${order.recipientAddr}</th>
				       			</tr>
				       			<tr>
			       					<th>받는분핸드폰번호</th>
	               					<th>${order.recipientPhone}</th>
				       			</tr>
				       			<tr>
			       					<th class="align-middle">배송메모</th>
	               					<th class="align-middle">${order.memo}</th>
				       			</tr>
						    </table>	
               			</div>
               		</div>
           				
           			<!-- The orderModal -->
					  <div class="modal fade" id="orderModal">
					    <div class="modal-dialog modal-xl">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4>주문리스트</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        <!-- Modal Header -->
					        
					        <!-- Modal body -->
					        <div class="modal-body">
		                        <table class="table ordertable">
	                        		<tr class="thead">
				        				<th class="align-middle">상품이미지</th>
				        				<th class="align-middle">주문번호</th>
					                    <th class="align-middle">상품번호</th>
					                    <th class="align-middle">상품정보</th>
					                    <th class="align-middle">가격</th>
					                    <th class="align-middle">수량</th>
				                    </tr>
			        				<tbody>
				        				<c:if test="${empty order.orderList}">
				        					<tr>
							                	<th colspan="6">
													주문상세 내역이 없습니다.		                        			
					                        	</th>
					                       	</tr>
					                	</c:if>
					        			<c:if test="${not empty order.orderList}">
					        				<c:forEach var="orderList" items="${order.orderList}">
					        					<tr>
					        						<th class="align-middle">
						        						<img src="${path}/upload/product/${orderList.orderFileName}" width="100px" class="rounded">
					        							<!-- <img src="https://cdn.pixabay.com/photo/2017/09/06/12/05/perfume-2721147__480.jpg" width="100px" class="rounded"> -->
					        						</th>
							        				<th class="align-middle">${orderList.orderNo}</th>
								                    <th class="align-middle">${orderList.productNo}</th>
								                    <th class="align-middle">
									                    <a href="${path}/product/detail?no=${orderList.productNo}">
									                    	<sub>[${orderList.productName}]</sub><br>
									                    	<sub>[${orderList.productEng}]</sub><br>
									                    	<sub>[${orderList.productBrand}]</sub><br>
									                    	<sub>[${orderList.orderSize}ml]</sub><br>
									                    </a>
								                    </th>
								                    <th class="align-middle"><fmt:formatNumber pattern="###,###,###,###,###" value="${orderList.orderPrice}"/></th>
								                    <th class="align-middle">${orderList.orderCount}</th>
					        					</tr>
					        				</c:forEach>
					        			</c:if>
			        				</tbody>	
			        			</table>
					        </div>
					        <!-- Modal body -->
				        	<!-- Modal footer -->
					        <div class="buttonlist">
					          <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
					        </div>
			        	 	<!-- Modal footer -->
					        
					      </div>
					    </div>
					  </div>
               		  <!-- The orderModal -->
               		  
               		  
               		  <!-- The orderdelModal -->
					  <div class="modal fade" id="orderdelModal">
					    <div class="modal-dialog modal-sm">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">상태변경</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					          <sub>배송상태를 선택해주세요.</sub>
					          <select name="status" id="status" required>
                                   <option selected>------선택------</option>
                                   <option value="rd">1.출고준비중..</option>
                                   <option value="rc">2.출고완료..</option>
                                   <option value="dr">3.배송준비중..</option>
                                   <option value="dc">4.배송완료..</option>
                                   <option value="oc">5.결제취소..</option>
                              </select>
					          
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="buttonlist">
					        	<button class="btn btn-warning" onclick="statusUpdate('${order.orderNo}')">변경하기</button>
					          	<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
					        </div>
					        
					      </div>
					    </div>
					  </div>
               		  <!-- The orderdelModal -->
               		
               		<div class="buttonlist">
	               		<button class="btn btn-warning" onclick="location.href='${path}/admin/orderList'">목록으로</button>
	               		<%-- <button class="btn btn-warning" onclick="deleteOrder('${order.orderNo}')">삭제하기</button> --%>
               		</div>

<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>
</body>
</html>