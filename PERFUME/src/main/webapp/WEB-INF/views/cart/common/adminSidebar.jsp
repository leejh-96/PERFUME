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
<title>사이드바</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${ path }/css/planning/header.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
/* 관리자 사이드바 */
.sidebar{
    background-color:  rgb(246, 247, 242);

}
.admin-sidebtn{
    width: 100%;

}
#cart-wrap{
    background-color: rgb(246, 247, 242);
}
.sidemenu{
	display : flex;
	justify-content: center;
	align-items: center;
	height: 150px;
}
.sidemenu *{
	font-weight: bolder;
	font-size: large;
	color: highlight;
}
/* 관리자 사이드바 */
</style>
</head>
<body>

<header>
        <div class="header-container">
            <nav class="main-nav">
                <ul>
                    <li><a href="${ path }/aboutSite">ABOUT US</a></li>
                    <li><a href="${ path }/planning/special">SPECIAL</a></li>
                    <li><a href="${ path }/product/list">SCENT</a></li>
                    <li><a href="#">MOUILLETTE</a></li>
                </ul>
            </nav>
            <h1 class="logo"><a href="${ path }/">Perfume</a></h1>
            <nav class="user-nav">
                <ul>
                    <li><a href="${ path }/eventList">EVENT</a></li>
                    <li><a href="${ path }/board/list">COMMUNITY</a></li>
                    <c:if test="${ empty loginMember }">
	                    <li><a href="#" class="openLogin">LOGIN</a></li>
	                    <li><a href="${ path }/join">JOIN</a></li>
                    </c:if>
                    <c:if test="${ not empty loginMember }">
						<li><a href="${ path }/logout">LOGOUT</a></li>
						<c:if test="${ not empty loginMember && loginMember.division == '2' }">
							<li><a href="${ path }/mypage">MY PAGE</a></li>                                      
							<li><a href="${ path }/cart">CART</a></li>                                      
						</c:if>
						<c:if test="${ not empty loginMember && loginMember.division == '1' }">
							<li><a href="${ path }/admin/home">ADMIN PAGE</a></li>                                        
						</c:if>              
                    </c:if>
                </ul>
            </nav>
        </div>
</header>



	<div id="cart-wrap" >
    <div class="container">
        <div class="row">
        
        <!-- col-2 div 시작 -->
                <div class="col-2 sidebar">
                    <div class="nav flex-column ">
                    
	                    <div class="dropdown sidemenu">
	                        <button type="button" class="btn btn-warning admin-sidebtn" onclick="location.href='${path}/admin/home'">
	                            HOME
	                        </button>
	    				</div>
	    				
                        <div class="dropdown sidemenu">
                            <button type="button" class="btn btn-warning dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            회원관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/memberList">회원리스트(수정/삭제)</a>
                            </div>
                        </div>
                        
                        <div class="dropdown sidemenu">
                            <button type="button" class="btn btn-warning dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            커뮤니티관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/planning/special">기획전바로가기</a>
                                <a class="dropdown-item" href="${path}/eventList">이벤트바로가기</a>
                                <a class="dropdown-item" href="${path}/board/list">공지사항바로가기</a>
                            </div>
                        </div>
    
                        <div class="dropdown sidemenu">
                            <button type="button" class="btn btn-warning dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            상품관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/product">상품등록</a>
                                <a class="dropdown-item" href="${path}/admin/productList">상품리스트(수정/삭제)</a>
                            </div>
                        </div>
    
                        <div class="dropdown sidemenu">
                            <button type="button" class="btn btn-warning dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            혜택관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/benefit">혜택등록</a>
                                <a class="dropdown-item" href="${path}/admin/benefitList">혜택리스트(수정/삭제)</a>
                            </div>
                        </div>
                        
                        <div class="dropdown sidemenu">
                            <button type="button" class="btn btn-warning dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            주문관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/orderList">주문현황리스트</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- col-2 div 끝 -->
				
                <!-- col-10 div 시작 -->
                <div class="col-10">
</body>
</html>