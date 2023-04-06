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
<title>장바구니</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/ecdfb9b41a.js"></script>
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
        font-size: smaller;
        border: 1px solid black;
        margin: 5px;
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
    /* 장바구니 css 끝 */
    </style>
    <script type="text/javascript">
    /* 장바구니 수량버튼 시작 */
    function add(productAmount,cartProductCount,cartNo){
    	let result = $('#result'+cartNo).val();
    	let ratio = $('#ratio'+cartNo).text();
    	let price = $('#price'+cartNo).text();
    	let finalprice = $('#finalprice'+cartNo).text();
    	let formatprice = price.split(',').join("");
    	let formatfinalprice = finalprice.split(',').join("");
    	
    	parprice = parseInt(formatprice);
    	parfinalprice = parseInt(formatfinalprice);
    	
    	if (ratio == "" || ratio == null || ratio == undefined || ( ratio != null && typeof ratio == "object" && !Object.keys(ratio).length ) ) {
			console.log('비어있음')
			++result
			console.log(result)
			$('#result'+cartNo).val(result);
			
			let won = result * parprice;
			
			let formmat = won.toLocaleString();
			
			$('#finalprice'+cartNo).text(formmat);
    	}else {
			console.log('안비어있음')
			if (productAmount > result) {
    		++result
    		console.log(result)
    		$('#result'+cartNo).val(result);
    		
    		let won = (result*parprice)-(((ratio/100)*parprice)*result);
    		
    		let formmat = new Intl.NumberFormat('ko-kr').format(won)
    		
    		 $('#finalprice'+cartNo).text(formmat); 
    		
			}else {
				alert('현재 주문할 수 있는 물량이 부족합니다.')
			}
		}
    }
    
    function del(cartNo){
    	let result = $('#result'+cartNo).val();
    	let ratio = $('#ratio'+cartNo).text();
    	let price = $('#price'+cartNo).text();
    	let finalprice = $('#finalprice'+cartNo).text();
    	let formatprice = price.split(',').join("");
    	let formatfinalprice = finalprice.split(',').join("");
    	
    	parprice = parseInt(formatprice);
    	parfinalprice = parseInt(formatfinalprice);
    	
    	console.log(ratio)
    	console.log(price)
    	console.log(finalprice)
    	
    	if (ratio == "" || ratio == null || ratio == undefined || ( ratio != null && typeof ratio == "object" && !Object.keys(ratio).length ) ) {
    		console.log('비어있음')
    		if (result==1) {
			alert('최소 주문 수량은 1개 이상입니다!^^')
			}else{
				--result
				console.log(result)
				$('#result'+cartNo).val(result);
				
				let won = result*parprice;
				
				let formmat = new Intl.NumberFormat('ko-kr').format(won); 
				
				$('#finalprice'+cartNo).text(formmat);
			}
		}else {
			console.log('비어있지 않음')
			if (result==1) {
			alert('최소 주문 수량은 1개 이상입니다!^^')
			}else{
				--result
				console.log(result)
				$('#result'+cartNo).val(result);
				
				let won = parfinalprice-(parprice-((ratio/100)*parprice));
				
				let formmat = new Intl.NumberFormat('ko-kr').format(won) 
				
				$('#finalprice'+cartNo).text(formmat);
			}
		}
    }
    /* 장바구니 수량버튼 끝 */
    
    let sum = 0;
    let pricesum = 0;
    
    function cartCheck(cartNo){
    	
    	let result = $('#result'+cartNo).val();
    	let price = $('#price'+cartNo).text();
    	let ratio = $('#ratio'+cartNo).text();
    	let finalprice = $('#finalprice'+cartNo).text();
    	let formatprice = price.split(',').join("");
    	let formatfprice = finalprice.split(',').join("");
    	
    	/* 같은 체크박스를 체크했을때 처리로직 */
    	if ($('input[type="checkbox"]:checked')) {
    		let amount = parseInt(result);
    		let parse = parseInt(formatprice);
    		
    		sum += amount;
    		pricesum += amount*parse;
    		
    		$('#pcspan1').text(sum); 
    		$('#pcspan2').text(pricesum);
    		
    		
		}
    	
    	
    	
    	
    	
    	
    	
    	
    	/* console.log(result)
    	console.log(formatprice)
    	console.log(ratio)
    	console.log(formatfprice)
    	console.log(count) */
    	
    	
    	
    	
    	
    	
    }
    
    /* 수량,상품가격,혜택,최종상품금액 */
    /* cartCheck(${cart.cartNo}) */
    
    
    
    
    
    
    
    
    
    
    
    /* function cancell(cartNo){
    	let cartProductCount = $('.cartProductCount'+cartNo).val();
    	let result = $('#result'+cartNo).val(); 
    	$('.result'+cartNo).val(result);
    	$('#myModal'+cartNo).modal('hide');
    }

    function changeAmount(cartNo){
    	let result = $('.result'+cartNo).val();
    	console.log(result)
    	
    	$.ajax({
    		url : 'amountUpdate',
   			type : 'get',
			data : {cartNo,result},
			dataType : 'json',
			success : function(data){
				
				if (data > 0) {
					alert('수량이 정상적으로 변경되었습니다!^^')
					$('#result'+cartNo).val(result);
		    		$('#myModal'+cartNo).modal('hide');
				}else{
					alert('실패')
				}
			},
			error : function(error){
				alert('error')
			}
    	})
    } */
    
    
    
    
    
    </script>
</head>
<body>

	<span>${memberInfo}</span>
	<br><br><br><br><br>
	<c:forEach var="clist" items="${clist}">
	<h1>${clist.rowNo}</h1>
	<span>${clist}</span>
	<br><br>
	</c:forEach>
	
<div class="container" style="height: 100px;"></div>

<div id="cart-wrap"><!-- 전체 div 시작 -->
    
    <div class="container">
        <div id="cart-sup">
            <span class="sequence">01장바구니</span>
            <i class="fa-solid fa-angle-right"></i>
            <span>02주문서작성/결제</span>
            <i class="fa-solid fa-angle-right"></i>
            <span>03주문완료</span>
        </div>
        <p class=" ordercomplete-page"></p>
    </div>

    <div class="container cart-tr"><!-- content div 시작 -->
        <form action="" method="" class="form-inline">
            <table class="table-hover table cart-table" >
                <tr>
                    <th class="align-middle">
                        <input type="checkbox">
                    </th>
                    <th class="align-middle"></th>
                    <th class="align-middle">상품 정보</th>
                    <th class="align-middle">수량</th>
                    <th class="align-middle">상품금액</th>
                    <th class="align-middle" colspan="2">혜택</th>
                    <th class="align-middle">최종상품금액</th>
                    <!-- <th class="align-middle">배송비</th> -->
                </tr>
                
                <c:forEach var="cart" items="${clist}" varStatus="status">
                
                <c:set var="finalPrice" value="${(cart.cartProduct.productPrice-((cart.benefitList.benefitRatio/100)*cart.cartProduct.productPrice))*cart.cartProductCount}"/>
                
                <tr>
                    <th class="align-middle">
                        <input type="checkbox" class="th-input" id="cartCheck${cart.cartNo}" onclick="cartCheck(${cart.cartNo})" value="${cart.cartNo}">
                    </th>
                    <th class="align-middle">
                        <img src="https://cdn.pixabay.com/photo/2023/02/23/17/56/turtle-7809341_640.jpg" width="80px">
                    </th>

                    <th class="align-middle">
                        <sub>
                            <a href="">
                            	<span>[${cart.cartProduct.productBrand}]</span>
                            	<span>${cart.cartProduct.productEngName}</span><br>
                                <span>${cart.cartProduct.productTitle}</span><br>
                                <span>[옵션사이즈 ${cart.cartProduct.productOptionSize}ml]</span><br>
                            </a>
                        </sub>
                    </th>
                    <th class="align-middle" width="150px" class="modalth">
                        <input class="cartNo" type="hidden" value="${cart.cartNo}">
                        <input class="hiddenproductAmount${cart.cartNo}" type="hidden" value="${cart.cartProduct.productAmount}">
                        <button class="del" type="button" onclick="del(${cart.cartNo})" style="width: 30px;">-</button>
                        <input id="result${cart.cartNo}" type="text" value="${cart.cartProductCount}" style="width: 35px; text-align: center;" readonly >
                        <button class="add" type="button" onclick="add(${cart.cartProduct.productAmount},${cart.cartProductCount},${cart.cartNo})" style="width: 30px;">+</button><br>
                        
                        
                        
                        <%-- <button type="button" id="amountUpdatebtn${cart.cartNo}" class="btn btn-primary btn-sm" style="margin-top: 10px" data-toggle="modal" data-target="#myModal${cart.cartNo}">>수량변경하기</button><br> --%>
                         <%-- <div class="modal fade" id="myModal${cart.cartNo}" >
						    <div class="modal-dialog modal-sm modal-dialog-centered">
						      <div class="modal-content">
						        <div class="modal-body">
						          <img src="https://cdn.pixabay.com/photo/2019/04/06/19/22/glass-4108085__480.jpg" class="img-thumbnail mx-auto d-block" alt="Cinque Terre" width="304" height="236">
						          <p class="po_Option">[${cart.cartProduct.productOptionSize}]</p>
						          <span>현재 재고 : </span> 
						          <span class="po_Amount${cart.cartNo}">${cart.cartProduct.productAmount}</span>개<br>
						           <button class="del" type="button" onclick="del(${cart.cartNo})" style="width: 30px;">-</button> 
						          	   <input class="cartProductCount${cart.cartNo}" type="hidden" value="${cart.cartProductCount}">
                        			   <input class="result${cart.cartNo}" type="text" value="${cart.cartProductCount}" style="width: 35px; text-align: center;" readonly >
						           <button class="add" type="button" onclick="add(${cart.cartProduct.productAmount},${cart.cartProductCount},${cart.cartNo})" style="width: 30px;">+</button> 
						        </div>
						        <div class="modal-footer">
						          <button type="button" onclick="cancell(${cart.cartNo})"class="btn btn-secondary">취소하기</button>
						          <button type="button" onclick="changeAmount(${cart.cartNo})" class="btn btn-secondary" >변경하기</button>
						        </div>
						        
						      </div>
						    </div>
						  </div>  --%>
                        
                        
                        <!-- 상품이 품절되었을때 보여주기 -->
                        <sub style="color: red">품절상품입니다.</sub>
                    
                    </th>
                    <th class="align-middle" width="150px">
                        <span id="price${cart.cartNo}">
                        	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
	                        value="${cart.cartProduct.productPrice}"
	                        />
	                    </span>원
                    </th>
                    <th class="align-middle" width="150px" colspan="2" >
                    	<c:if test="${not empty cart.benefitList}">
                   			<span>[${cart.benefitList.benefitName}]</span><br>
	                        <span>${cart.benefitList.benefitTitle}</span><br>
	                        <span id="ratio${cart.cartNo}">${cart.benefitList.benefitRatio}</span>%할인
	                    </c:if>
	                    <c:if test="${cart.benefitList == null || empty cart.benefitList}">
	                    	<span>-</span>
	                    </c:if>
                    </th>
                    <th class="align-middle">
	                     <c:if test="${empty cart.benefitList}">
	                        <span id="finalprice${cart.cartNo}">
	                        <fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
	                        value="${cart.cartProductCount*cart.cartProduct.productPrice}"
	                        />
	                        </span>원
	                     </c:if>
	                     <c:if test="${not empty cart.benefitList}">
	                     	<span id="finalprice${cart.cartNo}">
	                     	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
							value="${(cart.cartProduct.productPrice-((cart.benefitList.benefitRatio/100)
							*cart.cartProduct.productPrice))*cart.cartProductCount}" />
	                     	</span>원
                     	 </c:if>
                    </th>
                </tr>
                </c:forEach>
            </table>
            
    </div><!-- content div 끝 -->

            <!-- 보유적립금,쿠폰 시작 -->
            <div class="container">
                <div class="row cartcenter">
                    <div class="col sale-wrap">
                        <div class="col">
                            <h4>님의 보유적립금 : p</h4>
                        </div>
                        <div class="col coupon-wrap">
                            <div class="row">
                                <div class="col">
                                    <input type="text" placeholder="10000point">
                                    <button type="button" class="btn btn-success btn-sm">적립금 사용하기</button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col sale-wrap">
                        <div class="col">
                            <h4>님의 보유쿠폰</h4>
                        </div>
                        <div class="col coupon-wrap">
                            <div class="row">
                                <div class="col-6">
                                    <p class="coupon-p">회원가입5%
                                        <button type="button" class="btn btn-sm btn-success">적용하기</button>
                                    </p>
                                    <p class="coupon-p">회원가입5%
                                        <button type="button" class="btn btn-sm btn-warning">취소하기</button>
                                    </p>
                                </div>
                                <div class="col-6">
                                    <p class="coupon-p">이벤트10%
                                        <button type="button" class="btn btn-sm btn-success">적용하기</button>
                                    </p>
                                    <p class="coupon-p">이벤트10%
                                        <button type="button" class="btn btn-sm btn-warning">취소하기</button>
                                    </p>
                                </div>
                                <div class="col-6">
                                    <p class="coupon-p">이벤트10%
                                        <button type="button" class="btn btn-sm btn-success">적용하기</button>
                                    </p>
                                    <p class="coupon-p">이벤트10%
                                        <button type="button" class="btn btn-sm btn-warning">취소하기</button>
                                    </p>
                                </div>
                                <div class="col-6">
                                    <p class="coupon-p">이벤트10%
                                        <button type="button" class="btn btn-sm btn-success">적용하기</button>
                                    </p>
                                    <p class="coupon-p">이벤트10%
                                        <button type="button" class="btn btn-sm btn-warning">취소하기</button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row cartcenter">
                    <div class="col caldiv">
                        <div class="row">
                            <div class="col" id="productCount">
                                총<span id="pcspan1"></span>개의 상품금액<span id="pcspan2"></span>원
                            </div>
                            
                            <span class="badge">+</span>

                            <div class="col">
                                <span>배송비<br>0원</span>
                            </div>

                            <span class="badge">-</span>

                            <div class="col">
                                <span>기획전 할인금액<br>1,000원</span>
                            </div>

                            <span class="badge">-</span>

                            <div class="col">
                                <span>적립금 할인<br>1,000원</span>
                            </div>

                            <span class="badge">-</span>

                            <div class="col">
                                <span>쿠폰 할인<br>1,000원</span>
                            </div>

                            <span class="badge">=</span>

                            <div class="col">
                                <span>합계<br>100,000원</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col cart-delete">
                        <button type="button" class="btn btn-primary">
                            선택 상품 삭제
                        </button>
                        <button type="button" class="btn btn-primary">
                            전체 상품 삭제
                        </button>
                    </div>
                    <div class="col cart-shopping">
                        <button type="button" class="btn btn-primary">
                            <i class="fa-solid fa-less-than"></i>
                                쇼핑 계속하기
                        </button>
                    </div>
                    <div class="col cart-order">
                        <button type="button" class="btn btn-primary">
                            선택 상품 주문
                        </button>
                        <button type="button" class="btn btn-primary">
                            전체 상품 주문
                        </button>
                    </div>
                </div>
            </div>
            <!-- 보유적립금,쿠폰 끝 -->
        </form>
    
</div><!-- 전체 div 끝 -->


    <div class="container" style="height: 100px;"></div>	
	
</body>
</html>