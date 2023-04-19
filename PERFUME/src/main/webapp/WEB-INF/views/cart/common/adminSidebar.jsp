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
/* 관리자 사이드바 */
</style>
</head>
<body>
	<div id="cart-wrap" >
    <div class="container">
        <div class="row">
        
        <!-- col-2 div 시작 -->
                <div class="col-2 sidebar">
                    <div class="nav flex-column">
                        <button type="button" class="btn btn-outline-secondary" onclick="location.href='${path}/admin/home'">
                            HOME
                        </button>
    
                        <div class="dropdown dropright">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            회원관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/memberList">회원리스트</a>
                            </div>
                        </div>
                        
                        <div class="dropdown dropright">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            커뮤니티관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Link 1</a>
                                <a class="dropdown-item" href="#">Link 2</a>
                                <a class="dropdown-item" href="#">Link 3</a>
                            </div>
                        </div>
    
                        <div class="dropdown dropright">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            상품관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/product">상품등록</a>
                                <a class="dropdown-item" href="${path}/admin/productList">상품수정/삭제</a>
                            </div>
                        </div>
    
                        <div class="dropdown dropright">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle admin-sidebtn" data-toggle="dropdown">
                            혜택관리
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${path}/admin/benefitList">혜택리스트</a>
                                <a class="dropdown-item" href="${path}/admin/benefit">혜택등록</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- col-2 div 끝 -->
				
                <!-- col-10 div 시작 -->
                <div class="col-10">
</body>
</html>