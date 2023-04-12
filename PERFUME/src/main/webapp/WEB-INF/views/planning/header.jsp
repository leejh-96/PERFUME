<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Perfume</title>
    <!-- CSS 불러오기 -->
    <link rel="stylesheet" href="${ path }/css/planning/header.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- jQuery 불러오기 -->
    <script src="${ path }/js/jquery-3.6.3.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <!-- 로그인 API 자바스크립트 불러오기 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
    <header>
        <div class="header-container">
            <nav class="main-nav">
                <ul>
                    <li><a href="#">ABOUT US</a></li>
                    <li><a href="#">SPECIAL</a></li>
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
						</c:if>
						<c:if test="${ not empty loginMember && loginMember.division == '1' }">
							<li><a href="#">ADMIN PAGE</a></li>                                        
						</c:if>              
                    </c:if>
                </ul>
            </nav>
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
    
    <script>
 		// 로그인 모달창
	    // 모달창 가져오기
	    var modal = document.querySelector('.modal');
	
	    // 모달창을 열 버튼 가져오기
	    var btn = document.querySelector('.openLogin');
	
	    // 모달창을 닫는 span 요소 가져오기
	    var span = document.querySelector('.close');
	
	    // 모달창 버튼 클릭 시 모달창 구현 
	    btn.onclick = function() {
	        modal.style.display = 'block';
	    }
	
	    // X버튼 클릭 시 모달창 닫기
	    span.onclick = function() {
	        modal.style.display = 'none';
	    }
	
	    // 모달창 바깥 클릭 시 모달창 닫기
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = 'none';
	        }
	    }
	
	    // 카카오로 로그인 구현
	    Kakao.init('838aa760211421e8483192e159afd189'); //발급받은 키 중 javascript키를 사용해준다.
	    console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
	    function kakaoLogin() {
	        Kakao.Auth.login({
	        success: function (response) {
	            Kakao.API.request({
	            url: '/',
	            success: function (response) {
	                console.log(response)
	            },
	            fail: function (error) {
	                console.log(error)
	            },
	            })
	        },
	        fail: function (error) {
	            console.log(error)
	        },
	        })
	    }
	
	    // 네이버로 로그인 구현
	    var naver_id_login = new naver_id_login("e8Ese8BEMBY_9FWnW9xY", "http://localhost:8088/perfume/");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2,40);
		naver_id_login.setDomain("http://localhost:8088");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
    </script>
        
    </header>