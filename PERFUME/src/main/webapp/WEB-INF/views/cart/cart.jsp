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
        display: flex;
        justify-content:space-between;
        align-content: center;
    }
    .payway{
        margin-bottom: 30px;
    }
    .ordercomplete-page{
        height: 3px;
        background-color: orangered;
    }
    /* 주문서 css 끝 */
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
	    		 $('input:checkbox[name=cartCheckBox]').each(function (index){
			    	     $('.hiddenbtn').css('display','none')
			    	     $('.coupontry').css('display','inline-block')
						 $('#pointtry').css('display','inline-block')
						 $('#reset').css('display','inline-block')
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
       
     function kakaopay(){
   		 if (confirm('카카오페이로 결제를 진행하시겠습니까?')) {
   	  			$('#kakaopay').css('disabled',true)
   	  		 	payment = $('#kakaopay').val();//카카오페이 value가 들어잇음
   	  		 	console.log('payment : '+payment)
   			}
     }
  	
  	 function pay() {
  		   if (confirm('결제를 진행하시겠습니까?')) {
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
				   let recipientAddr = $('#buyer_addr').val();//주문자 주소
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
			       if (memberNo != 0) {//회원검증
			    	   if (point != 0) {//회원포인트차감
			    		   $.ajax({
			            		url : '${path}/order/pointUpdate/'+point+'/'+memberNo+'/',
			            		type : 'GET',
			            		data : {point,memberNo},
			            		/* contentType: 'application/json; charset=utf-8', */
			            		success : function(result){
			            			if (result > 0) {
				            			console.log('적립금 업데이트 완료')
				            			$.ajax({
											url : '${path}/order/plusPoint/'+plusPoint+'/'+memberNo+'/',
											type : 'GET',
											/* contentType: 'application/json; charset=utf-8', */
											data : {plusPoint,memberNo},
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
				        		//결제 성공 로직
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
			        					$('input:checkbox[name=cartCheckBox]').each(function(index){
			        						if (this.disabled == true) {
		        		   					    let value = this.value;
		        		   					    let value2 = parseInt(value);//카트번호
		        		 	         	        let hiddenProductNo = $('#hiddenProductNo'+value2).val();//상품번호
			        		 	         	    console.log('hiddenProductNo : '+hiddenProductNo)
						        				console.log('cartNo : '+value2)//카트번호
						        				orderNo;//주문번호
						        				console.log('orderNo : '+orderNo)
						        				let productNo = $('#hiddenProductNo'+value2).val();//상품번호
						        				console.log('productNo : '+productNo)
						        				let result = $('#result'+value2).val();
						        				let orderCount = parseInt(result);//상품수량
						        				let option = $('#optionsize'+value2).text();
						        				let orderSize = parseInt(option);//옵션사이즈
						        				let finalPrice = $('#finalprice'+value2).text();
						        				let formatfinalPrice = finalPrice.split(',').join("");
						     			        let orderPrice = parseInt(formatfinalPrice);//상품가격
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
  /* 아임포트 결제연동  끝*/
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
	          	<span id="cartSequence" class="sequence">01장바구니</span>
	          	<i class="fa-solid fa-angle-right"></i>
	          	<span id="orderSequence">02주문서작성/결제</span>
	          	<i class="fa-solid fa-angle-right"></i>
	          	<span>03주문완료</span>
	      	</div>
		      <p class=" ordercomplete-page"></p>
	    </div>

	    <div class="container cart-tr"><!-- content div 시작 -->
	        <form action="" method="" class="form-inline">
	        <input id="memberInfo" type="hidden" value="${memberInfo}">
	        <input id="clist" type="hidden" value="${clist}">
	        
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
	                    <!-- <th class="align-middle">배송비</th> -->
	                </tr>
	                
	                <c:forEach var="cart" items="${clist}" varStatus="status">
	                
	                <c:set var="finalPrice" value="${(cart.cartProduct.productPrice-((cart.benefitList.benefitRatio/100)*cart.cartProduct.productPrice))*cart.cartProductCount}"/>
	                
	                <tr id="cartRow${cart.cartNo}">
	                    <th class="align-middle">                             
							<input id="hiddenProductNo${cart.cartNo}" type="hidden" value="${cart.productNo}">   
	                        <input type="checkbox" name="cartCheckBox" class="th-input" id="cartCheck${cart.cartNo}" onclick="cartCheck(${cart.cartNo})" value="${cart.cartNo}">
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
	                                [옵션사이즈 <span id="optionsize${cart.cartNo}">${cart.cartProduct.productOptionSize}</span>ml]<br>
	                            </a>
	                        </sub>
	                    </th>
	                    <th class="align-middle" width="150px">
	                        <input class="cartNo" type="hidden" value="${cart.cartNo}">
	                        <input class="hiddenproductAmount${cart.cartNo}" type="hidden" value="${cart.cartProduct.productAmount}">
	                        <button name="btngroup" id="del${cart.cartNo}" type="button" onclick="del(${cart.cartNo})" style="width: 30px;">-</button>
	                        <input name="readresult" id="result${cart.cartNo}" type="text" value="${cart.cartProductCount}" style="width: 35px; text-align: center;" readonly >
	                        <button name="btngroup" id="add${cart.cartNo}" type="button" onclick="add(${cart.cartProduct.productAmount},${cart.cartProductCount},${cart.cartNo})" style="width: 30px;">+</button><br>
	                        
	                        
	                        
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
        <%-- <c:set var="member" value="${memberInfo}"/> --%>
            <div class="row cartcenter">
                <div class="col sale-wrap">
                    <div class="col">
                        <h4><span>${memberInfo.memberName} 님의 보유적립금 : </span><span id="memberpoint">${memberInfo.memberPoint}</span> point</h4>
                    </div>
                    <div class="col coupon-wrap">
                        <div class="row">
                            <div class="col">
                            	<input id="hiddenPoint" type="hidden" value="${memberInfo.memberPoint}">
                                <input id="pointInput" type="text" placeholder="${memberInfo.memberPoint}point" name="memberPoint">
                                <button id="pointtry" type="button" class="btn btn-success btn-sm" onclick="pointCheck()" style="display: none;">적립금 사용하기</button>
                                <button id="reset" type="reset" class="btn btn-primary btn-sm" onclick="pointReset()" style="display: none;">취소</button><br>
                                <span id="msgSpan"></span>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col sale-wrap">
                    <div class="col">
                        <h4>${memberInfo.memberName}님의 보유쿠폰</h4>
                    </div>
                    <div class="col coupon-wrap">
                        <div class="row">
                        
                        <c:if test="${not empty memberInfo.memberBenefitList}">
                        <c:forEach var="memberCoupon" items="${memberInfo.memberBenefitList}">
                            <div class="col-6">
                                <p class="coupon-p " id="coupon${memberCoupon.benefitNo}">${memberCoupon.benefitTitle}:${memberCoupon.benefitRatio}% <br>
                                기간 <fmt:formatDate value="${memberCoupon.benefitCreateDate}" pattern="yyyy-MM-dd" />
                                ~<fmt:formatDate value="${memberCoupon.benefitEndDate}" pattern="yyyy-MM-dd" />
 								<button type="button" class="btn btn-sm btn-success coupontry" onclick="couponCheck(${memberInfo.memberNo},${memberCoupon.benefitNo},${memberCoupon.benefitRatio})" style="display: none;">적용하기</button>
                                </p>
                                <p class="coupon-p" id="couponreset${memberCoupon.benefitNo}" style="display: none;">${memberCoupon.benefitTitle}:${memberCoupon.benefitRatio}% <br>
                                기간 <fmt:formatDate value="${memberCoupon.benefitCreateDate}" pattern="yyyy-MM-dd" />
                                ~<fmt:formatDate value="${memberCoupon.benefitEndDate}" pattern="yyyy-MM-dd" />
								<span style="color: red">적용중</span><button type="button" class="btn btn-sm btn-warning" onclick="couponReset(${memberInfo.memberNo},${memberCoupon.benefitNo},${memberCoupon.benefitRatio})">취소하기</button>
                                </p>
                            </div>
                        </c:forEach>
                        </c:if>    
                            
                            <!-- <div class="col-6">
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
                            </div> -->
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
                            배송비<span id="delivery"></span>원
                        </div>

                        <span class="badge">-</span>

                        <div class="col">
                            <span>기획전 할인금액</span><span id="ratio"></span>원
                        </div>

                        <!-- <span class="badge">-</span> -->

                        <!-- <div class="col">
                            <span>적립금 할인</span><br><span id="point"></span>point
                        </div> -->

                       <!-- <span class="badge">-</span>

                        <div class="col">
                            쿠폰할인<span id="coupon"></span>원
                        </div> --> 

                        <span class="badge">=</span>

                        <div class="col">
                            합계<span id="final"></span>원
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col cart-delete hiddenbtn">
                	<%-- <input id="hiddenlocation" type="hidden" onclick="location.href='${path}/cart?memberNo=${memberInfo.memberNo}'"> --%>
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
        	</form>
        
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
                        <input type="text" required id="buyer_name">
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        휴대폰번호
                    </th>
                    <td colspan="4">
                        <input type="text" required id="buyer_tel">
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        이메일
                    </th>
                    <td colspan="4">
                        <input type="text" required id="buyer_email">
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
                                <input type="radio" class="form-check-input" name="addressCheck" checked>직접 입력
                            </label>
                        </div>
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="addressCheck" >주문자 정보와 동일
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
                        <input type="text" required id="recipient">
                    </td>
                </tr>
                <tr>
                    <th rowspan="2">
                        <span>*</span>
                        받는곳 주소
                    </th>
                    <td colspan="4">
                        <input type="text" required id="buyer_addr">
                        <button type="button">우편번호검색</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="text" class="container" required>
                    </td>
                    <td>
                        <input type="text" required>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>*</span>
                        휴대폰번호
                    </th>
                    <td colspan="4">
                        <input type="text" required id="recipienttel">
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
                    <!-- 9만원이상 구매시 -->
                    <th colspan="4"><span id="orderDspan"></span></th>
                    <!-- 9만원미만 구매시 -->
                    <!-- <th colspan="4">6000원-9만원 미만 구매</th> -->
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
	                  <div class="col-8 pay-list">
	                      
	                      <input id="payment" type="hidden" name="pay" value="${memberInfo.memberNo}"><!-- 회원테스트 -->
	                      <input id="payment2" type="hidden" name="pay" value=""><!-- 비회원테스트 -->
	                      
	                      
	                      
	                      <button class="btn btn-outline-secondary"data-toggle="collapse"  data-target="#mubank">무통장입금
	                     <!--  <input id="mubank" type="hidden" name="pay"> -->
	                      </button>
	<%-- value="${memberInfo.memberNo}"  onclick="kakaoPay()" --%>
	                      <button id="kakaopay" class="btn btn-outline-secondary" type="button" onclick="kakaopay()" value="kakaopay">카카오페이
	                          <!-- <input id="kakao" type="hidden" name="pay"> -->
	                          </button>
<!-- 	                      <span class="btn btn-outline-secondary"data-toggle="collapse"  data-target="#kakao">카카오페이
	                          <input id="kakao" type="hidden" name="pay">
	                          </span> -->
	
	                      <button type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#naver">네이버페이</button>
	                      <button type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#samsung">삼성페이</button>
	                      <button type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#payco">페이코</button>
	                      <button type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#toss">토스페이</button>
	                  </div>
	                  <div class="container">
	                      <div id="mubank" class="collapse">
	                          <p>(무통장 입금의 경우 입금화면 후부터 배송단계가 진행됩니다.)</p>
	                          <table class="table table-border">
	                              <tr>
	                                  <th>입금자명정보</th>
	                                  <th>
	                                      PERFUME
	                                  </th>
	                              </tr>
	                              <tr>
	                                  <th>입금은행정보</th>
	                                  <th>
	                                      kh은행 : R123456789
	                                  </th>
	                              </tr>
	                          </table>
	                      </div>
	                      <div id="naver" class="collapse">
	                          -네이버페이는 비밀번호로 결제할 수 있는 간편결제 서비스입니다.<br>
	                          -결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크
	                          결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권
	                      </div>
	                      <div id="samsung" class="collapse">
	                          -삼성페이 안내<br>
	                          -지원카드 : 모든 국내 신용/체크카드
	                      </div>
	                      <div id="payco" class="collapse">
	                          -PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스입니다.<br>
	                          -휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.<br>
	                          -지원카드 : 모든 국내 신용/체크카드
	                      </div>
	                      <div id="toss" class="collapse">
	                          -토스는 간편하게 비밀번호만으로 결제 할 수 있는 빠르고 편리한 계좌 간편 결제 서비스 입니다.<br>
	                          -지원 은행: 모든 은행 계좌 등록/결제 가능<br>
	                          -결제 비밀번호 분실 시 재설정 후 이용 가능합니다.
	                      </div>
	                      <div id="kakao" class="collapse">
	                          -카카오페이는 카카오톡에서 카드를 등록, 간단하게 비밀번호만으로 결제할 수 있는 빠르고 편리한 모바일 결제 서비스입니다.<br>
	                          -지원 카드 : 모든 카드 등록/결제 가능
	                      </div>
	                  </div>
	              </div>
	        </div>
        <!-- 결제방법 collapse 끝 -->
    	
	    	<div class="container cart-shopping payway">
	             <button id="orderbtn" type="button" class="btn btn-outline-secondary" onclick="pay()" value="${memberInfo.memberNo}">결제하기</button>
	        </div>
        </div>
        
       	<!-- 이용약관 -->
       	<div class="container hiddenOrder" style="display: none;">
	        <label for="agreeAll">
	            <input id="agreeAll" type="checkbox">
	            <span>*</span>
	            <span>
	                PERFUME의 모든 약관을 확인하고 전체 동의 합니다.
	                (전체 동의에 선택항목도 포함됩니다.)
	            </span>
	        </label>
    
	        <div>
	            <P><span>*</span>개인정보 수집 이용 동의</P>
	            <label for="agree1">
	                <input id="agree1" type="checkbox" required>
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
                   <input id="agree2" type="checkbox" required>
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
		<!-- 이용약관 끝 -->
    	
    	
</div><!-- 전체 div 끝 -->

<div class="container" style="height: 100px;"></div>	
    
</body>
</html>