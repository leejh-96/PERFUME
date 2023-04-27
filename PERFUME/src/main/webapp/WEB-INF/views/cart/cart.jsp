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
    </style>
    <script type="text/javascript">
    
    /* 장바구니 수량버튼 시작 */
    function add(productAmount,cartProductCount,cartNo){
    	let result = $('#result'+cartNo).val();
    	let ratio = $('#ratio'+cartNo).text();
    	let price = $('#price'+cartNo).text();
    	let finalprice = $('#finalprice'+cartNo).text();
    	/* 포맷데이터 , 제거 */
    	let formatprice = price.split(',').join("");
    	let formatfinalprice = finalprice.split(',').join("");
    	/* 숫자타입으로 형변환 */
    	parprice = parseInt(formatprice);
    	parfinalprice = parseInt(formatfinalprice);
    	
    	if (ratio == "" || ratio == null || ratio == undefined || ( ratio != null && typeof ratio == "object" && !Object.keys(ratio).length ) ) {
			
    		/* 혜택이 없고 체크된 상태 체크 */
    		if (productAmount > result) {
    			console.log('비어있음')
       			++result
       			console.log(result)
       			$('#result'+cartNo).val(result);
       			let won = result * parprice;
       			let formmat = won.toLocaleString();
       			$('#finalprice'+cartNo).text(formmat);
			}else if (productAmount < result) {
				alert('현재 주문할 수 있는 수량은 '+productAmount+'개 입니다.')
			}else {
				alert('현재 주문할 수 있는 수량은 '+productAmount+'개 입니다.')
			} 
   			/* console.log('비어있음')
   			++result
   			console.log(result)
   			$('#result'+cartNo).val(result);
   			let won = result * parprice;
   			let formmat = won.toLocaleString();
   			$('#finalprice'+cartNo).text(formmat); */
			
    	}else {
			console.log('안비어있음')
			if (productAmount > result) {
    		++result
    		console.log(result)
    		$('#result'+cartNo).val(result);
    		
    		let won = (result*parprice)-(((ratio/100)*parprice)*result);
    		
    		let formmat = new Intl.NumberFormat('ko-kr').format(won)
    		
    		 $('#finalprice'+cartNo).text(formmat); 
    		
			}else if (productAmount < result) {
				alert('현재 주문할 수 있는 수량은 '+productAmount+'개 입니다.')
			}else {
				alert('현재 주문할 수 있는 수량은 '+productAmount+'개 입니다.')
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
    
    function cartAllCheck(){
    		
   		if ($('#cartAll').prop('checked')) {
   	       	 $('input:checkbox[name="cartCheckBox"]').each(function() {
   	       		 if (this.checked == false) {
   	       			this.checked = true;
  	       			 let value = this.value;
  	       			 
  	       			 let value2 = parseInt(value);
  	       			 
  	         	     cartCheck(value2);
   					}
   	       	 	})
   			}else {
   				$('input:checkbox[name="cartCheckBox"]').each(function() {
   				  if (this.checked == true) {
   					  this.checked = false;
   					  let value = this.value;
   					  
   					  let value2 = parseInt(value);
 	       			 
 	         	     cartCheck(value2);
   					 }
   	    	      $('#pcspan1').text('');
   	    	      $('#pcspan2').text('');
   	    	      $('#ratio').text('');
   	       	 	})
   			}
    }
    
    /* 초기화 변수들 */
    let sum = 0;
    let pricesum = 0;
    let ratiosum = 0;
    let finalprice = 0;
    
     function cartCheck(cartNo){ 
    	
    	let finalresult = $('#final').text(); 
    	let finalresult2 = finalresult.split(',').join("");
    	let finalresult3 = parseInt(finalresult2);
    	finalresult3 = 0;
    	
    	let result = $('#result'+cartNo).val();
    	let price = $('#price'+cartNo).text();
    	let ratio = $('#ratio'+cartNo).text();
    	let finalprice = $('#pcspan2').text();
    	let formatprice = price.split(',').join("");
    	let formatfprice = finalprice.split(',').join("");
    	let parseresult = parseInt(result);
		let parseformatprice = parseInt(formatprice);
		let parseformatfinalprice = parseInt(formatfprice);
		let parseratio = parseInt(ratio); 
		let delivery = 90000;
		
    	/* 같은 체크박스를 체크했을때 처리로직 */
    	if ($('#cartCheck'+cartNo).prop('checked')) {
    		
    		$('.caldiv').css('display','block')////계산 div
    		
    		$('#cartCheck'+cartNo).attr('checked',true)
    		$('#del'+cartNo).attr('disabled',true);
    		$('#add'+cartNo).attr('disabled',true);
    		$('#cartAll').prop('checked',true)
			console.log('체크')
			
			/* 기획전 할인 여부체크 */
			if (ratio == "" || ratio == null || ratio == undefined || ( ratio != null && typeof ratio == "object" && !Object.keys(ratio).length ) ) {
    			sum += parseresult;
    			pricesum += parseresult*parseformatprice;
    			
    			if (pricesum > delivery) {
    				$('#delivery').text(0);
    				$('#ratio').text(new Intl.NumberFormat('ko-kr').format(ratiosum));
    	    		$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
    	    		$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
    	    		let finalresult = $('#pcspan2').text();
    	    		let finalresult2 = finalresult.split(',').join("");
    	        	let finalresult3 = parseInt(finalresult2);
    	        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+0));
				}else {
					$('#delivery').text(6000);
					$('#ratio').text(new Intl.NumberFormat('ko-kr').format(ratiosum));
		    		$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
		    		$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
		    		let finalresult = $('#pcspan2').text();
    	    		let finalresult2 = finalresult.split(',').join("");
    	        	let finalresult3 = parseInt(finalresult2);
    	        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+6000));
				}
	    		
    		}else {
    			sum += parseresult;
    			pricesum += (parseformatprice*parseresult);
    			ratiosum += (((parseratio/100)*parseformatprice)*parseresult);
    			
    			if (pricesum > delivery) {
    				$('#delivery').text(0);
    				$('#ratio').text(new Intl.NumberFormat('ko-kr').format(ratiosum));
        			$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
    	    		$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
    	    		let finalresult = $('#pcspan2').text();
    	    		let finalresult2 = finalresult.split(',').join("");
    	        	let finalresult3 = parseInt(finalresult2);
    	        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+0));
				}else {
					$('#delivery').text(6000);
					$('#ratio').text(new Intl.NumberFormat('ko-kr').format(ratiosum));
	    			$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
		    		$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
		    		let finalresult = $('#pcspan2').text();
		    		let finalresult2 = finalresult.split(',').join("");
		        	let finalresult3 = parseInt(finalresult2);
		        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+6000));
				}
    			
			} 
			
		}else {
			
			let checkCount = $('input:checkbox[name=cartCheckBox]:checked').length;
			console.log('checked : '+checkCount);
			
			if (checkCount == 0) {
				$('.caldiv').css('display','none')////계산 div
			}else {
				$('.caldiv').css('display','block')////계산 div
			}
			 
			$('#cartCheck'+cartNo).attr('checked',false)
			$('#del'+cartNo).attr('disabled',false);
    		$('#add'+cartNo).attr('disabled',false);
			console.log('체크해제')
			
			$('#cartAll').prop('checked',false)
			
			/* 기획전 할인 여부체크 */
			if (ratio == "" || ratio == null || ratio == undefined || ( ratio != null && typeof ratio == "object" && !Object.keys(ratio).length ) ) {
				
				if (sum < 0 || pricesum < 0 ) {
					sum = 0;
					pricesum = 0;
					$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
					$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
					let finalresult = $('#pcspan2').text();
		    		let finalresult2 = finalresult.split(',').join("");
		        	let finalresult3 = parseInt(finalresult2);
		        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+0));
				}else {
					sum -= parseresult;
					pricesum -= parseresult*parseformatprice;
					$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
					$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
					let finalresult = $('#pcspan2').text();
		    		let finalresult2 = finalresult.split(',').join("");
		        	let finalresult3 = parseInt(finalresult2);
		        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+0));
					
				}
    		
    		}else {
    			
    			if (sum < 0 || pricesum < 0 || ratiosum < 0) {
    				sum = 0;
    				pricesum = 0;
    				ratiosum = 0;
    				$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
    	    		$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
    	    		$('#ratio').text(new Intl.NumberFormat('ko-kr').format(ratiosum));
				}else {
					sum -= parseresult;
	    			pricesum -= (parseformatprice*parseresult);
	    			ratiosum -= (((parseratio/100)*parseformatprice)*parseresult);
	    			
	    			$('#pcspan1').text(new Intl.NumberFormat('ko-kr').format(sum)); 
		    		$('#pcspan2').text(new Intl.NumberFormat('ko-kr').format(pricesum));
		    		$('#ratio').text(new Intl.NumberFormat('ko-kr').format(ratiosum));
		    		let finalresult = $('#pcspan2').text();
		    		let finalresult2 = finalresult.split(',').join("");
		        	let finalresult3 = parseInt(finalresult2);
		        	$('#final').text(new Intl.NumberFormat('ko-kr').format(finalresult3-ratiosum+0));
		    		
				}
    			
			} 
		}
     }
     
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
    	console.log('pointremember : '+pointremember)
    	pointremember = 0;
    	
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
					
			  	if ($('#coupon'+benefitNo).css('display')=='block' && this.checked == true) {
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
		        	
		        	console.log('coupondis'+coupondis)
		        	
		        	couponTotal += coupondis;
		        	
		        	$('#coupon-sale2').text(new Intl.NumberFormat('ko-kr').format(couponTotal));
	    			
		        	console.log('couponTotal'+couponTotal)
		        	
		        	parseformatfinalprice-couponTotal
		        	
		        	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseformatfinalprice-couponTotal));
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
   
     function selectDelete(memberNo){
    	 
    	 console.log('memberNo : '+memberNo)
    	 
    	 if (!confirm("선택하신 장바구니 목록을 삭제하시겠습니까?")){
    		 
    		 return false;
    	 }else {
    		 
    		 if ($('input:checkbox[name=cartCheckBox]').is(':checked')==false) {
    			 alert('장바구니 목록을 선택해주세요!')
					return false;
			 }
    		 
    		 $('input:checkbox[name=cartCheckBox]').each(function (index) {
 				if($(this).is(":checked")==true){
 			    	console.log('cartNo : '+$(this).val());
 			    	let cartNo = $(this).val();
 			    	
 	    			 $.ajax({
 	 	    			url : 'cart/cartDelete',
 	 	    			type : 'post',
 	 	    			data : {memberNo,cartNo},
 	 	    			dataType : 'json',
 	 	    			success : function(result){
 	 	    				if (result > 0) {
 	 	    					console.log('성공')
 	 	    					let result = $('#result'+cartNo).val();
 	 	    					console.log('selectDelete result : '+result)
 	 	    					let parseresult = parseInt(result);
 	 	    					sum -= parseresult;
 	 	    					let price = $('#price'+cartNo).text();
 	 	    					let finalprice = $('#finalprice'+cartNo).text();
			 			    	let ratio = $('#ratio'+cartNo).text();
			 			    	let parseratio = parseInt(ratio);
			 			    	let formatprice = price.split(',').join("");
			 			    	let formatfprice = finalprice.split(',').join("");
			 			    	let parseformatprice = parseInt(formatprice);
			 					let parseformatfinalprice = parseInt(formatfprice);
			 					pricesum -= (parseformatprice*parseresult);
 				    			ratiosum -= (((parseratio/100)*parseformatprice)*parseresult);
 				    			
 	 	    					$('#cartRow'+cartNo).remove(); 
 	 	    					$('#cartAll').prop('checked',false)
 	 	    					
 	 	    					$('#pcspan1').text('');
 	 	    		    	    $('#pcspan2').text('');
 	 	    		    	    $('#ratio').text('');
			 			    	
 								}
 	 	    			},
 	 	    				error : function(result){
 	 	    					console.log('실패')
 	 	    				}
 	 	    			}) 
 			    }
 		  })
    		 
		}
    	 
    	 
    	 
     }
     
     function allDelete(memberNo){
    	 
    	 console.log('memberNo : '+memberNo)
    	 
    	 let allDeleteInfo = {};
    	 
    	 if (!confirm("정말로 장바구니 목록을 전부 삭제하시겠습니까?")){
    		 return false;
    	 }else {
    		 if ($('#cartAll').prop('checked')) {
					
					$('input:checkbox[name=cartCheckBox]').each(function (index) {
		    			 let cartNo = $(this).val();
		    			 $.ajax({
		    	    			url : 'cart/cartDelete',
		    	    			type : 'post',
		    	    			data : {memberNo,cartNo},
		    	    			dataType : 'json',
		    	    			success : function(result){
		    	    				if (result > 0) {
		    	    					console.log('성공')
		    	    					
		    	    					let result = $('#result'+cartNo).val();
 	 	    					console.log('selectDelete result : '+result)
 	 	    					let parseresult = parseInt(result);
 	 	    					sum -= parseresult;
 	 	    					let price = $('#price'+cartNo).text();
 	 	    					let finalprice = $('#finalprice'+cartNo).text();
			 			    	let ratio = $('#ratio'+cartNo).text();
			 			    	let parseratio = parseInt(ratio);
			 			    	let formatprice = price.split(',').join("");
			 			    	let formatfprice = finalprice.split(',').join("");
			 			    	let parseformatprice = parseInt(formatprice);
			 					let parseformatfinalprice = parseInt(formatfprice);
			 					pricesum -= (parseformatprice*parseresult);
 				    			ratiosum -= (((parseratio/100)*parseformatprice)*parseresult);
 				    			
 	 	    					$('#cartRow'+cartNo).remove(); 
 	 	    					$('#cartAll').prop('checked',false)
 	 	    					
 	 	    					$('#pcspan1').text('');
 	 	    		    	    $('#pcspan2').text('');
 	 	    		    	    $('#ratio').text('');
		    	    			
									}
		    	    			},
		    	    				error : function(result){
		    	    					console.log('실패')
		    	    				}
		    	    			}) 
		    		 })
		    		
			 }else{
				 $('#cartAll').trigger('click',true)
					 $('input:checkbox[name=cartCheckBox]').each(function (index) {
		    			 console.log('cartNo : '+$(this).val());
		    			 let cartNo = $(this).val();
		    			 $.ajax({
		 	    			url : 'cart/cartDelete',
		 	    			type : 'post',
		 	    			data : {memberNo,cartNo},
		 	    			dataType : 'json',
		 	    			success : function(result){
		 	    				if (result > 0) {
		 	    					console.log('성공')
		 	    					$('#cartRow'+cartNo).css('display','none')
									}
		 	    			},
		 	    				error : function(result){
		 	    					console.log('실패')
		 	    				}
		 	    			}) 
		    		 })
					 
			 }
		}
    	 
     }
     
     function goback(){
    	 window.history.back();
     }
     
     function selectOrder(memberNo){
    	 
    	 if (!confirm("선택하신 장바구니 목록을 주문하시겠습니까?^_^")){
			
    		return false; 
    	 }else { 
    		 
    		 if ($('input:checkbox[name=cartCheckBox]').is(':checked')==false) {
    			 alert('장바구니 목록을 선택해주세요!')
					return false;
			 }
    		 
    		 $('input:checkbox[name=cartCheckBox]').each(function (index) {
  				if($(this).is(":checked")==false){
  			    	console.log('cartNo : '+$(this).val());
  			    	let cartNo = $(this).val();
  			    	$('#cartRow'+cartNo).remove();
    		 
  				}else {
  					$('#cartAll').attr('disabled',true)
  					$('input:checkbox[name=cartCheckBox]').attr('disabled',true)
  					$('#cartSequence').removeClass('sequence')
  					$('#orderSequence').addClass('sequence')
  					$('.hiddenOrder').css('display','block')
  					$('.hiddenbtn').css('display','none')
  					$('.coupontry').css('display','inline-block')
  					$('#pointtry').css('display','inline-block')
  					$('#reset').css('display','inline-block')
  					$('#pointmsg').css('display','none')
  					$('#pointInput').css('display','block')
  					let delivery = $('#pcspan2').text();
  					let formatdelivery = delivery.split(',').join("");
 			    	let parseformatdelivery = parseInt(formatdelivery);
		        	console.log('order = parseformatdelivery : '+parseformatdelivery)
 			    	
 			    	if (parseformatdelivery > 90000) {
	    		 		$('#orderDspan').text('-배송비 무료-');
					}else {
					 	$('#orderDspan').text('-기본배송비 6000원-');
					}
		        	
		        	let finaltext = $('#final').text();
		        	let formatfinaltext = finaltext.split(',').join("");
 			    	let parseforformatfinaltext = parseInt(formatfinaltext);
 			    	$('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseforformatfinaltext));
  					
				}
    		}) 
    		 let ratio = $('#ratio').text();
     	     console.log(ratio)
        	 $('#plan-sale2').text(ratio);
		 } 
     }
     
     
     function allOrder(memberNo){
    	 
    	 if (!confirm("장바구니 상품을 모두 주문하시겠습니까?^_^")){
    		 return false;
    	 }else {
    		 
    		 if ($('#cartAll').prop('checked')) {
    			 $('#cartAll').attr('disabled',true)
    			 $('input:checkbox[name=cartCheckBox]').attr('disabled',true)
    			 $('#cartSequence').removeClass('sequence')
    			 $('#orderSequence').addClass('sequence') 
    			 $('.hiddenOrder').css('display','block')
    			 $('input:checkbox[name=cartCheckBox]').each(function (index){
    				 if (this.checked == false) {
	   					  this.checked = true;
	   					  let value = this.value;
	   					  let value2 = parseInt(value);
	 	         	      cartCheck(value2);
	   			     }
    				 $('.hiddenbtn').css('display','none')
    	    	     $('.coupontry').css('display','inline-block')
    				 $('#pointtry').css('display','inline-block')
    				 $('#reset').css('display','inline-block')
    				 $('#pointmsg').css('display','none')
    				 $('#pointInput').css('display','block')//
    				 let delivery = $('#pcspan2').text();
    				 let formatdelivery = delivery.split(',').join("");
    		    	 let parseformatdelivery = parseInt(formatdelivery);
    		    	 
    		    	 if (isNaN(parseformatdelivery)) {
    		        		console.log('couponReset = parseformatdelivery : '+parseformatdelivery)
    		        		parseformatdelivery = 0;
    				 }
    		    	 console.log('order = parseformatdelivery : '+parseformatdelivery)
    		    	 
    		    	 if (parseformatdelivery > 90000) {
			    		 $('#orderDspan').text('-배송비 무료-');
					 }else {
						 $('#orderDspan').text('-기본배송비 6000원-');
					 }
    		    	 
    		    	 let finaltext = $('#final').text();
   		        	 let formatfinaltext = finaltext.split(',').join("");
   			    	 let parseforformatfinaltext = parseInt(formatfinaltext);
   			    	 $('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseforformatfinaltext));
    			 })
			}else {
				
				$('#cartAll').trigger('click',true)
	    		 $('#cartAll').attr('disabled',true) 
	    		 $('input:checkbox[name=cartCheckBox]').attr('disabled',true)
	    		 $('#cartSequence').removeClass('sequence')
				 $('#orderSequence').addClass('sequence')  
				 $('.hiddenOrder').css('display','block')
				 $('#pointInput').css('display','block')//
	    		 $('input:checkbox[name=cartCheckBox]').each(function (index){
			    	     $('.hiddenbtn').css('display','none')
			    	     $('.coupontry').css('display','inline-block')
						 $('#pointtry').css('display','inline-block')
						 $('#reset').css('display','inline-block')
						 $('#pointmsg').css('display','none')
						 let delivery = $('#pcspan2').text();
						 let formatdelivery = delivery.split(',').join("");
				    	 let parseformatdelivery = parseInt(formatdelivery);
		    	 
				    	 if (isNaN(parseformatdelivery)) {
				        		console.log('couponReset = parseformatdelivery : '+parseformatdelivery)
				        		parseformatdelivery = 0;
						 }
		    	 
		    	 		 console.log('order = parseformatdelivery : '+parseformatdelivery)
		    	 
				    	 if (parseformatdelivery > 90000) {
				    		 $('#orderDspan').text('-배송비 무료-');
						 }else {
							 $('#orderDspan').text('-기본배송비 6000원-');
						 }
		    	 
				    	 let finaltext = $('#final').text();
			        	 let formatfinaltext = finaltext.split(',').join("");
				    	 let parseforformatfinaltext = parseInt(formatfinaltext);
				    	 $('#finaltotal').text(new Intl.NumberFormat('ko-kr').format(parseforformatfinaltext));
	    			 
	    		})
			}
		}
    	 let ratio = $('#ratio').text();
 	     console.log(ratio)
    	 $('#plan-sale2').text(ratio);
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
							            		/* contentType: 'application/json; charset=utf-8', */
							            		dataType : 'json',
							            		success : function(result){
							            			if (result > 0) {
								            			console.log('적립금 업데이트 완료')
								            			$.ajax({
															url : '${path}/order/plusPoint/'+plusPoint+'/'+memberNo+'/',
															type : 'GET',
															/* contentType: 'application/json; charset=utf-8', */
															data : {plusPoint,memberNo},
															dataType : 'json',
															success : function(result){
																if (result > 0) {
																	console.log('적립금 적립 업데이트 완료')
																}
															},
											        		error : function(){
											        			/* $('#myModal').modal('hide') */
											        			console.log('적립금 업데이트 오류')
											        		}
														})
													}
							            		},
							            		error : function(){
							            			/* $('#myModal').modal('hide') */
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
		        		   					    let value = this.value;
		        		   					    let cartNo = parseInt(value);//카트번호
		        		 	         	        let hiddenProductNo = $('#hiddenProductNo'+cartNo).val();//상품번호
			        		 	         	    console.log('hiddenProductNo : '+hiddenProductNo)
						        				console.log('cartNo : '+cartNo)//카트번호
						        				orderNo;//주문번호
						        				console.log('orderNo : '+orderNo)
						        				let productNo = $('#hiddenProductNo'+cartNo).val();//상품번호
						        				console.log('productNo : '+productNo)
						        				let result = $('#result'+cartNo).val();
						        				let orderCount = parseInt(result);//상품수량
						        				let option = $('#optionsize'+cartNo).text();
						        				let orderSize = parseInt(option);//옵션사이즈
						        				let finalPrice = $('#finalprice'+cartNo).text();
						        				let formatfinalPrice = finalPrice.split(',').join("");
						     			        let orderPrice = parseInt(formatfinalPrice);//상품가격
						     			        let orderList = {orderNo,productNo,orderCount,orderSize,orderPrice,cartNo};//하나의 주문상품 객체
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
				        								/* $('#myModalorder').modal('hide') */
				        								console.log('order-product-error 결제에 실패하였습니다.')
				        							}
				        						})
				        					 }
				        				})
				        			},
				        			error : function(error){
				        				 /* $('#myModalorder').modal('hide')  */
				        				console.log('order-insert-error')
				        			}
				        		})
				        		payment = '';
				        		 /* $('#myModalorder').modal('hide') */  
 				        		window.location.href='${path}/cart/orderList/'+order.orderNo+'/'+order.memberNo+'/'+plusPoint;
 				        	} else {
				        		//결제 실패 로직
				        		/*  $('#myModalorder').modal('hide')  */
				        		alert("결제에 실패하였습니다.");
				        	}
				        });
					});
  		   }else {
			return false;
		  }
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
  		$("#agreeAll").change(function(){
  	        if($("#agreeAll").is(":checked")){
  	        	 $('#agree1').attr('checked',true)
  	      		 $('#agree2').attr('checked',true)
  	        }else{
  	        	 $('#agree1').attr('checked',false)
  	     		 $('#agree2').attr('checked',false)
  	        }
  	    });
  	}
  	 
  /* 아임포트 결제연동  끝*/
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>

<div id="cart-wrap"><!-- 전체 div 시작 -->
    
	    <div class="container">
	    
	    	<!-- <div class="modal fade" id="myModalorder">
            	<div class="spinner-border d-flex justify-content-center" style="width: 10rem; height: 10rem;" role="status">
                    <span class="sr-only">결제가 진행 중입니다~~~~~</span>
                </div>
          	</div>  -->
	    
	      	<div id="cart-sup">
	          	<span id="cartSequence" class="sequence">01장바구니</span>
	          	<i class="fa-solid fa-angle-right"></i>
	          	<span id="orderSequence">02주문서작성/결제</span>
	          	<i class="fa-solid fa-angle-right"></i>
	          	<span>03주문완료</span>
	      	</div>
		      <p class=" ordercomplete-page"></p>
	    </div>

	    <div class="container cart-tr"><!-- content div 시작 -->
	        <input id="memberInfo" type="hidden" value="${memberInfo}">
	        <input id="clist" type="hidden" value="${clist}">
	        <input class="cartNo" type="hidden" value="${cart.cartNo}">
	        <input class="hiddenproductAmount${cart.cartNo}" type="hidden" value="${cart.cartProduct.productAmount}">
	        <input id="hiddenPoint" type="hidden" value="${memberInfo.memberPoint}">
	        
	            <table class="table-hover table cart-table" >
	                <tr>
	                    <th class="align-middle">
	                        <input type="checkbox" id="cartAll" onclick="cartAllCheck()">
	                    </th>
	                    <th class="align-middle"></th>
	                    <th class="align-middle">상품 정보</th>
	                    <th class="align-middle">수량</th>
	                    <th class="align-middle">상품금액</th>
	                    <th class="align-middle" colspan="2">혜택</th>
	                    <th class="align-middle">최종상품금액</th>
	                </tr>
	                
	                <c:forEach var="cart" items="${clist}" varStatus="status">
	                <c:set var="finalPrice" value="${(cart.cartProduct.productPrice-((cart.benefitList.benefitRatio/100)*cart.cartProduct.productPrice))*cart.cartProductCount}"/>
	                
	                <tr id="cartRow${cart.cartNo}">
	                    <th class="align-middle">  
	                    	<c:if test="${cart.cartProduct.productAmount != 0}">
								<input id="hiddenProductNo${cart.cartNo}" type="hidden" value="${cart.productNo}">   
		                        <input type="checkbox" name="cartCheckBox" class="th-input" id="cartCheck${cart.cartNo}" onclick="cartCheck(${cart.cartNo})" value="${cart.cartNo}">
	                  		</c:if>
	                  		<c:if test="${cart.cartProduct.productAmount == 0}">
	                  			<span class="zerostock">품절</span> 
	                  		</c:if>
	                    </th>
	                    <th class="align-middle">
	                    	<c:if test="${ clist[status.index].cartProduct.productRfName eq null}">
	                    		등록된 사진이 없습니다.
	                    	</c:if>
	                    	<c:if test="${ not empty clist[status.index].cartProduct.productRfName}">
	                    		<img src="${path}/upload/product/${clist[status.index].cartProduct.productRfName}" width="150px">
	                    	</c:if>
	                    </th>
	                    <th class="align-middle">
	                        <sub>
	                            <a href="${path}/product/detail?no=${cart.productNo}">
	                            	<span>[${cart.cartProduct.productBrand}]</span>
	                            	<span>${cart.cartProduct.productEngName}</span><br>
	                                <span>${cart.cartProduct.productTitle}</span><br>
	                                [옵션사이즈 <span id="optionsize${cart.cartNo}">${cart.cartProduct.productOptionSize}</span>ml]<br>
	                                <span>[현재 재고 ${cart.cartProduct.productAmount}개]</span>
	                            </a>
	                        </sub>
	                    </th>
	                    <th class="align-middle" width="150px">
	                    	<!-- 상품 수량이 있을때 보여주기 -->
		                    <c:if test="${cart.cartProduct.productAmount != 0}">
		                        <button class="btngroup" name="btngroup" id="del${cart.cartNo}" type="button" onclick="del(${cart.cartNo})" style="width: 30px;">-</button>
		                        <input name="readresult" id="result${cart.cartNo}" type="text" value="${cart.cartProductCount}" style="width: 35px; text-align: center;" readonly >
		                        <button class="btngroup" name="btngroup" id="add${cart.cartNo}" type="button" onclick="add(${cart.cartProduct.productAmount},${cart.cartProductCount},${cart.cartNo})" style="width: 30px;">+</button>
		                    </c:if>  
	                        <!-- 상품이 품절되었을때 보여주기 -->
	                        <c:if test="${cart.cartProduct.productAmount == 0}">
		                        <input name="readresult" id="result${cart.cartNo}" type="text" value="${cart.cartProductCount}" style="width: 35px; text-align: center;" readonly >
		                        <br>
	                        	<sub class="zerostock">품절상품입니다.</sub>
	                    	</c:if>
	                    </th>
	                    <th class="align-middle" width="150px">
	                        <span id="price${cart.cartNo}">
	                        	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${cart.cartProduct.productPrice}"/>
		                    </span>원
	                    </th>
	                    <th class="align-middle" width="150px" colspan="2">
	                    	<c:if test="${not empty cart.benefitList}">
	                    		<p>[${cart.benefitList.benefitName}]</p>
	                    		<p><mark>${cart.benefitList.benefitTitle}</mark></p>
	                    		<span id="ratio${cart.cartNo}">${cart.benefitList.benefitRatio}</span>% 할인이벤트!!
		                    </c:if>
		                    <c:if test="${cart.benefitList == null || empty cart.benefitList}">
		                    	<span>-</span>
		                    </c:if>
	                    </th>
	                    <th class="align-middle">
		                     <c:if test="${empty cart.benefitList}">
		                        <span id="finalprice${cart.cartNo}">
		                        	<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${cart.cartProductCount*cart.cartProduct.productPrice}"/>
		                        </span>원
		                     </c:if>
		                     <c:if test="${not empty cart.benefitList}">
		                     	<span id="finalprice${cart.cartNo}">
		                     		<fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${(cart.cartProduct.productPrice-((cart.benefitList.benefitRatio/100)*cart.cartProduct.productPrice))*cart.cartProductCount}"/>
		                     	</span>원
	                     	 </c:if>
	                    </th>
	                </tr>
	                </c:forEach>
	            </table>
	    </div><!-- content div 끝 -->

        <!-- 보유적립금,쿠폰 시작 -->
        <div class="container">
             <div class="row cartcenter"><!-- 모달 DIV 시작 -->
             	<div id="coupon_point-wrap">
	             	<span>나의 포인트-쿠폰
	         			<button type="button" id="amountUpdatebtn${cart.cartNo}" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#myModal2" >자세히보기</button>
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
					      	  				<p id="pointmsg">적립금사용과 쿠폰사용은<br>주문페이지에서 사용이 가능합니다.</p>
						      	  			<p id="pointInputPtag">
						      	    			<input id="pointInput" type="text" placeholder="${memberInfo.memberPoint}point" name="memberPoint" style="display: none; text-align: center;">
	                              			</p>
		                              		<button id="pointtry" type="button" class="btn btn-success btn-sm" onclick="pointCheck()" style="display: none;">적립금 사용하기</button>
		                              		<button id="reset" type="reset" class="btn btn-primary btn-sm" onclick="pointReset()" style="display: none;">취소하기</button>
	     								</div>
	    							</div>
	    							<div class="col">
	    								<hr></hr>
    									<h4>${memberInfo.memberName}님의 보유쿠폰</h4>
    									<c:if test="${not empty memberInfo.memberBenefitList}">
		                        			<c:forEach var="memberCoupon" items="${memberInfo.memberBenefitList}">
					                            <div class="col">
					                            	<div class="coupondiv" id="coupon${memberCoupon.benefitNo}">
														<p class="coupon-p">${memberCoupon.benefitTitle}:${memberCoupon.benefitRatio}%</p>
														<p class="coupon-p">기간 : <fmt:formatDate value="${memberCoupon.benefitCreateDate}" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${memberCoupon.benefitEndDate}" pattern="yyyy-MM-dd" /></p>
						 								<button type="button" class="btn btn-sm btn-success coupontry" onclick="couponCheck(${memberInfo.memberNo},${memberCoupon.benefitNo},${memberCoupon.benefitRatio})" style="display: none;">적용하기</button>
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
            
            <div class="row cartcenter">
                <div class="col caldiv" style="display: none">
                	<div class="row zeroInfodiv">*품절상품을 제외한 가격입니다*</div>
                    <div class="row">
                        <div class="col" id="productCount">
                            총<span id="pcspan1"></span>개의 <br> 상품금액<span id="pcspan2"></span>원
                        </div>
                        <span class="badge">+</span>

                        <div class="col">
                            배송비<span id="delivery"></span>원
                        </div>

                        <span class="badge">-</span>

                        <div class="col">
                            <span>기획전 할인금액</span><br><span id="ratio"></span>원
                        </div>
                        <span class="badge">=</span>

                        <div class="col">
                            합계<span id="final"></span>원
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col cart-delete hiddenbtn">
                    <button type="button" class="btn btn-primary hiddenbtn" onclick="selectDelete(${memberInfo.memberNo})">
                        선택 상품 삭제
                    </button>
                    <button type="button" class="btn btn-primary hiddenbtn" onclick="allDelete(${memberInfo.memberNo})">
                        전체 상품 삭제
                    </button>
                </div>
                <div class="col cart-shopping">
                    <button type="button" class="btn btn-primary" onclick="goback()">
                        <i class="fa-solid fa-less-than"></i>
                            쇼핑 계속하기
                    </button>
                </div>
                <div class="col cart-order hiddenbtn">
                    <button type="button" class="btn btn-primary hiddenbtn" onclick="selectOrder(${memberInfo.memberNo})">
                        선택 상품 주문
                    </button>
                    <button type="button" class="btn btn-primary hiddenbtn" onclick="allOrder(${memberInfo.memberNo})">
                        전체 상품 주문
                    </button>
                </div>
            </div>
        </div>
        <!-- 보유적립금,쿠폰 끝 -->
        
        <!-- 주문자정보,배송정보 시작 table -->
        <div class="container hiddenOrder" style="display: none;">
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
                        <span id="save-sale">적립금 사용 : <span id="save-sale2"></span>point</span>
                        <span id="coupon-sale">쿠폰 사용 할인 : <span id="coupon-sale2"></span>원</span>
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
    	<div class="container hiddenOrder" style="display: none;">
	    	<div class="container payway">
	              <h4>결제방법</h4>
	              <div class="row">
	                  <div class="col-8 pay-list container">
	                      <input id="payment" type="hidden" name="pay" value="${memberInfo.memberNo}"><!-- 회원테스트 -->
	                      <!-- <input id="payment2" type="hidden" name="pay" value="">비회원테스트 -->
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
</body>
</html>