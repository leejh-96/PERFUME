<%@page import="java.util.Date"%>
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

  <script src="${path }/js/jquery-3.6.3.js"></script>
  <script src="${path }/slick/slick.min.js"></script>


  <link rel="stylesheet" href="${path }/slick/slick-theme.css">
  <link rel="stylesheet" href="${path }/slick/slick.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Open+Sans&display=swap');
    
        div * {
/*              border: 2px solid red;   */
            box-sizing: border-box;
            
        }

        body {
            /* background-color: #f6f6f2; */
        }
        #section2_1{
            font-family: 'Nanum Myeongjo', serif;
        /* background-color: #f6f6f2; */
        }
        .wrap {
            width:100%;
            height:3500px;
            margin:auto;
        }

        #header{
            height: 2%;
            
            background-color: white;
            /* position: fixed; */
            
          
        }

        #header1{ width: 30%;}
        #navigator{ width: 50%; }
        #header2{ width: 20%; }
        #header>div {
            float: left;
            height: 100%;
        }

        #section {
            height: 90%;
            
        }

        #footer {
            height: 8%;
            background-color: rgb(157, 226, 203);
        
        }
        #section1 {height: 15%;
             /* border-bottom: 1px solid;  */
             background-color: rgb(54, 58, 62);
             font-size: small; }
          #section2 {height: 85%; } 

        /* #section3 {height: 8%; text-align: center;}

        #section4 {height: 10%;}

        #section5 {height: 45%;} */
       

       #section2>div {height: 100%; float: left;}
       #aside1 {width: 12%;}
       #section2_1 {width: 76%;}
       #aside2 {width: 12%;}

       #s1 {height: 2%;}
       #s2 {height: 3%; }
       #s3 {height: 7%; }    
       #s4 {height: 13%; text-align: center;}
       #s5 {height: 11%;}
       #s6 {height: 64%; border-top: 2px;}

       #s3>div {float: left; height: 100%;}
       #s3_1 {width: 33%;}
       #s3_2 {width: 34%; font-size: smaller;}
       #s3_3 {width: 33%;}

       #s5_product {height: 50%;font-size: 25px; font-weight: bold;}
       #s5_button {height: 15%; text-align: center;}
       #s5_brand {height: 20%;  }
       #productfilter { height: 15%; border-top: 1px solid #ccc; text-align: right; }
       
       #s5_button>div {float: left; height: 100%;}
   

       #s5_brand>div { float: left; height: 100%;}
    

       #listwrap {height: 70%; }
       #pagebar {height: 30%; text-align: center; }



        

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

        h2 {
            line-height: 0;
        }

        a{  
        text-decoration: none;
        font-size: 13px;
        font-weight: 900;
        line-height: 3.5;
        }

        a:hover {
        text-decoration : none;
        font-size: 11px;
        }

    #scent {
    font-size: 25px;
    font-weight: bold;
    }
    
    
    .gender {
    width: 39%; 
    height: 100%; 
    font-size: 16px;
	border: 1px solid #ccc;
	color: #333;
	border-radius: 5px;
	outline: none;
    background-color: white;
	vertical-align: top;
    }
    
    .gender:hover {
        opacity:0.9;
    }



       #scents {
            /* padding: 10px; */
            /* box-sizing: border-box; */
            width: 130px;
            height: 110px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            /* padding: 0; */
            letter-spacing: -0.05em;
            outline: none;
            border-radius: 15px;
            color: #fff;
            font-size: 15px;
            line-height: 54px;
        }

        .listproduct {
            width: 23%;
            height: 40%;
    
        }

        #scent-detail {
            height: 60%;
            font-size:12px;
        }

        #button-area {
            height: 40%;
        }
        #scent-detail-button{
            font-size: 13px;
            border: 1px solid #ccc;
            color: white;
            border-radius: 10px;
            background-color: #f6f6f2;
            outline: none;
            vertical-align: top;
            background-color: rgb(216, 201, 134);
        }

    .card {
       
        margin:15px;
        border: none;
        /* background-color: #f6f6f2; */
        text-align: left;
        font-weight: bold;
    }

    


    .card-text {
        font-size: smaller;
    }

    .scent-text {
        position: absolute;
        top: 90px;
        left: 20px;
        z-index: 1;
    
    }

    #d1 {
        width: 30%;
    }

    #d2 {
        width: 30%;
    }

    

    .row { margin: 20px;}
    #s4>div {height: 100%; float: left;}
    
    #brand-select{height: 100%; }


    #d3 { width: 10%;}
    #d4 { width: 10%;}
    #scent-list {width: 80%; }
    
    .slick-arrow{
        background-color: black;
        font-size: 20px;
}
/* .slick-list {
  padding: 10px;
} */

    .spinner-wrapper{
       top: 0;
       left: 0;
       width: 100%;
       height: 30%;
       z-index: 9999;
       display: flex;
       justify-content: center;
       align-items: center;
       transition: all 2s;
    }  

    .spinner-wrapper2{
       top: 0;
       left: 0;
       width: 100%;
       height: 30%;
       z-index: 9999;
       display: flex;
       justify-content: center;
       align-items: center;
       transition: all 2s;
    }  

    .spinner-border {
        height: 40px;
        width: 40px;
    }

    .etcsymbols{ text-align: center; background-color: white;} 
    .p-status{text-align: right; height: 10%; padding: 5px;}


    .link {
        color: #333;
        font-size: 11px;
    }

 

    .slider .slick-list {
    margin:0 -20px;
}

.slick-slide {
    margin:0 20px;
}

.scentname {width: 100%; background-color: white; opacity: 0.8; text-align: center; font-weight: bold;  } 

    .banner>div{ height: 80%;float: left;}
    .btn_best {
        width: 50%;
        
    }

    .btn_sale {
        width: 50%;
    }


    .center {height: 50%;}
    .banner {height:50%;}

    #btn_wrap {padding: 10px; height: 100%;}
    #btn_wrap>img{height: 100%; width: 100%;}


    #s5_productwrap {height: 40%;}
    #d7 {height: 60%;}

	.originprice {font-size: 12px; color: slategray; text-decoration: line-through;}
	
	
.search {
    position: relative;
    text-align: center;
    width: 300px;
    margin: 0 auto;	
    
    border-bottom: 1px solid #ccc;
	}
	
	
  #searchform  {
 width: 100%;
    border-radius: 20px;
    border: 1px solid #bbb;
    margin: 10px 0;
    padding: 10px 12px;
} 

.searchimg {
  /* position : absolute; */
  width: 25px;
  top: 10px;
  right: 12px;
  margin: 0;
}

#searchbtn {
    position : absolute;
    top: 16px;
    right: 10px;
    height: 50%;
    width: 14%;
    background-color: white;
    border: none;
}
	
	
#pname {
	font-size: 14px; font-weight: bold;
}
	
	
#pprice {
	font-size: 16px;
}	
	
#new {
    height: 100%;
    border-radius: 0%;
    /* vertical-align: bottom; */
   /* margin-top: -100px; */
   background-color: teal;
}	
	
	
    </style>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />


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
            <div id="section1">
               <img src="">
            </div>
            <div id="section2">
                <div id="aside1">

                </div>
                <div id="section2_1">
                    <div id="s1">

                    </div>
                    <div id="s2" style="position: relative;">
                        <div style="position: absolute; height: 100%;">
                            <p></p>   
                        </div>
                        <p id="scent" align="center"> SCENT </p>
                        
                    </div>
                        
                    <div id="s3">
                        <div id="s3_1">

                        </div>
                        <div id="s3_2" style="text-align:center; position: relative;">
                            <div id="scent-detail">
                                정교하면서도 심플하고, <br>아름답게 빚어낸 퍼퓸의 다양한 프레그런스를 소개합니다. <br>
                                프레쉬하고 기분까지 좋아지는 시트러스 향부터 풍성한 플로럴 그리고 <br>
                                따스함이 느껴지는 우디함까지,<br>
                                6가지 향의 계열로 구분된 다양한 프레그런스 제품들을 만나보세요.
                            </div>
                            <div class="spinner-wrapper2" style="position: absolute; display: none;">
                                <div class="spinner-border" role="status">
                                    <span class="sr-only">Loading...</span>
                                  </div>
                                </div>
                          
                            <div id="button-area" >
                                <button type="button" id="scent-detail-button">more detail</button>
                               
                            </div>    
                            </div>
                        
                        <div id="s3_3">
                            
                        </div>
                    </div>
                    <div id="s4">
                        <div id="d3">
<%-- onclick="location.href='${ path }/board/list?page=1'" --%>
<%--  onclick="location.href='${ path }/list?scent=${topcate.ptno}'"  --%>
<%-- <a href="${ path }/scent?no=${topcate.ptno}"></a> --%>
                        </div>
                        <div id="scent-list">
                            <div class="center">
                            
                            	<c:forEach var="topcate" items="${ topcate }">
                                <div class="scentcate" style="position: relative;" data-id="${listcount2}" ><div class="scentname" style="position: absolute; bottom:0;">${topcate.ptname}</div>
                                <button type="button" id="scents" style="background-color: rgb(233, 203, 89);" value="${topcate.ptno}"  onclick="location.href='${ path }/scent?no=${topcate.ptno}'"></button>
                                </div>
                               	</c:forEach>
                            </div>
                            <div class="banner">
                            <div class="btn_best">
                                <div id="btn_wrap" style="position: relative;">
                                    <div style="position: absolute; color: black;  width: 100%; text-align: left; bottom: 20px;">
                                        <h6 style="font-size: 25px; font-weight: bold;">BEST PRODUCT</h6>
                                    </div>
                                    <img src="https://img.freepik.com/premium-photo/medicinal-herbs-and-tinctures-homeopathy-selective-focus_73944-28706.jpg?size=626&ext=jpg&ga=GA1.1.686292353.1680604484&semt=sph" class="" alt="...">
                                    
                                </div>
                            </div>
                            <div class="btn_sale">
                                <div id="btn_wrap" style="position: relative;">
                                    <div style="position: absolute; color: gray; font-weight: bold; width: 100%; text-align: left; bottom: 20px;">
                                        <h6 style="font-size: 25px; font-weight: bold;">SALE PRODUCT</h6>
                                    </div>
                                    <img src="https://img.freepik.com/free-photo/top-view-closeup-of-white-daisy-flowers-floating-on-the-water_181624-38043.jpg?size=626&ext=jpg&ga=GA1.1.686292353.1680604484&semt=sph" class="" alt="..." >
                                </div>
                            </div>
                            </div>
                        </div>
                        <div id="d4">

                        </div>



                    </div>

                  
                    <div id="s5">
                        <div id="s5_product">
                        <div id="d7">
                        </div>
                        <div id="s5_productwrap">
                            <div align="center">
                                PERFUME
                                </div>
                        </div>
                    </div>
                        <div id="s5_button">
                          
                          <button class="gender" type="button" id="gender1" value="F"  onclick="location.href='${ path }/product/list?gender=F'">FEMME</button> &nbsp; &nbsp;
                            <button class="gender" type="button" id="gender1" value="M" onclick="location.href='${ path }/product/list?gender=M'">HOMME</button> 
                        </div>
                        <div id="s5_brand">
                            <!-- <p id="scent"><mark  style="background-color: rgb(243, 239, 236)"> BRAND</mark>  </p> -->
                            <table id="brand-select">
                            <tr>
                                <th  width="100px">BRAND</th>
                                <c:forEach var="product" items="${ brand }">
                                
                                <td >
                            
                                <label for="brand"></label>
                    			 <c:if test="${not empty gender}">
                                <input type="checkbox" name="brand" onclick="location.href='${ path }/product/list?gender=${gender}&bn=${product.brand}'" >${product.brand}
                                 </c:if>
                                 <c:if test="${empty gender}">
                                 <input type="checkbox" name="brand" onclick="location.href='${ path }/product/list?bn=${product.brand}'" >${product.brand}
                                 </c:if>
                                </td>
                                
                                </c:forEach>
                            </tr>
                            </table>
                        </div>
                    
                        <div id="productfilter">
                        <c:choose>
                        	<c:when test="${not empty gender && not empty bn}">
                        		<a class="link"	href="${ path }/product/list?gender=${gender}&bn=${bn}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/list?gender=${gender}&bn=${bn}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?gender=${gender}&bn=${bn}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?gender=${gender}&bn=${bn}&sort=4"> 사용 후기</a>
                        	</c:when>
                        	<c:when test="${not empty gender && empty bn}">
                        		<a class="link"	href="${ path }/product/list?gender=${gender}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/list?gender=${gender}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?gender=${gender}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?gender=${gender}&sort=4"> 사용 후기</a>
                        	</c:when>
                        	<c:when test="${empty gender && not empty bn}">
                        		<a class="link"	href="${ path }/product/list?bn=${bn}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/list?bn=${bn}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?bn=${bn}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?bn=${bn}&sort=4"> 사용 후기</a>
                        	</c:when>
                        	<c:otherwise>
	                        	<a class="link"	href="${ path }/product/list?sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/list?sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/list?sort=4"> 사용 후기</a>
                        	</c:otherwise>
                        </c:choose>
                        </div>
                       
                    </div>
                    <div id="s6" >
                        <div id="listwrap" style="position: relative;">   
                            <div class="spinner-wrapper" style="position: absolute; display: none;"  >
                                <div class="spinner-border" role="status">
                                    <span class="sr-only">Loading...</span>
                                  </div>
                                </div>
                            <div class="row" ><c:if test="${empty list }">
                            <div class=" col-lg-12" style="text-align: center; font-size: 25px;" >
                                    조회된 검색 결과가 없습니다.

                                    </div>
                                    
                               </c:if>
                                    <c:forEach var="product" items="${ list }">
  
                                    <fmt:formatDate value="${product.date}" pattern="yyyy-MM-dd hh:mm:ss" var="newdate"/>
                                    
                                   <c:set var="sevenDayAfter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*7)%>"/>
                                   <fmt:formatDate value="${sevenDayAfter}" pattern="yyyy-MM-dd hh:mm:ss" var="sevenDayAfterStr"/>
                                 
                                <div class="col-sm-6 col-lg-3">
                     
                                    <div class="card">
                                        <div style="position: relative;"> <a href="${ path }/product/detail?no=${product.pno}"> <img src="https://perfumegraphy.com/web/product/medium/202204/4b8b15fa7d389cd0aa2743c699bd1cd5.jpg" class="card-img-top" alt="..." > </a></div>
                                        <div class="p-status"style="position: absolute; width: 100%;">
                                        
<%--                                         <c:if test="${product.date}"> --%>
                                        
                                        <span class="badge badge-danger">new</span>
<%--                                         </c:if> --%>
                                        
                                      <%--   <c:forEach var="benefit" items="${product.benefit}">
                                        	<c:if test="${benefit.bnenddate > today}">
                                        		<c:if test="${benefit.bnname eq ('기획전')}">
                                            		<span class="badge badge-danger">기획전</span>
                                            	</c:if>
                                            	<c:if test="${benefit.bnname eq ('이벤트')}">
                             	              		 <span class="badge badge-danger">이벤트</span>
                                            	</c:if>
                                            </c:if>
                                            </c:forEach> --%>
                                        </div>
                                        <div class="etcsymbols"style="position: absolute; width: 100%; height: 8%; bottom: 170px ">
                                            <span class="material-symbols-outlined">favorite</span>&nbsp;&nbsp;
                                            <span class="material-symbols-outlined">shopping_cart</span>&nbsp;&nbsp;
                                            <span class="material-symbols-outlined">share</span>
                                        </div>
                                        
                                        <div>
                                       
                                       <h5 id="pname">${product.name } </h5>
                                       <p class="card-text">${product.eng }</p>
                                   
                                        </div>
                                        
                                        <hr>
                                          <c:forEach var="benefit" items="${product.benefit}">
                                          <fmt:formatDate value="${benefit.bnenddate}" pattern="yyyy-MM-dd" var="enddate"/> 
                                           <c:if test="${not empty product.benefit }">
                                           
                                        	<p class="card-text" id="pprice">${product.price } <span>won</span> <br>
                                            <span class="originprice">${product.price }<span class="originprice">won</span></span></p>
                                        	</c:if>
                                          
                                          </c:forEach>
                                          <c:if test="${empty product.productbenefit }">
                                          <p class="card-text" id="pprice">${product.price } <span>won</span></p> 
                                          </c:if> 
                                          
                                         <%--  </c:forEach> --%>
                                      </div>
                                      </div>  
                                </c:forEach>
                                </div>  
                            </div>
                        
                        <div id="pagebar">
                        	<div>
                              
                                <div class="search">
                                <form action="${path }/product/list?search" method="GET">
                                
                                    <input type="text" name="keyword" placeholder="검색어 입력" id="searchform">
                                    <button type="button"id="searchbtn" ><span class="material-symbols-outlined">
                                        search
                                        </span></button>
                                </form>
                                </div>
                                 
                            </div>
                            <br>
                        <c:choose>
                        	<c:when test="${not empty gender && not empty bn}">
                        		<button onclick="location.href='${ path }/product/list?gender=${gender}&bn=${bn}&page=1'">&lt;&lt;</button>
							    <button onclick="location.href='${ path }/product/list?gender=${gender}&bn=${bn}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/list?page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/list?gender=${gender}&bn=${bn}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/list?gender=${gender}&bn=${bn}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        	
                        	</c:when>
                        
                        <c:when test="${not empty gender && empty bn}">
                        	<button onclick="location.href='${ path }/product/list?gender=${gender}&page=1'">&lt;&lt;</button>
							<button onclick="location.href='${ path }/product/list?gender=${gender}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/list?page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/list?gender=${gender}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/list?gender=${gender}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        
                        </c:when>
                        
                        <c:when test="${empty gender && not empty bn}">
                        	<button onclick="location.href='${ path }/product/list?bn=${bn}&page=1'">&lt;&lt;</button>
							<button onclick="location.href='${ path }/product/list?bn=${bn}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/list?page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/list?bn=${bn}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/list?bn=${bn}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        </c:when>
                        <c:otherwise>
							<button onclick="location.href='${ path }/product/list?page=1'">&lt;&lt;</button>
							<button onclick="location.href='${ path }/product/list?page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/list?page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/list?page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
						</c:otherwise>
						</c:choose>
                        </div>
                       
                    </div>
                </div>
                <div id="aside2">
                
                
                </div>
            </div>
        </div>
        <div id="footer">

        </div>
    </div>
</body>



<script>
 

     
    var gender = document.getElementsByClassName('gender');
    

    for (var i = 0; i < gender.length; i++) {
        gender[i].addEventListener('click', function(){
        for (var j = 0; j < gender.length; j++) {
            
            
            gender[j].style. fontWeight= "100";
            gender[j].style.backgroundColor= "white";
            gender[j].style.color = "rgbrgb(190, 190, 190)";
            gender[j].style.borderColor="rgb(190, 190, 190)";

        }
        this.style.fontWeight = "700";
        this.style.color = "black";
        this.style.backgroundColor ="white";
        this.style.borderColor="black";
        
      })
    }




    $(document).ready( function() {
    	var id = $(".scentcate").attr('data-id') -1;
        $('.center').slick({
        	 dots: true,
        	  infinite: false,
        	  speed: 300,
        	  slidesToShow: 5,
        	  slidesToScroll: 1
        	  
        	});
        	  
        		
        	  });

   
    $(document).ready(function() {
    $(".gender").on({
        "click":function(){
        	
            $(".spinner-wrapper").show().delay(500).fadeOut(300);
            $(".row").hide().delay(600).fadeIn(400);
           

           
        }

    

    });

    $(".link").on({
        "click":function(){
            $(".spinner-wrapper").show().delay(500).fadeOut(300);
            $(".row").hide().delay(600).fadeIn(400);
    }

    });


    $(".scentcate").on({
        "click":function(){
            $(".spinner-wrapper2").show().delay(500).fadeOut(300);
            $("#scent-detail").hide().delay(600).fadeIn(400);
            $("#button-area").hide().delay(600).fadeIn(400);
            $("#scent").hide().delay(600).fadeIn(400);
    }


    });

});

 
   

  
  $(".card-img-top").on({
    "mouseover":function(){
       
        $(this).css({'opacity':'0.5'});
        $(".etcsymbols").fadeIn(200);
        // $(".etcsymbols").css({'opacity':'0.5'});



    },
    "mouseout":function(){
        $(this).css({'opacity':'1'});
        $(".etcsymbols").fadeOut(200);

    }


  });

  $(".scentcate").on({
    "mouseover":function(){
       
       $(this).css({'opacity':'0.8'});
    



   },
   "mouseout":function(){
       $(this).css({'opacity':'1'});

   }

  });
</script>
</html>