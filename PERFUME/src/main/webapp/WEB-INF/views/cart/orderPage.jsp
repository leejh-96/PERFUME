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
<title>주문페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/ecdfb9b41a.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    *{
        /* border: 1px solid red; */
    }
    /* 장바구니 css */
    #cart-wrap{
        background-color: rgb(246, 247, 242);
    }
    .cart-shopping,.cartcenter,.amount-div,.cart-table,#h1-title{
        text-align: center;
    }
    .cart-delete{
        text-align: left;
    }
    .cart-order,#cart-sup{
        text-align: right;
    }
    .cart-tr{
        max-height: 600px;
        overflow-y: auto;
    }
    .sale-wrap{
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .cp-btn{
        width: 40px;
        height: 20px;
    }
    .coupon-p{
        font-size: large;
        margin: 5px;
    }
    .coupondiv{
    	border: 2px; 
    	color: green;
    	font-weight:bolder;
    	background-color: rgb(246, 247, 242);
    }
    .coupon-wrap{
        height: 80px;
        overflow-y: auto;
    }
    .caldiv{
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .caldiv>div{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .badge{
        font-size: large;
        font-weight: bolder;
        color: aliceblue;
        background-color: coral;
        width: 30px;
        height: 30px;
        border-radius: 15px;
    }
    .sequence{
        font-weight: bolder;
        font-size: xx-large;
        color: steelblue;
    }
    .ordercomplete-page{
        height: 3px;
        background-color: orangered;
    }
    #pointInputPtag{
    	display: flex;
    	justify-content: center;
    	
    }
    #memberpoint{
    	color: orange;
    	font-weight: bolder;
    }
    #coupon_point-wrap{
    	margin: 10px;
    	padding: 10px;
    	color: orange;
    	font-weight: bolder;
    	font-size: large;
    }
    .zerostock{
    	color: red;
    	font-weight: bolder;
    	font-size: medium;
    }
    .zeroInfodiv{
    	margin: 10px;
    	padding: 10px;
    	color: orange;
    	font-size: large;
    	font-weight: bolder;
    	
    }
    /* 장바구니 css 끝 */
    /* 주문서 css */
    .agree-div{
        height: 200px;
        overflow-y: scroll;
    }
    .sequence{
        font-weight: bolder;
        font-size: xx-large;
        color: steelblue;
    }
    #plan-sale{
        color: aliceblue;
        background-color: thistle;
    }
    #save-sale{
        color: aliceblue;
        background-color: coral;
    }
    #coupon-sale{
        color: aliceblue;
        background-color: yellowgreen;
    }
    .pay-list{
        text-align: center;
    }
    .payway{
        margin-bottom: 30px;
    }
    .ordercomplete-page{
        height: 3px;
        background-color: orangered;
    }
    .agreedivwrap{
    	text-align: center;
    	margin-top: 10px;
    	margin-bottom: 10px;
    
    }
    #myModal2{
    z-index: 2000;
    }
    
    /* 주문서 css 끝 */
    /* 결제 스피너 css 시작 */
    #myModalorder{
        position: absolute;
        top: 50%;
        left: 50%;
    }
    /* 결제 스피너 css 끝 */
    /* 주문페이지 css */
   
    
    /* 주문페이지 css */
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>

<div id="cart-wrap"><!-- 전체 div 시작 -->
    
	    <div class="container">
	    
	    	<!-- <div class="fade" id="myModalorder">
            	<div class="spinner-border d-flex justify-content-center" style="width: 10rem; height: 10rem;" role="status">
                    <span class="sr-only">결제가 진행 중입니다~~~~~</span>
                </div>
          	</div> -->
	    
	      	<div id="cart-sup">
	          	<span id="cartSequence">01장바구니</span>
	          	<i class="fa-solid fa-angle-right"></i>
	          	<span id="orderSequence" class="sequence">02주문서작성/결제</span>
	          	<i class="fa-solid fa-angle-right"></i>
	          	<span>03주문완료</span>
	      	</div>
		      <p class=" ordercomplete-page"></p>
	    </div>

	    <div class="container cart-tr"><!-- content div 시작 -->
	            <input id="productNo" type="hidden" value="${option.productNo}">
	            <table class="table-hover table cart-table" >
	                <tr>
	                    <th class="align-middle">
	                        <input type="checkbox" id="cartAll" checked="checked" disabled="disabled">
	                    </th>
	                    <th class="align-middle"></th>
	                    <th class="align-middle">상품 정보</th>
	                    <th class="align-middle">수량</th>
	                    <th class="align-middle">상품금액</th>
	                    <th class="align-middle" colspan="2">혜택</th>
	                    <th class="align-middle">최종상품금액</th>
	                </tr>
	                <tr>
	                    <th class="align-middle">  
	                    	<c:if test="${directInfo.poAmount != 0}">
		                        <input type="checkbox" name="cartCheckBox" class="th-input" id="cartCheck" checked="checked" disabled="disabled">
	                  		</c:if>
	                  		<c:if test="${directInfo.poAmount == 0}">
	                  			<span class="zerostock">품절</span> 
	                  		</c:if>
	                    </th>
	                    <th class="align-middle">
	                        <c:if test="${empty directInfo.file.renameFileName}">
	                        	등록된 사진이 없습니다.
	                        </c:if>
	                        <c:if test="${not empty directInfo.file.renameFileName}">
                        		<img src="${path}/upload/product/${directInfo.file.renameFileName}" width="150px">
	                        </c:if>
	                    </th>
	                    <th class="align-middle">
	                        <sub>
	                            <a href="${path}/product/detail?no=${directInfo.productNo}">
	                            	<span>[${directInfo.product.productBrand}]</span>
	                            	<span>${directInfo.product.productEngName}</span><br>
	                                <span>${directInfo.product.productTitle}</span><br>
	                                [옵션사이즈 <span id="optionsize">${option.poName}</span>ml]<br>
	                                <span>[현재 재고 ${directInfo.poAmount}개]</span>
	                            </a>
	                        </sub>
	                    </th>
	                    <th class="align-middle" width="150px">
	                    	<!-- 상품 수량이 있을때 보여주기 -->
		                    <c:if test="${directInfo.poAmount != 0}">
		                        <button class="btngroup" name="btngroup" id="del" type="button" style="width: 30px;" disabled="disabled">-</button>
		                        <input name="readresult" id="result" type="text" value="${option.poAmount}" style="width: 35px; text-align: center;" readonly >
		                        <button class="btngroup" name="btngroup" id="add" type="button" style="width: 30px;" disabled="disabled">+</button>
		                    </c:if>  
	                        <!-- 상품이 품절되었을때 보여주기 -->
	                        <c:if test="${directInfo.poAmount == 0}">
		                        <input name="readresult" id="result" type="text" value="${option.poAmount}" style="width: 35px; text-align: center;" readonly >
		                        <br>
	                        	<sub class="zerostock">품절상품입니다.</sub>
	                    	</c:if>
	                    </th>
	                    <th class="align-middle" width="150px">
	                        <span id="price">
	                        	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${directInfo.poPrice}"/>
		                    </span>원
	                    </th>
	                    <th class="align-middle" width="150px" colspan="2">
	                    	<c:if test="${not empty directInfo.benefitList}">
	                    		<c:forEach var="benefit" items="${directInfo.benefitList}">
		                    		<p>[${benefit.benefitName}]</p>
		                    		<p><mark>${benefit.benefitTitle}</mark></p>
		                    		<span id="ratio">${benefit.benefitRatio}</span>% 할인이벤트!!
	                    		</c:forEach>
		                    </c:if>
		                    <c:if test="${directInfo.benefitList == null || empty directInfo.benefitList}">
		                    	<span>-</span>
		                    </c:if>
	                    </th>
	                    <th class="align-middle">
		                     <c:if test="${empty directInfo.benefitList}">
		                        <span id="finalprice">
		                        	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${option.poAmount*directInfo.poPrice}"/>
		                        </span>원
		                     </c:if>
		                     <c:if test="${not empty directInfo.benefitList}">
		                     	<c:forEach var="benefit" items="${directInfo.benefitList}">
			                     	<span id="finalprice">
			                     		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${(option.poAmount*directInfo.poPrice)-(((benefit.benefitRatio/100)*directInfo.poPrice)*option.poAmount)}"/>
			                     	</span>원
		                     	</c:forEach>
	                     	 </c:if>
	                    </th>
	                </tr>
	            </table>
	    </div><!-- content div 끝 -->
		
        <!-- 보유적립금,쿠폰 시작 -->
        <div class="container">
        	 <c:if test="${not empty memberInfo || memberInfo != null}">
             <div class="row cartcenter"><!-- 모달 DIV 시작 -->
             	<div id="coupon_point-wrap">
	             	<span>나의 포인트-쿠폰
	         			<button type="button" id="amountUpdatebtn" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#myModal2" >자세히보기</button>
		            </span> 	
	            </div>
	             	<div class="modal fade" id="myModal2" >
				    	<div class="modal-dialog modal-lg modal-dialog-centered">
				      		<div class="modal-content">
			      				<div class="modal-body">
				      				<div class="row">
					      				<div class="col-6">
					      					<hr></hr>
							      	  		<h4><span>${memberInfo.memberName} 님의 보유적립금</span></h4>
							      	  		<h3><span id="memberpoint">${memberInfo.memberPoint}</span> point</h3>
					      	  			</div>
					      	  			<div class="col-6">
					      	  				<hr>
						      	  			<p id="pointInputPtag">
						      	    			<input id="pointInput" type="text" placeholder="${memberInfo.memberPoint}point" name="memberPoint" style="text-align: center;">
	                              			</p>
		                              		<button id="pointtry" type="button" class="btn btn-success btn-sm" onclick="pointCheck()">적립금 사용하기</button>
		                              		<button id="reset" type="reset" class="btn btn-primary btn-sm" onclick="pointReset()">취소하기</button>
	     								</div>
	    							</div>
	    							<div class="col">
	    								<hr></hr>
    									<h4>${memberInfo.memberName}님의 보유쿠폰</h4>
    									<c:if test="${not empty memberInfo.memberBenefitList}">
		                        			<c:forEach var="memberCoupon" items="${memberInfo.memberBenefitList}">
					                            <div class="col">
					                            
					                            	<div class="coupondiv" id="coupon${memberCoupon.benefitNo}" style="display: block;">
														<p class="coupon-p">${memberCoupon.benefitTitle}:${memberCoupon.benefitRatio}%</p>
														<p class="coupon-p">기간 : <fmt:formatDate value="${memberCoupon.benefitCreateDate}" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${memberCoupon.benefitEndDate}" pattern="yyyy-MM-dd" /></p>
						 								<button type="button" class="btn btn-sm btn-success coupontry" onclick="couponCheck(${memberInfo.memberNo},${memberCoupon.benefitNo},${memberCoupon.benefitRatio})">적용하기</button>
					                                </div>
					                                
					                                <div class="coupondiv" id="couponreset${memberCoupon.benefitNo}" style="display: none;">
					                                	<p class="coupon-p" >${memberCoupon.benefitTitle}:${memberCoupon.benefitRatio}%</p>
					                                	<p class="coupon-p">기간 : <fmt:formatDate value="${memberCoupon.benefitCreateDate}" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${memberCoupon.benefitEndDate}" pattern="yyyy-MM-dd" /></p>
					                                	<span style="color: red">적용중</span><button type="button" class="btn btn-sm btn-warning" onclick="couponReset(${memberInfo.memberNo},${memberCoupon.benefitNo},${memberCoupon.benefitRatio})">취소하기</button>
					                                </div>
					                                
					                            </div>
		                        			</c:forEach>
                     					</c:if>
                     					<c:if test="${empty memberInfo.memberBenefitList}">
                     						<p>현재 보유하신 쿠폰이 없습니다.</p>
                     					</c:if>
	    							</div>
	    						</div>
				      		<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				    	</div>
				  	</div>
				</div> 
            </div><!-- 모달 DIV 끝 -->
            </c:if>
            
            <div class="row cartcenter">
                <div class="col caldiv">
                	<div class="row zeroInfodiv">*품절상품을 제외한 가격입니다*</div>
                    <div class="row">
                        <div class="col" id="productCount">
                            총<span id="pcspan1"></span>개의 <br> 상품금액 <span id="pcspan2"></span>원
                        </div>
                        <span class="badge">+</span>

                        <div class="col">
                            배송비<span id="delivery"></span>원
                        </div>

                        <span class="badge">-</span>

                        <div class="col">
                            <span>기획전 할인금액</span><br><span id="ratiospan"></span>원
                        </div>
                        <span class="badge">=</span>

                        <div class="col">
                            합계 <span id="final"></span>원
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col cart-shopping">
                    <button type="button" class="btn btn-primary" onclick="goback()">
                        <i class="fa-solid fa-less-than"></i>
                            쇼핑 계속하기
                    </button>
                </div>
            </div>
        </div>
        <!-- 보유적립금,쿠폰 끝 -->
        
        <!-- 주문자정보,배송정보 시작 table -->
        <div class="container hiddenOrder">
        <table class="table table-border">
                <tr>
                    <th colspan="5">
                        <h4>주문자 정보</h4>
                    </th>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        주문하시는 분 성함
                    </th>
                    <td colspan="4">
                        <input type="text" required id="buyer_name" placeholder="이름을 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        휴대폰번호
                    </th>
                    <td colspan="4">
                        <input type="text" required id="buyer_tel" placeholder="형식 010-0000-0000">
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        이메일
                    </th>
                    <td colspan="4">
                        <input type="text" required id="buyer_email" placeholder="형식 kildong@kh.com">
                    </td>
                </tr>
                <tr>
                    <th rowspan="2">
                        <span>*</span>
                        받는곳 주소
                    </th>
                    <td colspan="3">
                    	<input id="addr1" type="text" placeholder="도로명 주소를 입력해주세요." class="container" required>
                    </td>
                    <td>
                    	<input type="button" onclick="Postcode1()" value="우편번호 찾기">
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input id="addr2" type="text" placeholder="상세 주소를 입력해주세요." class="container" required>
                    </td>
                </tr>
                <tr>
                    <th colspan="5"> 
                        <h4>배송정보</h4>
                    </th>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        배송지 확인
                    </th>
                    <td colspan="4">
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input id="selfInput" type="radio" class="form-check-input" name="addressCheck" checked onclick="selfInput()">직접 입력
                            </label>
                        </div>
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input id="buyerTrue" type="radio" class="form-check-input" name="addressCheck" onclick="buyerTrue()">주문자 정보와 동일
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        받으실분 성함
                    </th>
                    <td colspan="4">
                        <input type="text" required id="recipient" placeholder="이름을 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <th rowspan="2">
                        <span>*</span>
                        받는곳 주소
                    </th>
                    <td colspan="3">
                    	<input id="buyer_addr1" type="text" placeholder="도로명 주소를 입력해주세요." class="container" required>
                    </td>
                    <td>
                    	<input type="button" onclick="Postcode2()" value="우편번호 찾기">
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input id="buyer_addr2" type="text" placeholder="상세 주소를 입력해주세요." class="container" required>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        휴대폰번호
                    </th>
                    <td colspan="4">
                        <input type="text" required id="recipienttel" placeholder="형식 010-0000-0000">
                    </td>
                </tr>
                <tr>
                    <th>
                        배송메모
                    </th>
                    <td colspan="4">
                        <input type="text" class="container" required id="memo">
                    </td>
                </tr>
                <tr>
                    <th colspan="5">
                        <h4>결제정보</h4>
                    </th>
                </tr>
                <tr>
                    <th>배송비</th>
                    <th colspan="4"><span id="orderDspan"></span></th>
                </tr>
                <tr>
                    <th>할인/적립/쿠폰 사용내역</th>
                    <th colspan="4">
                        <span id="plan-sale">기획전 할인금액 : <span id="plan-sale2"></span>원</span>
                        <c:if test="${not empty memberInfo || memberInfo != null}">
	                        <span id="save-sale">적립금 사용 : <span id="save-sale2"></span>point</span>
	                        <span id="coupon-sale">쿠폰 사용 할인 : <span id="coupon-sale2"></span>원</span>
                        </c:if>
                    </th>
                </tr>
                <tr>
                    <th>최종 상품 결제 금액</th>
                    <th colspan="4"><span id="finaltotal"></span>원</th>
                </tr>
            
            </table>
    	</div>
    	<!-- 주문자정보,배송정보 시작 table 끝 -->
    	
    	<!-- 결제방법 collapse -->
    	<div class="container hiddenOrder">
	    	<div class="container payway">
	              <h4>결제방법</h4>
	              <div class="row">
	                  <div class="col-8 pay-list container">
	                      <input id="payment" type="hidden" name="pay" value="${memberInfo.memberNo}"><!-- 회원테스트 -->
	                      <input id="payment2" type="hidden" name="pay" value=""><!-- 비회원테스트 -->
	                      <button id="pay6" class="btn btn-outline-secondary pay" onclick="payselect(6)" value="html5_inicis">카드결제</button>
	                      <button id="pay1" class="btn btn-outline-secondary pay" type="button" onclick="payselect(1)" value="kakaopay">카카오페이</button>
	                      <button id="pay4"  type="button" class="btn btn-outline-secondary pay" onclick="payselect(4)" value="payco">페이코</button>
	                      <button id="pay5"  type="button" class="btn btn-outline-secondary pay" onclick="payselect(5)" value="tosspay">토스페이</button>
	                  </div>
	              </div>
	        </div>
	        <!-- 이용약관 -->
	       	<div class="container hiddenOrder agreedivwrap">
	       		<div class="row">
	       			<div class="col-2"></div>
	       				<div class="col-8">
					        <label for="agreeAll">
					            <input id="agreeAll" type="checkbox" onclick="agreeAllCheck()">
					            <span>*</span>
					            <span>
					                PERFUME의 모든 약관을 확인하고 전체 동의 합니다.
					               <!--  (전체 동의에 선택항목도 포함됩니다.) -->
					            </span>
					        </label>
					        <div>
					            <P><span>*</span>개인정보 수집 이용 동의</P>
					            <label for="agree1">
					                <input id="agree1" type="checkbox" required >
					                    <span>
					                        (필수)
					                    </span>
					                    <span>
					                        개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의 합니다.
					                    </span>
					                    <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="collapse" data-target="#demo1">자세히보기</button>
					                    <div id="demo1" class="collapse agree-div">
					           
					                    </div>
					            </label>
					        </div>
				
				        	<div>
				               <P><span>*</span>이용약관 동의</P>
				               <label for="agree2">
				                   <input id="agree2" type="checkbox" required >
				                       <span>
				                           (필수)
				                       </span>
				                       <span>
				                           이용약관에 대한 내용을 확인 하였으며 이에 동의 합니다.
				                       </span>
				                       <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="collapse" data-target="#demo2">자세히보기</button>
				                       <div id="demo2" class="collapse agree-div">
				                           
				                       </div>
				               </label>
				           	</div>
			           	</div>
		           	<div class="col-2"></div>
	           	</div>
	           	
			</div>
			<!-- 이용약관 끝 -->
	    	<div class="container cart-shopping payway">
	             <button id="orderbtn" type="button" class="btn btn-outline-secondary" onclick="pay()" value="${memberInfo.memberNo}">결제하기</button>
	        </div>
        </div>
        <!-- 결제방법 collapse 끝 -->
    	
</div><!-- 전체 div 끝 -->

<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	
	let price = $('#finalprice').text();
	let formatprice = price.split(',').join("");
	let finalPrice = parseInt(formatprice);
	let result = $('#result').val();
	let price2 = $('#price').text();
	let formatprice2 = price2.split(',').join("");
	let finalPrice2 = parseInt(formatprice2);
	
	if (finalPrice > 90000) {
		$('#delivery').text(0);
	}else {
		$('#delivery').text(6000);
	}
	
	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalPrice));
	$('#ratiospan').text(new Intl.NumberFormat('ko-kr').format((finalPrice2*result)-finalPrice));
	$('#pcspan1').text(result);
	$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(finalPrice2*result));
	$('#plan-sale2').text(new Intl.NumberFormat('ko-kr').format((finalPrice2*result)-finalPrice));
	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(finalPrice));
	
})

	let pointremember = 0; 
    function pointReset(){
    	
    	$('#pointtry').attr('disabled',false);
    	
    	let savesale = $('#save-sale2').text();
		let formatsavesale= savesale.split(',').join("");
    	let parseformatsavesale = parseInt(formatsavesale);
    	let finaltotal = $('#finaltotal').text();
		let formatfinaltotal= finaltotal.split(',').join("");
    	let parseformatfinaltotal = parseInt(formatfinaltotal);
    	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseformatfinaltotal+parseformatsavesale));
    	$('#save-sale2').text(pointremember-parseformatsavesale);
    	$('#pointInput').val('');
    	pointremember = 0;
    	console.log('pointremember : '+pointremember)
    	
    }
     
    function pointCheck(){
    	
    	let pointInput = $('#pointInput').val();
    	let point2 = parseInt(pointInput);
    	let memberpoint = $('#memberpoint').text();
    	let formatmemberpoint= memberpoint.split(',').join("");
    	let parseformatmemberpoint = parseInt(formatmemberpoint);
    	
    	if (point2 > parseformatmemberpoint) {
			alert('적립금 한도를 초과했습니다. 다시 입력해주세요!^^')
			$('#reset').trigger('click');
		}else if (point2 < parseformatmemberpoint || point2 == parseformatmemberpoint) {
			
			if (confirm(point2+'point 적립금을 사용하시겠습니까?')) {
				
				if (point2<parseformatmemberpoint || point2 == parseformatmemberpoint) {
					let savesale = $('#save-sale2').text()
					let formatsavesale= savesale.split(',').join("");
			        let parseformatsavesale = parseInt(formatsavesale);
			        
			        parseformatsavesale = point2
			        pointremember = point2
			        console.log('pointremember : '+pointremember)
			        
					$('#save-sale2').text(parseformatsavesale);
					
			        let finaltotal = $('#finaltotal').text();
					let formatfinaltotal= finaltotal.split(',').join("");
		        	let parseformatfinaltotal = parseInt(formatfinaltotal);
					
		        	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseformatfinaltotal-pointremember));
		        	
		        	$('#pointtry').attr('disabled',true);
				}
			}
		}else {
			alert('적립금을 입력해주세요!^^')
		}
    }
    
    let couponTotal = 0;
    function couponCheck(memberNo,benefitNo,benefitRatio){
    	$.ajax({
    		url : '${path}/cart/couponUpdate',
    		type : 'post',
    		data : {memberNo,benefitNo},
    		success : function(success){
    			console.log('쿠폰 업데이트 성공')
    			
    			$('input:checkbox[name="cartCheckBox"]').each(function() {
					
			  	if ($('#coupon'+benefitNo).css('display')=='block') {
	    			$('#coupon'+benefitNo).css('display','none');
					$('#couponreset'+benefitNo).css('display','block');
					
					let finaltotal = $('#finaltotal').text();
					let formatfinaltotal= finaltotal.split(',').join("");
		        	let parseformatfinaltotal = parseInt(formatfinaltotal);
		        	
		        	if (true) {
		        		console.log('parseformatfinaltotal : '+parseformatfinaltotal)
		        		parseformatfinaltotal = 0;
					}
					
					let finalprice = $('#final').text();
					let formatfinalprice= finalprice.split(',').join("");
		        	let parseformatfinalprice = parseInt(formatfinalprice);
					
		        	if (isNaN(parseformatfinalprice)) {
		        		console.log('nan : '+parseformatfinalprice)
		        		parseformatfinalprice = 0;
					}
	    			
					let coupon = $('#coupon-sale2').text();
					let formatcoupon= coupon.split(',').join("");
		        	let parseformatcoupon = parseInt(formatcoupon);
		        	
		        	if (isNaN(parseformatcoupon)) {
		        		console.log('nan : '+parseformatcoupon)
		        		parseformatcoupon = 0;
					}
		        	
		        	console.log('parseformatcoupon'+parseformatcoupon)
					
					let pcspan2 = $('#pcspan2').text();
					let formatpcspan2= pcspan2.split(',').join("");
		        	let parsepcspan2 = parseInt(formatpcspan2);
		        	let coupondis = ((benefitRatio/100)*parsepcspan2);
		        	
		        	let savesale = $('#save-sale2').text()
					let formatsavesale= savesale.split(',').join("");
			        let parseformatsavesale = parseInt(formatsavesale);
			        
			        if (isNaN(parseformatsavesale)) {
		        		console.log('nan : '+parseformatsavesale)
		        		parseformatsavesale = 0;
					}
		        	
		        	console.log('coupondis'+coupondis)
		        	
		        	couponTotal += coupondis;
		        	
		        	$('#coupon-sale2').text(new Intl.NumberFormat('ko-kr').format(couponTotal));
	    			
		        	console.log('couponTotal'+couponTotal)
		        	
		        	parseformatfinalprice-couponTotal
		        	
		        	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseformatfinalprice-couponTotal-parseformatsavesale));
				}
    	  })
    		},
    		error : function(error){
    			console.log('쿠폰 업데이트 실패')
    		}
    	})
     } 
    
    function couponReset(memberNo,benefitNo,benefitRatio){
    	$.ajax({
    		url : '${path}/cart/couponReset',
    		type : 'post',
    		data : {memberNo,benefitNo},
    		success : function(success){
    			console.log('couponReset : 성공 '+success)
    			
    			if ($('#couponreset'+benefitNo).css('display')=='block'){
    				$('#couponreset'+benefitNo).css('display','none');
        			$('#coupon'+benefitNo).css('display','block');
        			
        			let finaltotal = $('#finaltotal').text();
    				let formatfinaltotal= finaltotal.split(',').join("");
    	        	let parseformatfinaltotal = parseInt(formatfinaltotal);
        			
    	        	if (isNaN(parseformatfinaltotal)) {
    	        		console.log('nan : '+parseformatfinaltotal)
    	        		parseformatfinaltotal = 0;
    				}
        			
        			let coupon = $('#coupon-sale2').text();
    				let formatcoupon= coupon.split(',').join("");
    	        	let parseformatcoupon = parseInt(formatcoupon);//여기는 쿠폰할인이 적용된 모든 금액
    	        	
    	        	console.log('couponReset = parseformatcoupon : '+parseformatcoupon)
    	        	
    	        	if (isNaN(parseformatcoupon)) {
    	        		console.log('couponReset = parseformatcoupon : '+parseformatcoupon)
    	        		parseformatcoupon = 0;
    				}
    	        	
    	        	console.log('couponReset = parseformatcoupon : '+parseformatcoupon)
    				
    				let pcspan2 = $('#pcspan2').text();//여기는 상품의금액
    				let formatpcspan2= pcspan2.split(',').join("");
    	        	let parsepcspan2 = parseInt(formatpcspan2);//여기는 상품의금액
    	        	let coupondis = ((benefitRatio*parsepcspan2)/100);
    	        	
    	        	console.log('couponReset = coupondis : '+coupondis)
    	        	
    	        	couponTotal -= coupondis;
    	        	
    	        	$('#coupon-sale2').text(new Intl.NumberFormat('ko-kr').format(couponTotal));
    	        	
    	        	console.log('couponReset = couponTotal : '+couponTotal)
        			
    	        	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseformatfinaltotal+coupondis));
        		}
    		},
    		error : function(error){
    			console.log(error)
    		}
    	})
    }
    
    function buyerTrue(){
  		let buyername = $('#buyer_name').val();
  		let buyertel = $('#buyer_tel').val();
  		let addr1 = $('#addr1').val();
  		let addr2 = $('#addr2').val();
  		
  		$('#recipient').val(buyername);
  		$('#recipienttel').val(buyertel);
  		$('#buyer_addr1').val(addr1);
  		$('#buyer_addr2').val(addr2);
  	}
  	
  	function selfInput(){
  		let recipient = $('#recipient').val();
  		let recipienttel = $('#recipienttel').val();
  		let buyer_addr1 = $('#buyer_addr1').val();
  		let buyer_addr2 = $('#buyer_addr2').val();
  		
  		recipient = '';
  		recipienttel = '';
  		buyer_addr1 = '';
  		buyer_addr2 = '';
  		
  		$('#recipient').val(recipient);
  		$('#recipienttel').val(recipienttel);
  		$('#buyer_addr1').val(buyer_addr1);
  		$('#buyer_addr2').val(buyer_addr2);
  	}
    
    function Postcode1(){
  		new daum.Postcode({
  	         oncomplete: function(data) {
  	             
  	        	let address = data.address;
  	            $('#addr1').val(address);
  	             
  	         }
  	     }).open();
  	 }
  	
  	 function Postcode2(){
  		new daum.Postcode({
  	         oncomplete: function(data) {
  	             
  	        	let address = data.address;
  	            $('#buyer_addr1').val(address);
  	             
  	         }
  	     }).open();
  	 }
  	
  	 function agreeAllCheck(){
  		 $('#agreeAll').change(function(){
  	  		if($("#agreeAll").is(":checked")){
  	  			$('#agree1').attr('checked',true)
  	      		$('#agree2').attr('checked',true)
  	  		}else {
  	  			$('#agree1').attr('checked',false)
  		     	$('#agree2').attr('checked',false)
  			}
  	  	 })
  	}
  	
  	/* 아임포트 결제연동 */
     var IMP = window.IMP;   // 생략 가능
	   IMP.init('imp42427144'); // 예: imp00000000 
	   let payment = '';
     
   function payselect(number){
  	 
  	 if ($('#pay'+number).val() === 'html5_inicis') {
  		 if (confirm('카드로 결제를 진행하시겠습니까?')) {
  			 payment = '';
  			 payment = $('#pay'+number).val();
  	  		 console.log('payment : '+payment)
			} 
		 }else if (confirm($('#pay'+number).val()+'로 결제를 진행하시겠습니까?')) {
			 payment = '';
			 payment = $('#pay'+number).val();
	  		 console.log('payment : '+payment)
		}
   }
	
	 function pay() {
		
		let buyernameinput = $('#buyer_name').val();
		let buyertelinput = $('#buyer_tel').val();
		let addr1input = $('#addr1').val();
		let addr2input = $('#addr2').val();
		let buyeremailinput = $('#buyer_email').val();
		
		let recipientinput = $('#recipient').val();
		let buyeraddr1input = $('#buyer_addr1').val();
		let buyeraddr2input = $('#buyer_addr2').val();
		let recipienttelinput = $('#recipienttel').val();
		
		let telpattern = /[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}/;
		let emailpattern =  /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; 
		
		if (true) {
			if (buyernameinput == '' || buyernameinput == null) {
				alert('주문자님 성함을 입력해주세요!')
				return false;
			}else if (buyertelinput == '' || buyertelinput == null) {
				alert('주문자님 전화번호를 입력해주세요!')
				return false;
			}else if (buyeremailinput == '' || buyeremailinput == null) {
				alert('이메일을 입력해주세요!')
				return false;
			}else if (addr1input == '' || addr1input == null) {
				alert('도로명주소를 입력해주세요!')
				return false;
			}else if (addr2input == '' || addr2input == null) {
				alert('상세주소를 입력해주세요!')
				return false;
			}else if (recipientinput == '' || recipientinput == null) {
				alert('받으시는분 성함을 입력해주세요!')
				return false;
			}else if (buyeraddr1input == '' || buyeraddr1input == null) {
				alert('받으시는분 도로명주소를 입력해주세요!')
				return false;
			}else if (buyeraddr2input == '' || buyeraddr2input == null) {
				alert('받으시는분 상세주소를 입력해주세요!')
				return false;
			}else if (recipienttelinput == '' || recipienttelinput == null) {
				alert('받으시는분 전화번호를 입력해주세요!')
				return false;
			}
			if (buyertelinput != '' || buyertelinput != null) {
				if (!telpattern.test(buyertelinput)) {
					alert('주문자님 전화번호를 올바르게 입력해주세요.')
					return false;
				}else if (recipienttelinput != '' || recipienttelinput != null) {
					if (!telpattern.test(recipienttelinput)) {
						alert('받으시는분 전화번호를 올바르게 입력해주세요.')
						return false;
					}
				}
			}else if (buyeremailinput != '' || buyeremailinput != null) {
				if (!emailpattern.test(buyeremailinput)) {
					alert('이메일을 올바르게 입력해주세요.')
					return false;
				}
			}
		}
		if ($('#agree1').prop('checked')==false) {
			alert('개인정보 수집이용에 대한 내용을 체크해주세요!')
			return false;
		}else if ($('#agree2').prop('checked')==false) {
			alert('이용약관에 대한 내용을 체크해주세요!!')
			return false;
		}
		 
		   if (confirm('결제를 진행하시겠습니까?')) {
			 
			 if (payment == null || payment == '') {
				 alert('결제 방식을 선택해주세요!')
				return false;
			 }
			   
			 let memberNo = $('#payment').val();//멤버 번호가 담겨있음
			 let orderNo = 'PERFUME-' + new Date().getTime();//현재시간으로 주문번호를 생성해서 보내기
			 
			 if (memberNo == null || memberNo == '' || isNaN(memberNo)) {
				console.log('memberNo : '+'없음')//비회원처리하기
				memberNo = 0;//비회원번호는 0
			  }
				   console.log('memberNo : '+'있음')//회원처리하기
				   let orderName = $('#buyer_name').val();//주문자 이름
				   let orderEmail = $('#buyer_email').val();//주문자 이메일
				   let orderPhone = $('#buyer_tel').val();//주문자 전화번호
				   let recipientAddr1 = $('#buyer_addr1').val();//주문자 주소
				   let recipientAddr2 = $('#buyer_addr2').val();//주문자 주소
				   let recipientAddr = recipientAddr1+" "+recipientAddr2;//주문자 주소
				   
				   let finaltotal = $('#finaltotal').text();//최종결제금액.
	        	   let formattotal = finaltotal.split(',').join("");//최종결제금액.
			       let finalPrice = parseInt(formattotal);//최종결제금액.
			       let planning = $('#plan-sale2').text();//기획전할인금액.
	        	   let formatplanning = planning.split(',').join("");//기획전할인금액.
			       let discount = parseInt(formatplanning);//기획전할인금액.
			       if (isNaN(discount)) {
						discount = 0;
				   }
			       let point2 = $('#save-sale2').text();//포인트할인금액.
	        	   let formatpoint = point2.split(',').join("");//포인트할인금액.
			       let point = parseInt(formatpoint);//포인트할인금액.
			       if (isNaN(point)) {
			    	   point = 0;
				   }
			       let plusPoint = finalPrice*(5/100);
			       let coupon2 = $('#coupon-sale2').text();//쿠폰할인금액.
	        	   let formatcoupon = coupon2.split(',').join("");//쿠폰할인금액.
			       let coupon = parseInt(formatcoupon);//쿠폰할인금액.
			       if (isNaN(coupon)) {
			    	   coupon = 0;
				   }
			       let delivery = 0;//배송비
			       if (finalPrice>90000) {
						delivery = 0;
				   }else {
						delivery = 6000;
				   }
			       
			       let recipientName = $('#recipient').val();//받는분 이름
			       let recipientPhone = $('#recipienttel').val();//받는분전화번호
			       let memo = $('#memo').val();//배송메모
			       
			       if (payment === 'html5_inicis') {
					
				   }
			       
			       let orderMethod = payment;//결제수단
				   
				   IMP.request_pay({
					    pg : payment,
					    merchant_uid : orderNo,//
					    name : '주문명:결제테스트',
					    amount : 100,//결제금액
					    buyer_email : orderEmail,
					    buyer_name : orderName,
					    buyer_tel : orderPhone,
					    buyer_addr : recipientAddr
					}, function(rsp) {
						console.log(rsp);
						// 결제검증
						$.ajax({
				        	type : 'POST',
				        	url : '${path}/verifyIamport/' + rsp.imp_uid 
				        }).done(function(data) {
				        	let orderDate = new Date().getTime();//결제날짜 생성
				        	if(rsp.paid_amount == data.response.amount){
				        		if (memberNo != 0) {//회원검증
							    	   if (point != 0) {//회원포인트차감
							    		   $.ajax({
							            		url : '${path}/order/pointUpdate/'+point+'/'+memberNo+'/',
							            		type : 'GET',
							            		data : {point,memberNo},
							            		dataType : 'json',
							            		success : function(result){
							            			if (result > 0) {
								            			console.log('적립금 업데이트 완료')
								            			$.ajax({
															url : '${path}/order/plusPoint/'+plusPoint+'/'+memberNo+'/',
															type : 'GET',
															data : {plusPoint,memberNo},
															dataType : 'json',
															success : function(result){
																if (result > 0) {
																	console.log('적립금 적립 업데이트 완료')
																}
															},
											        		error : function(){
											        			console.log('적립금 업데이트 오류')
											        		}
														})
													}
							            		},
							            		error : function(){
							            			console.log('적립금 업데이트 오류')
							            		}
							               })
									   }
								   }
				        		//결제 성공 로직 시작
				        		let order = {orderNo,memberNo,orderMethod,orderDate,finalPrice,orderName,orderEmail,orderPhone,recipientAddr,
				        					discount,point,coupon,delivery,recipientName,recipientPhone,memo};
				        		
				        		$.ajax({
				        			url : '${path}/cart/orderDetail',
				        			type : 'post',
				        			data : JSON.stringify(order),
				        			dataType : 'json',
				        			contentType: 'application/json; charset=utf-8',
				        			async : false,
				        			success : function(obj){
				        				/* $('#myModalorder').modal('show') */
				        				
			        					$('input:checkbox[name=cartCheckBox]').each(function(index){
			        						if (this.disabled == true) {
						        				orderNo;//주문번호
						        				console.log('orderNo : '+orderNo)
						        				
						        				let productNo = $('#productNo').val();//상품번호
						        				console.log('productNo : '+productNo)
						        				
						        				let price = $('#finalprice').text();
												let formatprice = price.split(',').join("");
												let orderPrice = parseInt(formatprice);//상품가격
						        				
						        				let result = $('#result').val();
						        				let orderCount = parseInt(result);//상품수량
						        				
						        				
						        				let option = $('#optionsize').text();
						        				let orderSize = parseInt(option);//옵션사이즈
						        				
						     			        let orderList = {orderNo,productNo,orderCount,orderSize,orderPrice};//하나의 주문상품 객체
				        						$.ajax({
				        							url : '${path}/cart/order',
				        							type : 'post',
				        							data : JSON.stringify(orderList),
				        							dataType : 'json',
				        							contentType: 'application/json; charset=utf-8',
				        							async : false,
				        							success : function(obj){
				        								console.log('order-product-complete 결제에 성공하였습니다.')
				        							},
				        							error : function(error){
				        								/* $('#myModal').modal('hide') */
				        								console.log('order-product-error 결제에 실패하였습니다.')
				        							}
				        						})
				        					 }
				        				})
				        			},
				        			error : function(error){
				        				console.log('order-insert-error')
				        			}
				        		})
				        		payment = '';
				        		/* $('#myModalorder').modal('hide') */
				        		window.location.href='${path}/cart/orderList/'+order.orderNo+'/'+order.memberNo+'/'+plusPoint;
				        	} else {
				        		//결제 실패 로직
				        		alert("결제에 실패하였습니다.");
				        	}
				        });
					});
		   }else {
			return false;
		  }
   }
    
 function goback(){
   	 window.history.back();
 }
    
    

</script>

</body>
</html>