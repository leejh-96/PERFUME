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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="./js/jquery-3.6.3.js"></script>
  <script src="./slick/slick.min.js"></script>

  <link rel="stylesheet" href="./slick/slick-theme.css">
  <link rel="stylesheet" href="./slick/slick.css">
<style>
       div * {
            /* border: 2px solid red; */
            box-sizing: border-box;
            
        }

        .wrap {
            width:100%;
            height:7500px;
            margin:auto;
            font-family: 'Nanum Myeongjo', serif;
             /* background-color: #f6f6f2; */
        }

        #header {height: 1%;  background-color: navy;}
        #section {height: 96%;}
        #footer {height: 3%; background-color: beige}
     

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


        #s1 {height: 2%;}

        #s2 {height: 16%;}

        #s3 {height: 38%;}

        #s4 {height: 13%;}

        #s5 {height: 13%;}

        #s6 {height: 10%;}

        #s7 {height: 8%;}






        #navi{
            list-style-type: none;
            margin:0;
            padding:0;
            height:100%;
            
        }

        #navi>li{
            float:left;
            width:25%;
            height:100%;
            text-align:center;
            font-size:11px;
            line-height:35px;
           
        }

        #navi a{
            text-decoration: none;
           
            font-size: 1.4em;
            font-weight: 900;
            height: 100%;
            line-height: 3;
        }

        #navi a:hover{
            color: darkblue;
        }

        #navi>li>ul{
            list-style-type: none;
            padding: 0;
            display: none;
        }

        #navi>li>a:hover+ul{
            display: block;
        }

        #navi>li>ul:hover {
            display: block;
        }

        #navi>li>ul a{
            font-size: 1.4em;
        }

      

        /* a{  
        text-decoration: none;
        font-size: 13px;
        font-weight: 900;
        line-height: 3.5;
        } */

        a:hover {
        color: darkblue;
        text-decoration : none;
        font-size: 13px;
        }
        

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
        #qna-content {height: 82%;}
        #qna-page{height: 7%;}
        

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


        #review-filter {height: 7%;}
        #review-content{height: 86%;}
        #review-page {height: 7%;}

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

       #related-list {height: 92%;}
    

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

    .img1 {max-width: 100%;
    }

    .big { max-width: 100%;}
    #sumbimg2{width: 25%;}
    #sumbimg3{width: 25%;}


    .selected-opt{font-size: 11px; width: 100%; }
    .opt-table {height: 60px; width: 100%;}

    .quantity {width: 15%;}
    #quantity {width: 15%; height: 50%; text-align: center; font-size: 12px;}

    .opt-table>div{height: 100%; float: left;}
</style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header1">
                <h2 align="center">planner</h2>
            </div>
            <div id="navigator">
                <ul id="navi">
                    <li><a href="#">menu1</a></li>
                    <li>
                        <a href="#">menu2</a>
                        <ul>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">menu3</a>
                        <ul>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                            <li><a href="#">x</a></li>
                        </ul>
                    </li>
                    <li><a href="#">menu4</a></li>
                </ul>
            </div>
            <div id="header2">
                <a href="#" id="login">Log In</a>
            </div>
        </div>
        <div id="section">
            <div id="s1">
                
            </div>
            <div id="s2">
               
                <div id="product-image">
                    <div style="width: 20%;">

                    </div>
                    <c:forEach var="product" items="${ list }">
                    <div style="width: 70%;"  >
                        <div style="height: 60%; width: 100%;">
                        <img src="https://www.chanel.com/images/t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.2/w_620//bleu-de-chanel-eau-de-toilette-spray-3-4fl-oz--packshot-default-107460-9518357020702.jpg" class="big" alt="">
                        </div>  
                        
                        <div id="sumb-wrap" style="height: 15%;">
                            <div id="sumbimg1" >
                                <img src="https://www.chanel.com/images/t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.2/w_620//bleu-de-chanel-eau-de-toilette-spray-3-4fl-oz--packshot-default-107460-9518357020702.jpg" class="img1" alt="">
                            </div>
                            <div id="sumbimg2" >
                                <img src="https://www.chanel.com/images//t_one/t_fnbedito//q_auto:good,f_auto,fl_lossy,dpr_1.2/w_620/bleu-de-chanel-eau-de-parfum-spray-3-4fl-oz--packshot-alternative-v1-107360-8851960922142.jpg" class="img1" alt="">
                            </div>
                            <div id="sumbimg3" >
                               
                            </div>
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
                        <h6 style="font-size: 12px;">scent : <span><strong>     woody</strong> </span></h6>  
                        <h6 style="font-size: 12px;">size :  <span><strong>   30ml, 50ml, 100ml</strong></span> </h6>    
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
                        
                        
                       
                        <h3><strong>${product.price }</strong></h3>
                     	
                        </div>
                        <div id="origin_price">
                       
                        </div>
                        <div id="sale">
                            <h3>10%</h3>
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
                                    
                                    <c:forEach var="option" items="${product.option}">
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
                              <c:forEach var="option" items="${product.option}">
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
                                    <span id="selected-price">${option.poprice}</span>&nbsp;<span>원<span>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="prepareOrder.delBuyGoods($(this),1,0);prepareOrder.getSizeRecommend('product_size_recommend','2060719','0',false,'');return false;">x</a></span>
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
                    
                    <a name="pinfo" href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a href="#review"> REVIEW </a> <span class="bar">|</span>
					<a href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a href="#related"> 관련 상품</a>
                </div>
                <div id="product">
                    <div>
                     <img src="https://www.chanel.com/images//t_one/t_fnbedito//q_auto:good,f_auto,fl_lossy,dpr_1.2/w_620/bleu-de-chanel-eau-de-toilette-spray-3-4fl-oz--packshot-alternative-v1-107460-8851960627230.jpg" alt="">
                    </div>
                    <div>
                    <img src="https://www.chanel.com/images//t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.2/w_620/bleu-de-chanel-eau-de-toilette-spray-3-4fl-oz--packshot-default-107460-9518357020702.jpg" alt="">
                    </div>
                    <div>
                    <img src="https://www.chanel.com/images//t_one//w_0.51,h_0.51,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.2/w_620/bleu-de-chanel-2-in-1-moisturizer-for-face-and-beard-1-7fl-oz--packshot-default-107680-8833833762846.jpg" alt=""> 
                    </div>
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
                    <a href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a name="payguide"	href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a href="#review"> REVIEW </a> <span class="bar">|</span>
					<a href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a href="#related"> 관련 상품</a>
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
                    <a href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a name="review" href="#review"> REVIEW </a> <span class="bar">|</span>
					<a href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a href="#related"> 관련 상품</a>
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
                            <div id="grade">
                                <br>
                                <h1>4.7 <span>/</span> <span>5</span></h1>
                                <h6>3명 참여</h6>
                                 
                            </div>
                            <div id="grade_graph"></div>
                        </div>
                        <div id="review-wrap">
                            <div id="review-filter">
                                

                            </div>
                            <div id="review-content">
                                <table id="review-table">
                                    <tr class="xans-record-">
                                        <td>4</td>
                                        <td width="800px">
                                            <a href="">이정도면 만족스럽네요 !</a><span>[1]</span>
                                        </td>
                                        <td>ismoon</td>
                                        <td>2022-12-30 03:26:10</td>
                                        <td>121</td>
                                        <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"/></td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>4</td>
                                        <td width="800px">
                                            <a href="">아주 실망스럽네요..</a><span>[1]</span>
                                        </td>
                                        <td>test1</td>
                                        <td>2022-12-30 03:26:10</td>
                                        <td>67</td>
                                        <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"/></td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>4</td>
                                        <td width="800px">
                                            <a href="">만족</a><span>[1]</span>
                                        </td>
                                        <td> 네이버 페이 구매자</td>
                                        <td>2022-12-30 03:26:10</td>
                                        <td>28</td>
                                        <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"/></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="review-page">

                            </div>
    
                        </div>
                    </div>
                    <div id="d4"></div>  
                </div>
            </div>
            <div id="s6">
                <hr style="width:80%">
                <div id="product-menu">
                    <a href="#pinfo"> 상품 상세정보 </a> <span class="bar">|</span> 
                    <a href="#payguide"> 상품 구매안내 </a> <span class="bar">|</span> 
					<a href="#review"> REVIEW </a> <span class="bar">|</span>
					<a name="qna" href="#qna"> 상품 QNA </a> <span class="bar">|</span>
					<a href="#related"> 관련 상품</a>
                </div>
                <div id="product-qna-wrap">
                    <div id="d3"></div>
                    <div id="product-qna">
                        <div id="d5">
                            
                        </div>
                        <div id="qna-name">
                            <h4><b>QnA</b></h4>
                        </div>
                        <div id="qna-content">
                            <table id="review-table">
                                <tr class="xans-record-">
                                    <td>4</td>
                                    <td width="800px">
                                        <a href="">이정도면 만족스럽네요 !</a><span>[1]</span>
                                    </td>
                                    <td>ismoon</td>
                                    <td>2022-12-30 03:26:10</td>
                                    <td>121</td>
                                    <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"/></td>
                                </tr>
                                <tr class="xans-record-">
                                    <td>4</td>
                                    <td width="800px">
                                        <a href="">아주 실망스럽네요..</a><span>[1]</span>
                                    </td>
                                    <td>test1</td>
                                    <td>2022-12-30 03:26:10</td>
                                    <td>67</td>
                                    <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"/></td>
                                </tr>
                                <tr class="xans-record-">
                                    <td>4</td>
                                    <td width="800px">
                                        <a href="">만족</a><span>[1]</span>
                                    </td>
                                    <td> 네이버 페이 구매자</td>
                                    <td>2022-12-30 03:26:10</td>
                                    <td>28</td>
                                    <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"/></td>
                                </tr>
                               
        
                                    </table>


                        </div>
                        <div id="qna-page">

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

        </div>
    </div>
</body>
<script>
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

 
$(document).ready(function() {
		
	
			
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
	    
	     
   	    	
	 	});
		
		  
		      
		      
	     
	
// });
	
   
      
      
      
    
      
	
      
      
      
    
      
     
  
  	  




 
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