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
<title>관리자페이지-상품상세페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">

/* 상품수정 && modal */
.updateDetailtd{
	text-align: center;
	font-weight: bolder;
	font-size: large;
	color: orange;
}

 textarea{
    resize: none;
}
table{
	text-align: center;
	
}
.tabledetail{
	margin-top :50px;
}
#myModal2{
	z-index: 2000;
}
.buttonlist{
	text-align: center;
}
.tableback_color{
	background-color: rgb(118, 174, 135);
}
/* 상품수정 && modal */

</style>
<script type="text/javascript">

function check(){
	
	/* alert('hihi') */
	let topcategory = $('#topcategory').val();
	console.log(topcategory)
	let midcategory = $('#midcategory').val();
	console.log(midcategory)
	let productGender = $('#productGender').val();
	console.log(productGender)
	
	if (!$.isNumeric(topcategory)) {
		alert('향 카테고리를 선택해주세요!')
		return false;
	}else if (!$.isNumeric(midcategory)) {
		alert('상품구분을 선택해주세요!')
		return false;
	}else if (!(productGender === 'M'|| productGender === 'F')) {
		alert('추천성별을 선택해주세요!')
		return false;
	}
	
}
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
        alert('더 이상 값을 입력할 수 없습니다.')
    }
}

function goback(){
	 window.history.back();
}

function deleteProduct(productNo){
	
	if (confirm(productNo+'번 상품을 정말로 삭제하시겠습니까?')) {
		$.ajax({
			url : '${path}/admin/delete',
			type : 'post',
			data : {productNo},
			dataType : 'json',
			/* contentType: 'application/json; charset=utf-8', */
			success : function(result){
				if (result > 0) {
				alert('상품이 정상적으로 삭제되었습니다.')
				window.location.href='${path}/admin/productList';
				}
			},
			error : function(error){
				alert('상품 삭제에 실패하였습니다.')
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
               			<tr class="table-warning">
               				<th class="align-middle ">
               					<span>상품이미지</span>
               				</th>
               				<c:if test="${empty product.pfList}">
               					<th colspan="3">등록된 사진이 없습니다.</th>
               				</c:if>
               				
               				<c:if test="${not empty product.pfList}">
               					<c:forEach var="file" items="${product.pfList}" varStatus="status">
		               				<th>
		               					${status.count}번째 상품이미지
		               					<img src="${path}/upload/product/${file.renameFileName}" width="200px" class="rounded img-fluid">
		               					<!-- <img src="https://cdn.pixabay.com/photo/2023/04/24/02/51/crimson-rosella-7947000_640.jpg" width="120px" class="rounded img-fluid"> -->
		               				</th>
               					</c:forEach>
               				</c:if>
               			</tr>
               			<tr class="table-warning">
							<th>향카테고리</th>               			
							<th colspan="3">${product.topCategoryName}</th>               			
               			</tr>
               			<tr class="table-warning">
							<th>상품구분<br>(상품/시향지)</th>               			
							<th colspan="3">${product.midCategoryName}</th>               			
               			</tr>
               			<tr class="table-warning">
							<th>추천성별<br>(남성/여성)</th>          
							
							<th colspan="3">
								<c:if test="${product.productGender == 'M'}">
									남성
								</c:if>
								<c:if test="${product.productGender == 'F'}">
									여성
								</c:if>
							</th>   			
							   			
               			</tr>
               			<tr class="table-warning">
							<th>상품브랜드</th>               			
							<th colspan="3">${product.productBrand}</th>         			
               			</tr>
               			<tr class="table-warning">
							<th>상품제목</th>               			
							<th colspan="3">${product.productTitle}</th>         			
               			</tr>
               			<tr class="table-warning">
							<th>상품명/영문명</th>               			
							<th colspan="3">${product.productName}/${product.productEngName}</th>         			
               			</tr>
               			<tr class="table-warning">
							<th>상품설명</th>               			
							<th colspan="3">${product.productDetail}</th>         			
               			</tr>
               			<tr class="table-warning">
							<th>상품기준가격</th>               			
							<th colspan="3">${product.productPrice}</th>         			
               			</tr>
               			
           				<c:if test="${empty product.poList}">
	             			<tr class="table-warning">
	             				<th colspan="4">
	             					<span>상품의 옵션이 등록되지 않았습니다.</span>
	             				</th>
	             			</tr>
           				</c:if>
           				<c:if test="${not empty product.poList}">
	           				<c:forEach var="option" items="${product.poList}" varStatus="status">
		             			<tr class="table-warning">
		             				<th>
		             					${status.count} 번째 옵션
		             				</th>
		             				<th>
		             					옵션명 : [${option.poName} ml]
		             				</th>
		             				<th>
		             					옵션가격 : [${option.poPrice} 원]
		             				</th>
		             				<th>
		             					재고수량 : [${option.poAmount} 개]
		             				</th>
		             			</tr>
		             		</c:forEach>
           				</c:if>
               		</table>
               		
               		<div class="buttonlist">
	               		<button class="btn btn-warning" data-toggle="modal" data-target="#myModal">수정하기</button>
	               		<button class="btn btn-warning" onclick="goback()">목록으로</button>
	               		<button class="btn btn-warning" onclick="deleteProduct('${product.productNo}')">삭제하기</button>
               		</div>
               		
               		<!-- The Modal -->
					  <div class="modal fade" id="myModal">
					    <div class="modal-dialog modal-xl">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">상품수정</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        <!-- Modal Header -->
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					        <form action="${path}/admin/update" method="POST" class="form-inline" enctype="multipart/form-data" onsubmit="return check();">
		                    
		                        
		                        <table class="table table-hover">
		                            <tbody>
		                            	<tr>
		                            		<th colspan="6">상품번호 : ${product.productNo}<input type="hidden" name="productNo" value="${product.productNo}"></th>
		                            	</tr>
		                                <tr>
		                                    <th colspan="6" class="tableback_color"><strong>1.</strong> 상품카테고리선택</th>
		                                </tr>
	                                    <tr>
	                                        <th>상품향선택</th>
	                                        <td>기존 향 카테고리 : ${product.topCategoryName}</td>
	                                        <td colspan="3">
	                                        	수정 카테고리 - 
	                                            <select name="ptNo" id="topcategory" required>
	                                                <option selected>------선택------</option>
	                                                <option value="1">1.시트러스</option>
	                                                <option value="2">2.라이트플로랄</option>
	                                                <option value="3">3.프루티</option>
	                                                <option value="4">4.스파이시</option>
	                                                <option value="5">5.우디</option>
	                                                <option value="6">6.플로랄</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>상품/사쉐선택</th>
	                                        <td>기존 상품구분(상품/사쉐) : ${product.midCategoryName}</td>
	                                        <td colspan="3">
	                                        	수정 상품구분 - 
	                                            <select name="pmNo"  id="midcategory" required>
	                                                <option selected>------선택------</option>
	                                                <option value="1">1.상품</option>
	                                                <option value="2">2.시향지</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>추천성별</th>
	                                        <td>
	                                        기존 추천성별(남성/여성) : 
		                                        <c:if test="${product.productGender == 'M'}">
													남성
												</c:if>
												<c:if test="${product.productGender == 'F'}">
													여성
												</c:if>
	                                        </td>
	                                        <td colspan="3">
	                                        	수정 추천성별 - 
	                                            <select name="productGender" id="productGender" required>
	                                                <option selected>------선택------</option>
	                                                <option value="M">1.남성</option>
	                                                <option value="F">2.여성</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th colspan="6" class="tableback_color"><strong>2.</strong> 상품정보등록</th>
	                                    </tr>
	                                    <tr>
	                                        <th>브랜드</th>
	                                        <td colspan="5">
	                                            <input type="text" name="productBrand" placeholder="${product.productBrand}" required class="form-control form-control-sm">
	                                        </td>
	                                    </tr>
	                                    <tr>
											<th>상품제목</th>               			
											<td colspan="5"> 
												<input type="text" name="productTitle" placeholder=" ${product.productTitle}" required class="form-control form-control-sm">
											</td>        			
			               				</tr>
	                                    <tr>
	                                        <th>상품명</th>
	                                        <td colspan="5">
	                                            <input type="text" name="productName" placeholder="${product.productName}" required class="form-control form-control-sm">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>영문이름</th>
	                                        <td colspan="5">
	                                            <input type="text" name="productEngName" placeholder="${product.productEngName}" required class="form-control form-control-sm">
	                                        </td>
	                                    </tr>
	                                    
	                                    <tr>
	                                        <th>상품기준가격</th>
	                                        <td colspan="5">
	                                            <input type="number" name="productPrice" placeholder="${product.productPrice}" maxlength="8" oninput="numberMaxLength(this);" required class="form-control form-control-sm">
	                                        </td>
	                                        
	                                    </tr>
	                                    <tr style="height: 250px;">
	                                        <th style="height: 250px;" class="align-middle">상품설명</th>
	                                        <td colspan="5" style="height: 250px;">
	                                            <textarea name="productDetail" placeholder="${product.productDetail}" required class="form-control" rows="5" style="height: 250px; width: 100%" ></textarea>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                             </table>
	                           	 <table class="table">
	                           		<tbody>   
		                                <tr>
		                                    <th colspan="6" class="tableback_color"><strong>3.</strong> 상품이미지첨부파일</th>
		                                </tr>
		                                <tr>
		                                	<th colspan="6">기존 상품이미지</th>
		                                </tr>
               							<tr>	
               								<c:if test="${empty product.pfList}">
			               						<td colspan="6">등록된 사진이 없습니다.</td>
			               					</c:if>
				               				<c:if test="${not empty product.pfList}">
				               					<c:forEach var="file" items="${product.pfList}" varStatus="status">
						               				<td colspan="2">
						               					${status.count}번째 상품이미지
						               					<img src="${path}/upload/product/${file.renameFileName}" width="200px" class="rounded img-fluid">
								        				<!-- <img src="https://cdn.pixabay.com/photo/2023/04/24/02/51/crimson-rosella-7947000_640.jpg" width="200px" class="rounded img-fluid"> -->
						               				</td>
				               					</c:forEach>
				               				</c:if>
			               				</tr>
	                                    <tr>
	                                        <th class="align-middle">상품이미지 수정</th>
	                                        <td class="align-middle" colspan="5">
	                                        	<br>*이미지는 3장 모두 수정가능합니다.*<br><br>
	                                        	1.첫번째 사진:썸네일<br><br>
	                                        	2.두번째,세번째 사진은 설명 및 상세보기<br><br>
	                                            <input id="" class="upFile" type="file" name="originalFileName" multiple="multiple" required style="color: orange;">
	                                        </td>
	                                    </tr>
	                           		</tbody>
	                       		 </table>
	                       		 <table class="table" id="productTable">
	                         		<tbody>
	                         			<tr>
	                         				<th colspan="6" class="tableback_color"><strong>4.</strong> 상품옵션등록</th>
	                         			</tr>
	                         			<c:if test="${not empty product.poList}">
					           				<c:forEach var="option" items="${product.poList}" varStatus="status">
					           					<tr><td colspan="6" class="updateDetailtd"><p>${status.count}번째 옵션</p></td></tr>
						             			<tr>
						             				<td>
						             					옵션명 : [${option.poName} ml]
						             					<input type="hidden" name="poList[${status.index}].poNo" value="${option.poNo}">
						             				</td>
						             				<td>
						             					기존 옵션가격 : [${option.poPrice} 원]
						             				</td>
						             				<td>
						             					<input type="number" name="poList[${status.index}].poPrice" maxlength="8" oninput="numberMaxLength(this);" placeholder="가격을 입력해주세요." required class="form-control form-control-sm">
						             				</td>
						             				<td>
						             					기존 재고수량 : [${option.poAmount} 개]
						             				</td>
						             				<td>
						             					<input type="number" name="poList[${status.index}].poAmount" maxlength="8" oninput="numberMaxLength(this);" placeholder="수량을 등록해주세요." required class="form-control form-control-sm">
						             				</td>
						             			</tr>
						             		</c:forEach>
				           				</c:if>
	                                 </tbody>
	                       		 </table>
	                       		 	<!-- Modal footer -->
	                       		 	<div class="container buttonlist">
							          <button type="submit" class="btn btn-warning">수정하기</button>
							          <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
							        </div>
					        	 	<!-- Modal footer -->
                           	</form>
					        </div>
					        <!-- Modal body -->
					        
					      </div>
					    </div>
					  </div>
               		  <!-- The Modal -->
               		 
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>
</body>
</html>