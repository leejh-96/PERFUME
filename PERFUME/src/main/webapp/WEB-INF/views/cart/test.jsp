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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
	<%-- 장바구니 test
	
	<button onclick="location.href='${path}/cart?memberNo=3'" name="cart" id="cart" >장바구니테스트</button>
	<button onclick="location.href='${path}/admin/product'">관리자테스트</button> --%>
	
					<div id="product-option" >
                        <div class="option-area">
                        <table id="option"  >
                            <tr style="border-bottom: 1px solid #ccc;">
                                <th  width="80px">용량</th>
                                <td width="80%">
                                
                     	
                        
                                <select name="poname" id="optselect" class="">
                                    <option id="btn" value="" selected link_image="">용량(필수)</option>
                                    <option value="" disabled link_image="">-------------------</option>
                                    
                                    <%-- <c:forEach var="option" items="${option}"> --%>
                                    <option data-pono1="${option.pono }" value="50" value2="" id="test">${option.poname}ml<span>[</span>재고 : ${option.poamount}<span>]</span></option>
                                    <option data-pono1="${option.pono }" value="75" value2="" id="test">${option.poname}ml<span>[</span>재고 : ${option.poamount}<span>]</span></option>
                                    <option data-pono1="${option.pono }" value="100" value2="" id="test">${option.poname}ml<span>[</span>재고 : ${option.poamount}<span>]</span></option>
                                 	<%-- </c:forEach> --%>
                                </select>
                                </td>
            
                            </tr>
                            <tr>
                                <th>포장지</th>
                                <td><select  name="option2" id="optselect2" class="" option_style="select" >
                                    <option value="*" selected link_image="">- [선택] 포장지 선택 -</option>
                                    <option value="**" disabled link_image="">-------------------</option>
                                    <option value="P00000TT000K"  link_image=""></option>
                                    <option value="P00000TT000L"  link_image="">추가 예정입니다.</option>
                                    <option value="P00000TT000M"  link_image="">추가 예정입니다.</option>
                                    <option value="P00000TT000N"  link_image="">추가 예정입니다.</option>
                                </select></td>
                            </tr>
                        </table>
                        </div>
                    </div>
                        		  <div class="opt-table" id="opt${option.poname}" data-id="${option.poname}">
                                      <div style="width: 55%; font-size: 12px; line-height: 40px;">
                                    		<p>${product.eng } -<span class="sizeval">${option.poname}ml</span></p>
                                    		
                                      </div>
                                      <div class="quantity" style="width: 25%; text-align: center; line-height: 40px">
                                          <span>
                                              <a class="opt-cnt-minus disabled" href="javascript:void(0)" onclick="prepareOrder.changeQty('1','2060719','0','minus',$(this),'55200');return false;">-</a>
                                              <input id="quantity" name="quantity_name" style="border: none;" value="10" type="text"  />
                                              <a class="opt-cnt-plus" href="javascript:void(0)" onclick="prepareOrder.changeQty('1','2060719','0','plus',$(this),'55200');return false;">+</a>
                                          </span>
                                      </div>
                                      <div class="price" style="width: 20%; line-height: 40px; font-size: 12px;">
	                                      <c:forEach var="benefit" items="${product.benefit}" begin="0" end="0">
					                        <c:if test="${not empty product.benefit }">
					                        <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
					                        <fmt:parseNumber var="saleprice" value="${option.poprice*salepricerate}"/>
					                        <fmt:parseNumber var="productsaleprice" value="${option.poprice-saleprice}"/>
		                                		<span id="selected-price">${productsaleprice}</span>&nbsp;<span>원<span>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="prepareOrder.delBuyGoods($(this),1,0);prepareOrder.getSizeRecommend('product_size_recommend','2060719','0',false,'');return false;">x</a></span>
			                                </c:if>
		                                 </c:forEach>
		                                  <c:if test="${empty product.benefit }">
		                         			<span id="selected-price">${option.poprice}</span>&nbsp;<span>원<span>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="prepareOrder.delBuyGoods($(this),1,0);prepareOrder.getSizeRecommend('product_size_recommend','2060719','0',false,'');return false;">x</a></span>       
		                                  </c:if>
                                      </div>
                                	</div>
                    
                    <div id="product-total">
                        TOTAL :<span id="total"><b>0</b></span><span>원</span><span style="font-size: 8px;">(0)개</span>
                    </div>
                    <div id="product-button">
                        <button id="like">LIKE</button>
                        <button id="cart" onclick="cartInsert(1)">CART</button>
                        <%-- <button id="buy" onclick="location.href='${path}/cart/nowOrder/2/1/50/80000/100'">BUY NOW</button>
                        <button id="buy" onclick="location.href='${path}/cart/nowOrder/2/1/50/80000/100'">BUY NOW</button> --%>
                        <button id="buy" onclick="nowOrder(1)">BUY NOW</button><!-- product.no -> 상품번호만 함수 매개변수로 onclick="nowOrder(${product.productNo})" -->
                    </div>
<script type="text/javascript">
let poName = '';
$('#optselect').change(function() {
	 poName = '';
	 poName = $('#optselect option:selected').val();
	 console.log("poName" + poName);
});

function nowOrder(productNo){
	   
	   console.log(productNo)
	   console.log(poName)
	   let poAmount = $('#quantity').val();
	   console.log(poAmount)
	   window.location.href='${path}/cart/nowOrder/'+productNo+'/'+poName+'/'+poAmount                                                                                                                                                                                                                                                                                               
	   
}

/* onclick="nowOrder(${product.pno})" */
	
function cartInsert(productNo){
	console.log(productNo)
	console.log(poName)
	let cartProductCount = $('#quantity').val();
	console.log(cartProductCount)
	cartOptionSize = poName;
	
	$.ajax({
		url : '${path}/cart/insert',
		type : 'get',
		data : {productNo,cartOptionSize,cartProductCount},
		dataType : 'json',
		success : function(result){
			console.log(result)
			
			if (result === 0) {
				//비로그인시 체크
				if (confirm('장바구니는 로그인 후 이용가능합니다.\n\n로그인 하시겠습니까?')) {
					$('.openLogin').trigger('click');
				}else {
					return false;
				}
			}else if (result === 1) {
				if (confirm('상품이 정상적으로 장바구니에 담겼습니다.\n\n장바구니에서 확인하시겠습니까?')) {
					window.location.href='${path}/cart';
				}else {
					return false;
				}
			}
		},
		error : function(error){
			console.log(error)
		}
	})
}




</script>	
	
</body>
</html>