<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${path }/js/jquery-3.6.3.js"></script>
  <script src="${path }/slick/slick.min.js"></script>

  <link rel="stylesheet" href="${path }/slick/slick-theme.css">
  <link rel="stylesheet" href="${path }/slick/slick.css">
  
  <link rel="stylesheet" href="${ path }/css/planning/footer.css">
<%--   <link rel="stylesheet" href="${ path }/css/planning/header.css"> --%>
<style>
       div * {              
/*             border: 2px solid red;    */
            box-sizing: border-box;
            
        }

        .wrap {
            width:100%;
            height:7500px;
            margin:auto;
            font-family: 'Nanum Myeongjo', serif;
             /* background-color: #f6f6f2; */
        }

       
        #section {height: 100%;}
/*       #footer {height: 3%; }  */
     

        /* .product_title {border-top: 3px solid; }  */


        #header1{ width: 30%;}
        #navigator{ width: 50%; }
        #header2{ width: 20%; }
        #header>div {
            float: left;
            height: 100%;
        }

        /* #section>div {
            float: left;
        } */


        #s1 {height: 2%; border-top: 1px solid #ccc;}
        
         #s1_1 {height: 40%; background-color: navy;}
        #s1_2 {height: 60%;}

        #s2 {height: 16%;}

        #s3 {height: 38%;}

        #s4 {height: 13%;}

        #s5 {height: 13%;}

        #s6 {height: 10%;}

        #s7 {height: 8%;}






        
      

        /* a{  
        text-decoration: none;
        font-size: 13px;
        font-weight: 900;
        line-height: 3.5;
        } */

/*         a:hover { */
/*         color: darkblue; */
/*         text-decoration : none; */
/*         font-size: 13px; */
/*         } */
        

        #product {height: 90%;}

        #product-image { width: 60%;}
        #product-detail-area {width: 40%;}
        #s2>div {float: left; height: 100%;}


        #d1 {
            height: 5%;
            border-top: 2px solid #ccc;
        
        }

        

        hr{
            border: solid 1px black;
        }

        #product-l-meaning {height: 4%; font-size: 12px;}
        #product-detail-area>div { height: 100%; float: left;}
        #product-detail {width: 80%;}
        #product-title {height: 4%;}
        #product-sizeinfo { height: 5%; }
        #product-caution {height: 10%; font-size: 12px; margin-bottom: 20px;}
        #product-meaning{ height: 13%; font-size: 12px;}
        #product-price{height: 4%; border-bottom: 1px solid #ccc; }
        #product-option{height: 10%; border-bottom: 1px solid #ccc;}
        .option-count { height: 15%;}
        #product-benefits{height: 6%; border-bottom: 1px solid #ccc;}
        #product-total {height: 3%; font-size: 13px; text-align: right;}
        #product-button { text-align: right;  }
        #product-menu {text-align: center; height: 5%; }
        #product{text-align: center;}
        #product-review-wrap {height: 91%;}
        #product-qna-wrap {height: 91%;}
        #product-image>div {height: 100%; float: left;}



        #image {height: 80%;}
        #imageetc {height: 20%;}

        #product-menu > a  {font-size: 10px; margin: 50px; color: black;}



        #product-price>div{height: 100%; float: left;}
        #price {width: 35%;}
        #origin_price{width:55%;  }
        #sale{width: 10%;}

        #benefits {font-size: 12px;  }
        #benefits >th,td { padding: 6px;}

        #option {font-size: 11px; width: 100%; height: 100%;}
         
       


        #d {
            width: 20%;
        }

        #d2 {height: 5%;}

        #buy {
            height: 55px;
            width: 270px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            outline: none;
            margin-left: 5px;
            background-color: rgb(120, 116, 100);
            color: #fff;
        }

        #cart {
            height: 55px;
            width: 80px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            outline: none;
            margin-left: 5px;
            background-color: rgb(224, 224, 224);
            color: black
        }

        #like {
            height: 55px;
            width: 70px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            outline: none;
            margin-left: 5px;
            background-color: rgb(224, 224, 224);
            color: black
        }

        #product-review-wrap>div {height: 100%; float: left; }
        #d3{width: 10%;}
        #d4{width: 10%;}
        #product-review{width: 80%; }
        
        #d5{height: 5%;}
        #review-name {text-align: center; height: 4%;}
        #grade-wrap{height: 15%; text-align: center; border: 1px solid #ccc;}
        #review-wrap {height: 76%; }
        
        #grade-wrap>div { height: 100%; float: left;}
        
        
        #product-qna-wrap>div{height: 100%; float: left;}
        #product-qna {width: 80%;}
        
        #qna-name{text-align: center; height: 6%;}
        #qna-content {height: 78%;}
        #qna-page{height: 11%; text-align: center;  border-top: 1px solid #ccc;}
        

        #product-guide-wrap {height: 86%;}
        #product-guide-wrap>div {height: 100%; float: left;}
        #guide{width: 80%; padding: 10px;}


        #guide>div{height: 100%; float: left;}
        #guide1{width: 50%;}
        #guide2{width: 50%; font-size: 13px; }

        #guide2>div>ul>li {list-style-type: none;}

        #payinfo{height: 40%; font-size: 12px; }
        #changeinfo {height: 60%; font-size: 12px;}

        #grade {
            width: 30%;
            border-right: 1px solid #ccc;
        }

        #grade_graph {
            width: 70%;
        }

		#review-filter>div {height: 100%; float: left;}
        #review-filter {height: 7%;}
       #review-content{height: 78%;}
        #review-page {height: 15%; border-top: 1px solid #ccc;}

        #review-table {
            width: 100%;
            font-size: 12px;
            
        }

        
        #d6 {
            width: 5%;
        }
        #delivery-info{ width: 95%;}
        #guide2>div {
            height: 100%; float: left;
        }

        #related-product-wrap {height: 85%;}
        #related-product-name{height: 10%; text-align: center; width: 60%;}
        #related-product-wrap>div {height: 100%; float: left;}
        #d7{width: 20%;}
        #d8{width: 20%;}
   
        .card {
       padding: 20px;
       border: none;
       text-align: center;
       font-weight: bold;
       font-size: 10px;

       }

       #related-list {height: 80%;}
    

       .slick-arrow{
        background-color: black;
        font-size: 20px;
}

    #cate {
        font-size: 10px;
        font-weight: bold;
        
    }

    /* .slick-prev::before,
     .slick-next::before {
     opacity: 0;
        display: none;
  } */


    .sidebar {height: 30%;  }
    .sidebar>div {height: 100%; float: left; }
    #fcwrap{height: 100%; width: 60%; border: 1px solid #ccc; }
    #cart2{ height: 25%;  }
    #share{height: 25%; }
    #up{height: 25%;}
    #down{height: 25%;}
    #cart22{width: 100%;}
   
    #product-image>div {height: 100%; float: left;}
    /* 있어도 되고 없어도될듯 */
    .option-area { height: 100%;}
    

    #opt-count {width: 30%;}

    .selected-table{height: 33%;}
    .opt-name {width: 60%; font-size: 12px;}
    .opt-price {width: 20%; font-size: 12px;}


    .selected1 { height: 4%;}
    .selected2 { height: 4%;}
    .selected3 { height: 4%;}

    #optselect {height: 60%; width: 100%; font-weight: bold;}
    #optselect2 {height: 60%; width: 100%; }
    

    #sumb-wrap>div {height: 100%; float: left;}
      

 
    #sumbimg1{width: 25%;}

    .img1 {max-width: 100%; max-height : 100%;
    }

    .big { max-width: 100%;}
    #sumbimg2{width: 25%;}
    #sumbimg3{width: 25%;}


    .selected-opt{font-size: 11px; width: 100%; }
    .opt-table {height: 60px; width: 100%;}

    .quantity {width: 15%;}
    #quantity {width: 15%; height: 50%; text-align: center; font-size: 12px;}

    .opt-table>div{height: 100%; float: left;}
    
    
    #detailimg {
    	height: 25%;
    	max-height : 100%;
    }
    
    .rfilter {
            padding: 10px;
            font-weight: bold;
        }
   	thead {
            
            font-weight:bold;
            border-bottom: 1px solid #ccc;
        
        }
        
        #reviewline {

            border-bottom: 1px solid #ccc;
        }
    
    	 .link {
        color: #333;
         font-size: 13px; 
          font-weight: 900;
          line-height: 3.5;
         
    }

 	
 	 .link:hover {
        text-decoration : none;
        font-size: 13px;
        }
    
    	#qnaname>div {height: 100%; float:left;}
    
    
</style>
</head>
<body>
    <div class="wrap">
         <header>
        <div class="header-container">
            <nav class="main-nav">
                <ul>
                    <li><a href="#">ABOUT US</a></li>
                    <li><a href="${ path }/planning/special">SPECIAL</a></li>
                    <li><a href="#">SCENT</a></li>
                    <li><a href="#">SACHET</a></li>
                </ul>
            </nav>
            <h1 class="logo"><a href="${ path }/">Perfume</a></h1>
            <nav class="user-nav">
                <ul>
                    <li><a href="#">EVENT</a></li>
                    <li><a href="#">COMMUNITY</a></li>
                    <c:if test="${ empty loginMember }">
	                    <li><a href="#" class="openLogin">LOGIN</a></li>
	                    <li><a href="#">JOIN</a></li>
                    </c:if>
                    <c:if test="${ not empty loginMember }">
						<li><a href="${ path }/logout">LOGOUT</a></li>
						<c:if test="${ not empty loginMember && loginMember.division == '2' }">
							<li><a href="#">MY PAGE</a></li>                                      
							<li><a href="${ path }/cart?memberNo=3">CART</a></li>                                      
						</c:if>
						<c:if test="${ not empty loginMember && loginMember.division == '1' }">
							<li><a href="#">ADMIN PAGE</a></li>                                        
						</c:if>              
                    </c:if>
                </ul>
            </nav>
        </div>

 <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="staticBackdropLabel">댓글 작성</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <table class="">
                        <tr>
                            <td>아이디</td>
                            <td>ismoon</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="" id="" cols="30" rows="10"></textarea></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                  <button type="button"  >작성하기</button>
                  <button type="button"  data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
          </div>





        <!-- 로그인 모달창 구현 -->
        <div class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="text-align: center;">LOGIN</h2>
                <form id="loginForm" action="${ path }/login" method="POST">
                    <div>
                        <label for="id" style="font-weight: bold;">아이디</label><br>
                        <input type="text" id="id" name="id" required placeholder="아이디를 입력하세요."><br>
                        <label for="pwd" style="font-weight: bold;">비밀번호</label><br>
                        <input type="password" id="pwd" name="pwd" required placeholder="비밀번호를 입력하세요."><br><br>
                        <button type="submit">Login</button><br><br>
                    </div>
                </form>
                    <div>
                        <a href="${ path }/planning/findId"><button type="button" id="findId">아이디 찾기</button></a>
                        <a href="${ path }/planning/findPwd"><button type="button" id="findPwd">비밀번호 찾기</button></a><br><br>
                        <button type="submit">회원가입</button><br><br>
                    </div>
                    <ul style="list-style: none;">
                        <li onclick="naverLogin();"><button type="button">네이버로 로그인</button></li>
                        <li onclick="kakaoLogin();"><button type="button">카카오로 로그인</button></li>
                        <li onclick="googleLogin();"><button type="button">구글로 로그인</button></li>
                        <li onclick="appleLogin();"><button type="button">애플로 로그인</button></li>
                    </ul>
            </div>
        </div>
    
        
    </header>
        <div id="section">
            <div id="s1" >
                 <div id="s1_1">

                </div>
                <div id="s1_2">

                </div>
            </div>
            <div id="s2">
               
                <div id="product-image">
                    <div style="width: 20%;">

                    </div>
                    <c:forEach var="product" items="${ list }">
                    
                    <div style="width: 70%;"  >
                        <div style="height: 60%; width: 100%;" id="mainimg">
                        <c:forEach var="productfile" items="${ product.productfile }" begin="0"  end="0" >
                      
                        <c:if test="${productfile.pfsort eq '1' }">
                     
                        <img src="${ path }/images/product/${ productfile.pfrenamefilename}" class="big" alt="">
                        </c:if>
                        </c:forEach>
                        </div>  
                        
                        <div id="sumb-wrap" style="height: 15%;">
                         <c:forEach var="productfile" items="${ product.productfile }"  begin="0"  end="0">
                         	<c:if test="${productfile.pfsort eq '1' }">
                            <div id="sumbimg1" >
                                <img src="${ path }/images/product/${ productfile.pfrenamefilename}" class="img1" alt="">
                            </div>
                            </c:if>
                            </c:forEach>
                            <c:forEach var="productfile" items="${ product.productfile }" begin="1" end="2">
                            <c:if test="${productfile.pfsort eq '2' }">
                            <div id="sumbimg1" >
                                <img src="${ path }/images/product/${ productfile.pfrenamefilename}" class="img1" alt="">
                            </div>
                            </c:if>
                            
                            </c:forEach>
                        </div>

                        <div style="height: 25%;">

                        </div>
                    </div>
                   
                    <div style="width: 10%;"></div>
                    
                </div>
                
               
                <div id="product-detail-area">
                    <div id="product-detail">
                        <!-- <p id="cate">CITRUS > PERFUME > BLEU EDT</p> -->
                        <hr style="margin-left: 0;">
                    <div id="product-title">
                        <h4><strong>${product.eng }</strong></h4>
                    </div>
                    <div id="product-l-meaning">
                        ${product.title }
                    </div>
             
                    <div id="product-sizeinfo">
                        <h6 style="font-size: 12px;">scent : <span><strong>${product.topcate.ptname }</strong> </span></h6> 
                         
                        <h6 style="font-size: 12px;">size :  <span><strong> <c:forEach var="option" items="${option}"> ${option.poname}ml </c:forEach></strong></span> </h6>   
                     
                    </div>
               
                    <div id="product-caution">
                        <h6 style="font-size: 13px;"><b>구매 시 주의사항</b></h6>
                        1. 제작과정에서 생긴 작은 기포나 미세한 스크래치가 있을 수 있습니다.<br>
                        2. 인쇄가 완전히 고르지 않을 수 있습니다.<br>
                        3. 컵의 밑둥이 살짝 비스듬할 수 있습니다.<br>
                        4. 컵의 입구 부분이 완전히 고르지 않을 수 있습니다.<br>
                    </div>
                    <div id="product-meaning">
                        <h6 style="font-size: 13px;"><b>설명</b></h6>
                        ${product.detail }
                        
                    </div>
                    <div id="product-price">
                        <div id="price">
                        
                        
                        <c:forEach var="benefit" items="${product.benefit}" begin="0" end="0">
                        <c:if test="${not empty product.benefit }">
                        <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
                        <fmt:parseNumber var="saleprice" value="${product.price*salepricerate}"/>
                        <fmt:parseNumber var="productsaleprice" value="${product.price-saleprice}"/>
                        
                        
                        <h3><strong><fmt:formatNumber value="${productsaleprice}" pattern="###,###"/></strong></h3>
                        </c:if>
                        
                        
                      
                     	</c:forEach>
                     	  <c:if test="${empty product.benefit }">
                        
                        <h3><strong><fmt:formatNumber value="${product.price}" pattern="###,###"/></strong></h3>
                        </c:if>
                     	
                     	
                        </div>
                        <div id="origin_price">
                       
                        </div>
                        <c:forEach var="benefit" items="${product.benefit}">
                        <c:set var="bnratio" value="${benefit.bnratio}%" />
                      
                        </c:forEach>
                        <div id="sale">
                            <h3>${bnratio}</h3>
                        </div>
                        
                    </div>

                    <div id="product-benefits">
                        <table id="benefits" width="100%">
                            <tr>
                                <th width="20%">적립금</th>
                                <td width="80%">5%</td>
                            </tr>
                            <tr>
                                <th >배송비</th>
                                <td >90000원 미만 주문 시 배송비 3000원이 추가 됩니다.</td>
                            </tr>

                        </table>
                    </div>
                    <div id="product-option" >
                        <div class="option-area">
                        <table id="option"  >
                            <tr style="border-bottom: 1px solid #ccc;">
                                <th  width="80px">용량</th>
                                <td width="80%">
                                
                     	
                        
                                <select name="" id="optselect" class="">
                                    <option id="btn" value="" selected link_image="">용량(필수)</option>
                                    <option value="" disabled link_image="">-------------------</option>
                                    
                                    <c:forEach var="option" items="${option}">
                                    <option data-pono1="${option.pono }" value="${option.poname}" value2="" id="test">${option.poname}ml<span>[</span>재고 : ${option.poamount}<span>]</span></option>
                                 	</c:forEach>
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
                              <c:forEach var="option" items="${option}">
                        <div class="opt-table" id="opt${option.poname}" data-id="${option.poname}"style="border: 1px solid #ccc; padding: 10px; display: none;">
                                    <div style="width: 55%; font-size: 12px; line-height: 40px;">
                                    <p>${product.eng } -<span class="sizeval">${option.poname}ml</span></p></div>
                                                    <div class="quantity" style="width: 25%; text-align: center; line-height: 40px">
                                                        <span>
                                                            <a class="opt-cnt-minus disabled" href="javascript:void(0)" onclick="prepareOrder.changeQty('1','2060719','0','minus',$(this),'55200');return false;">-</a>
                                                            <input id="quantity" name="quantity_name" style="border: none;" value="1" type="text"  />
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
                                </c:forEach>   
                                               
                                                                               
                            
                   
                    
                    
                    <div id="product-total">
                        TOTAL :<span id="total"><b>0</b></span><span>원</span><span style="font-size: 8px;">(0)개</span>
                    </div>
                    <div id="product-button">
                        <button id="like">LIKE</button>
                        <button id="cart">CART</button>
                        <button id="buy">BUY NOW</button>

                    </div>

                    </div>
                    <div id="d">
                        <div style="height: 20%;">
                            
                        </div>
                        <div class="sidebar" >
                            <div style="width: 40%;">


                            </div>
                            <div id="fcwrap" >
                               
                                <div id="cart2">
                                   gd
                                </div>
                                <div id="share"> 
                                 
                                </div>
                                <div id="up">
                                    
                                </div>
                                <div id="down">
                                   
                                </div> 
                                
                            </div>
                        </div>
                    </div>
                  

                    
                    </div>
            </div>
           
            <div id="s3">
                <div id="d2"></div>
                <hr style="width:80%">
                <div id="product-menu">
                    
                    <a class="link" name="pinfo" href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a class="link" href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a class="link" href="#review"> REVIEW </a> <span class="bar">|</span>
					<a class="link" href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a class="link" href="#related"> 관련 상품</a>
                </div>
                <div id="product">
                <p style="font-weight: bold; font-size: 25px;"> ${product.eng }     </p>
                 <c:forEach var="productfile" items="${ product.productfile }">
                	<c:if test="${productfile.pfsort eq '2' }">
                    <div id="detailimg">
                     <img src="${ path }/images/product/${productfile.pfrenamefilename}" class="img1" alt="">
                    </div>
                   </c:if>
                   <br><br><br>
                  
                    </c:forEach>
                    <div>
                        프로젝트 (퍼퓸)의 모든 디자인, 일러스트, 사진들은 <br>
                        상표 및 디자인 특허,
                        저작권보호를 받고 있습니다. <br>
                        프로젝트 (퍼퓸) 과 유사한 제품을 제조, 판매할 경우, 민,형사상의 책임을 묻겠습니다.

                    </div>
                </div>
                
            </div>
            <div id="s4">
                <hr style="width:80%">
                <div id="product-menu">
                    <a class="link" href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a class="link" name="payguide"	href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a class="link" href="#review"> REVIEW </a> <span class="bar">|</span>
					<a class="link" href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a class="link" href="#related"> 관련 상품</a>
                </div>
                <div id="d2"></div>
                <div id="product-guide-wrap">
                    
                    <div id="d3"></div>
                    
                    <div id="guide">
                        <div id="guide1">
                            <div id="payinfo">
                                <h6 id="payinfo-title" style="border-bottom: 2px solid #ccc;"><b>상품결제정보</b></h6><p></p><br>
                                고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  
                                무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
                                주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
                            </div>
                            <div id="changeinfo">
                                <h6 id="changeinfo-title" style="border-bottom: 2px solid #ccc;"><b>교환 및 반품정보</b></h6><p></p><br>
                                <strong>교환 및 반품이 가능한 경우</strong><br>
                                - 상품을 공급 받으신 날로부터 7일이내.&nbsp;<div>
                                - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br>
                                &nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 7일이내.</div><div><br>
                                    </div>

                                <strong>교환 및 반품이 불가능한 경우</strong><div>
                                - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우</div><div>&nbsp; 단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외</div><div>
                                - 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br>
                                - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
                                - 복제가 가능한 상품등의 포장을 훼손한 경우<br>
                                &nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br><br>*고객님의 단순변심으로 인해 교환, 반품을 하실 경우 상품 반송 비용은 고객님께서 부담하셔야 합니다. (색상 교환, 사이즈 교환 등 포함)</div>
                                
                            </div>
                        </div>
                        
                        <div id="guide2">
                            <div id="d6">

                            </div>
                            <div id="delivery-info">
                                <h6 id="changeinfo-title" style="border-bottom: 2px solid #ccc;"><b>배송정보</b></h6><p></p><br>
                                <ul>
                                    <li>배송 방법 : 택배</li>
                                    <li>배송 지역 : 전국지역</li>
                                    <li>배송 비용 : 3,000 won</li>
                                    <li>배송 기간 : 2일 ~ 7일</li>
                                    <li>배송 안내 : <br>
                                    1. 2일 ~ 7일의 배송 기간은 영업일 기준, 주말 및 공휴일을 제외한 기간입니다.<br>
                                    2. 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
                                    3. 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                   <div id="d4"></div>
                </div>
            </div>
            <div id="s5">
                <hr style="width:80%">
                <div id="product-menu">
                    <a class="link" href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a class="link" href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a class="link" name="review" href="#review"> REVIEW </a> <span class="bar">|</span>
					<a class="link" href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a class="link" href="#related"> 관련 상품</a>
                </div>
                <div id="product-review-wrap">
                    <div id="d3">

                    </div>
                    <div id="product-review">
                        <div id="d5">
                            
                        </div>
                        <div id="review-name">
                            <h4><b>REVIEW</b></h4>
                        </div>
                        <div id="grade-wrap">
                            <div id="grade" style="background-color: rgb(74, 65, 65); color: white; ">
                                <br>
                                <c:set var = "total" value = "0" />
                                 <c:set value="${fn:length(grade)}" var="gradeCount"/>
                                <c:forEach var="productboard" items="${grade}" varStatus="status">
                               <c:set var= "total" value="${total + productboard.pbgrade}"/>
                               </c:forEach>
                                <h1>
                                <span> 
                                <fmt:formatNumber value="${total / gradeCount}" pattern=".0"/>/</span> 
                                <span>5</span>
                                </h1>
                                <h6>${gradeCount}명 참여</h6>
                            </div>
                            <div id="grade_graph" style="background-color: rgb(224, 224, 224);"></div>
                        </div>
                        <div id="review-wrap">
                            <div id="review-filter">
                                <div style="width: 20%;" class="rfilter"><p>REVIEW</p></div>
                                <div style="width: 80%; text-align: right;"  class="rfilter" >
                                    <button>write</button>
                                    <button>list</button>
                                </div>

                            </div>
                            <div id="review-content">
                           
                            <div class="accordion" id="accordionExample"> 
                            
                                <table id="review-table">
                                	<thead>
                                        <tr >
                                            <td align="center">번호</td>
                                            <td align="center">제목</td>
                                            <td>아이디</td>
                                            <td align="center">등록 시간</td>
                                            <td align="center">평점</td>
                                        </tr>
                                    </thead>
                                  <c:forEach var="productboard" items="${board}" varStatus="status">
                                  <tbody style="height: 60px;">
                                    <tr class="xans-record-" id="reviewline">
                                        <td  align="center">${productboard.pbno}</td>
                                        <td width="600px" >
<!--                                             <a data-toggle="collapse" href=#collapseExample${productboard.pbno} role="button" aria-expanded="false" aria-controls="collapseExample"> -->
									 <a class="link" type="button" data-toggle="collapse" data-target="#collapseOne${productboard.pbno}" aria-expanded="false" aria-controls="collapseOne${productboard.pbno}">
                                            ${productboard.pbtitle}</a>
<!--                                             </a> -->
                                            <span>[1]</span>
                                        </td>
                                        <td>ismoon</td>
                                        <td align="center">${productboard.pbdate}</td>
                                 
                                        <td align="center"><c:choose>
                                            <c:when test="${productboard.pbgrade <= 4.5 && productboard.pbgrade > 3.5}">★★★★☆</c:when>
											<c:when test="${productboard.pbgrade <= 3.5 && productboard.pbgrade > 2.5}">★★★☆☆</c:when>
											<c:when test="${productboard.pbgrade <= 2.5 && productboard.pbgrade > 1.5}">★★☆☆☆</c:when>
											<c:when test="${productboard.pbgrade <= 1.5 && productboard.pbgrade > 0}">★☆☆☆☆</c:when>
											<c:when test="${productboard.pbgrade == 0}"></c:when>
										
											</c:choose></td>
                                    </tr>
                                  <tr >
                                      
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbno}" id="toglespace"> --%>
                <div id="collapseOne${productboard.pbno}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
               <div>
                <div style="height: 80px; border: 1px solid #ccc; " id="reviewcontent" >
                     ${productboard.pbcontent}

                </div>
                <div style="height: 30px; border: 1px solid #ccc; padding: 5px;" >
                	<button type="button" data-toggle="modal" data-target="#staticBackdrop" id="reviewreply">댓글 작성</button> <button>신고 하기</button>
                </div>
                
                <br><br>
                <!-- <div class="replyform" >
                    <div style="height: 60%;">

                    </div>
                    <div style="">

                    </div>
              
                </div> -->
               </div>
                </div>
               </td>
            </tr>
            </tbody>
                                    </c:forEach>
                                      
                                </table>
                                </div>
                            </div>
        
                            <div id="review-page" style="text-align: center">
									<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/product/detail?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage}">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>						
						<button onclick="location.href='${ path }/product/detail?page=${ status.current }'">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/product/detail?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                            </div>
    
                        </div>
                    </div>
                    <div id="d4"></div>  
                </div>
            </div>
            <div id="s6">
                <hr style="width:80%">
                <div id="product-menu">
                    <a class="link" href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a class="link" href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a class="link" href="#review"> REVIEW </a> <span class="bar">|</span>
					<a class="link" name="qna" href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a class="link" href="#related"> 관련 상품</a>
                </div>
                <div id="product-qna-wrap">
                    <div id="d3">
                    
                    
                    </div>
                    
                    <div id="product-qna">
                    
              
                        <div id="d5">
                            
                        </div>
                        <div id="qna-name">
                            <h4><b>QnA</b></h4>
                        </div>
                        
                        <div id="qnaname">
                        <div style="width: 20%;" class="rfilter"><p>QnA</p></div>
                                <div style="width: 80%; text-align: right;"  class="rfilter" >
                                    <button>write</button>
                                    <button>list</button>
                                </div>
                        </div>
                        <div id="qna-content">
                         <div class="accordion" id="accordion1"> 
                            
                                <table id="review-table">
                                	<thead>
                                        <tr >
                                            <td align="center">번호</td>
                                            <td align="center">제목</td>
                                            <td>아이디</td>
                                            <td align="center">등록 시간</td>
                                            <td align="center">평점</td>
                                        </tr>
                                    </thead>
                                  <c:forEach var="productboard" items="${qnaboard}" varStatus="status">
                                  <tbody style="height: 60px;">
                                    <tr class="xans-record-" id="reviewline">
                                        <td  align="center">${productboard.pbno}</td>
                                        <td width="600px" >
<!--                                             <a data-toggle="collapse" href=#collapseExample${productboard.pbno} role="button" aria-expanded="false" aria-controls="collapseExample"> -->
										<c:if test="${not empty productboard.pbpwd }">
										<span class="material-symbols-sharp">
lock
</span>
										</c:if>
									 <a class="link" type="button" data-toggle="collapse" data-target="#collapseOne${productboard.pbno}" aria-expanded="false" aria-controls="collapseOne${productboard.pbno}">
                                            ${productboard.pbtitle}</a>
<!--                                             </a> -->
                                            <span>[1]</span>
                                        </td>
                                        <td>ismoon</td>
                                        <td align="center">${productboard.pbdate}</td>
                                 
                                        <td align="center"><c:choose>
                                            <c:when test="${productboard.pbgrade <= 4.5 && productboard.pbgrade > 3.5}">★★★★☆</c:when>
											<c:when test="${productboard.pbgrade <= 3.5 && productboard.pbgrade > 2.5}">★★★☆☆</c:when>
											<c:when test="${productboard.pbgrade <= 2.5 && productboard.pbgrade > 1.5}">★★☆☆☆</c:when>
											<c:when test="${productboard.pbgrade <= 1.5 && productboard.pbgrade > 0}">★☆☆☆☆</c:when>
											<c:when test="${productboard.pbgrade == 0}"></c:when>
										
											</c:choose></td>
                                    </tr>
                                    
                                    <c:if test="${not empty productboard.pbpwd }">
                                  <tr id="secretwrap${productboard.pbno}">
                                      
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbno}" id="toglespace"> --%>
           <div id="collapseOne${productboard.pbno}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
               <div>    
                <div class="secret">
                		<label for="password">비밀번호 : </label>
                     <input type="password" name="password" id="pwd1${productboard.pbno}" >
                     <button id="btnno" value="${productboard.pbno}" onclick="qnaStatus(${productboard.pbno}, '${productboard.pbpwd}')" > 확인 </button>
                </div>     
               <br><br>  
               </div>
           </div>
               </td>
            </tr>
            <tr id="pwdpasswrap${productboard.pbno}" style="display: none">                       
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbno}" id="toglespace"> --%>
                <div id="collapseOne${productboard.pbno}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
               <div>
                <div style="height: 80px; border: 1px solid #ccc; " id="reviewcontent" >
                     ${productboard.pbcontent}

                </div>
                <div style="height: 30px; border: 1px solid #ccc; padding: 5px;" >
                	<button type="button" data-toggle="modal" data-target="#staticBackdrop" id="reviewreply">댓글 작성</button> <button>신고 하기</button>
                </div>
                
                <br><br>
                <!-- <div class="replyform" >
                    <div style="height: 60%;">

                    </div>
                    <div style="">

                    </div>
              
                </div> -->
               </div>
                </div>
               </td>
            </tr>
            
            
            
            
            </c:if>
             <c:if test="${empty productboard.pbpwd }">
                              <tr>
                                      
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbno}" id="toglespace"> --%>
                <div id="collapseOne${productboard.pbno}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
               <div>
                <div style="height: 80px; border: 1px solid #ccc; " id="reviewcontent" >
                     ${productboard.pbcontent}

                </div>
                <div style="height: 30px; border: 1px solid #ccc; padding: 5px;" >
                	<button type="button" data-toggle="modal" data-target="#staticBackdrop" id="reviewreply">댓글 작성</button> <button>신고 하기</button>
                </div>
                
                <br><br>
                <!-- <div class="replyform" >
                    <div style="height: 60%;">

                    </div>
                    <div style="">

                    </div>
              
                </div> -->
               </div>
                </div>
               </td>
            </tr>
            </c:if>
            
            </tbody>
                                    </c:forEach>
                                      
                                </table>
                                </div>

                        </div>
                        <div id="qna-page">
						<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/product/detail?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage}">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>						
						<button onclick="location.href='${ path }/product/detail?page=${ status.current }'">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/product/detail?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        </div>

                    </div>
                    <div id="d4"></div>

                </div>


            </div>
            <div id="s7">
                <hr style="width:80%">
                <div id="product-menu">
                    <a href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a href="#review"> REVIEW </a> <span class="bar">|</span>
					<a href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a name="related" href="#related"> 관련 상품</a>
                </div>
                <div id="d2"></div>
                <div id="related-product-wrap">
                    <div id="d7">
                    </div>
                    <div id="related-product-name">
                        <h4><b>관련 상품</b></h4>
                        <div class=center id="related-list">
                            <div class="card">
                                <img src="https://perfumegraphy.com/web/product/medium/202212/c2f5f56e3ec2d6e90f4598d3ec4ce043.jpg" class="card-img-top" alt="..." >
                                <hr>
                                <div>
                               <h6>비터 피치 오 드 퍼퓸</h6>
                               <p class="card-text">[Cup] 300ml handle glass_good rest_ring</p>
                               <p class="card-text">16000 <span>won</span></p> 
                                </div>
                                <hr>
                                
                              </div>
                              <div class="card">
                                <img src="https://perfumegraphy.com/web/product/medium/202212/c2f5f56e3ec2d6e90f4598d3ec4ce043.jpg" class="card-img-top" alt="..." >
                                <hr>
                                <div>
                               <h6>비터 피치 오 드 퍼퓸</h6>
                               <p class="card-text">[Cup] 300ml handle glass_good rest_ring</p>
                               <p class="card-text">16000 <span>won</span></p> 
                                </div>
                                <hr>
                                
                              </div>
                              <div class="card">
                                <img src="https://perfumegraphy.com/web/product/medium/202212/c2f5f56e3ec2d6e90f4598d3ec4ce043.jpg" class="card-img-top" alt="..." >
                                <hr>
                                <div>
                               <h6>비터 피치 오 드 퍼퓸</h6>
                               <p class="card-text">[Cup] 300ml handle glass_good rest_ring</p>
                               <p class="card-text">16000 <span>won</span></p> 
                                </div>
                                <hr>
                                
                              </div>
                              <div class="card">
                                <img src="https://perfumegraphy.com/web/product/medium/202212/c2f5f56e3ec2d6e90f4598d3ec4ce043.jpg" class="card-img-top" alt="..." >
                                <hr>
                                <div>
                               <h6>비터 피치 오 드 퍼퓸</h6>
                               <p class="card-text">[Cup] 300ml handle glass_good rest_ring</p>
                               <p class="card-text">16000 <span>won</span></p> 
                                </div>
                                <hr>
                                
                              </div>
                              <div class="card">
                                <img src="https://perfumegraphy.com/web/product/medium/202212/c2f5f56e3ec2d6e90f4598d3ec4ce043.jpg" class="card-img-top" alt="..." >
                                <hr>
                                <div>
                               <h6>비터 피치 오 드 퍼퓸</h6>
                               <p class="card-text">[Cup] 300ml handle glass_good rest_ring</p>
                               <p class="card-text">16000 <span>won</span></p> 
                                </div>
                                <hr>
                              </div>
                        </div>
                    </div>
                    <div id="d8"></div>

                </div>


            </div>
       
        </div>
        </c:forEach>
        <div id="footer">
		<footer>
        <div>
            <nav class="footer-nav">
                <ul>
                    <li><a href="#">NOTICE</a>
                        <p>PERFUME의 중요 소식을 확인해보세요.</p>
                    </li>
                    <li><a href="#">SAMPLE</a>
                        <p>적당량의 SAMPLE을 소개합니다.</p>    
                    </li>
                    <li><a href="#">EVENT</a>
                        <p>다양한 이벤트에 참여해보세요</p>
                    </li>
                    <li><a href="#">ASK</a>
                        <p>언제나 고객과 함께하겠습니다.</p>
                    </li>
                </ul>
            </nav>
        </div>
        <pre class="footer-text">
            상호명 <b>PERFUME</b>     대표자 <b>이정수</b>     사업자등록번호 <b>123-45-67890</b>     통신판매업신고번호 <b>제 2023-서울강남-0001호</b><br>
            고객센터 <b>070-1212-3434</b>     주소 <b>06234 서울특별시 강남구 테헤란로 14길 6 (역삼동) 남도빌딩 4층 PERFUME </b><br>
            개인정보보호책임자 <b>공민지(cs@perfume.com)</b><br><br>    
            ※ <b>PERFUME</b>에서 제공하는 모든 콘텐츠는 <b>저작권법에 의하여 보호받는 저작물</b>로서, 모든 권리는 <b>PERFUME</b>에 있습니다.<br>
            본사이트에서 제공되는 콘텐츠를 무단으로 복제 및 배포하는 경우 <b>저작권법에 의하여 처벌</b>받을 수 있습니다.<br><br>
            <b>Copyright ⓒ PERFUME. All rights reserved.</b>
        </pre>
    </footer>
        </div>
    </div>
    
    
</body>
<script>

function qnaStatus(no, password) {
	console.log(no,password);
		
	pwd = $('#pwd1'+ no).val();
	console.log(pwd)
	       
	if(password == pwd ) {
		$('#secretwrap' + no).hide();
		$('#pwdpasswrap' + no).show();	
		
	}if(password !== pwd) {
		alert('비밀번호를 다시 입력해주세요');
	}
	

}









$("#mainimg").on({
    "mouseenter":function(){
       
        $(this).css({'opacity':'0.8'});

    },
    
    "mouseleave":function(){
        $(this).css({'opacity':'1'});
        
    }
  });



$(document).ready( function() {
        $('.center').slick({
  dots: true,
  infinite: false,
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 4,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
});
  
	
  });
  
  				
			

		
	
			
 	//   선택한 옵션의 값에 맞게 가격div 열기
	     $('#optselect').change(function() {
	    	
	    	 var result = $('#optselect option:selected').val();
	    	 console.log("result" + result);
	    	 $("#optselect option:eq(0)").prop("selected", true);
	    	
	    	
	    	 
	    	 $('.opt-table').each(function(index,item) {
	    		 var text = $(item).attr('data-id');
	    		var total = $(item).find('#selected-price').text();
	    		
	    		 if(text == result) {
	    			 
	    			 
	    		  $('#total').text(total);     
	   	    	  $('#opt'+text).show();
	   	    	 
	   	    	
	   	    	
	   	    	 }
	    	
	    		
	    		
	    			
	    		 
	    	
	   	      });		
	    	 var result2 = $('#optselect option:selected').val2();
	    	 console.log("result2" + result2);
	    		});
	    
	     
   	    	
	 
		
		  
		      
		      
	     
	
// });
	
   
      
      
      
    $('#reviewreply').on('click', () => {
				if(${ empty loginMember}) {
					alert('로그인 후 이용해 주세요.')	;
					
					$('.mainlogin').focus();
				}
			});
      
	


      
          
      
     
  
  	  




 
window.onload = function() {
      let bigPic = document.querySelector('.big');
      let smallPics = document.querySelectorAll('.img1');

      for(let i = 0; i < smallPics.length; i++) {
          smallPics[i].onclick = changepic;
      }

      function changepic() {
          let smallPicsAttribute = this.getAttribute('src');
          bigPic.setAttribute('src', smallPicsAttribute);
      }
  }

</script>




</html>