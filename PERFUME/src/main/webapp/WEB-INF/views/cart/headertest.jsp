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
    <meta name ="google-signin-client_id" content="176536335938-dmlgnn72m6p2pia44gdoarb4iejs7u3t.apps.googleusercontent.com">
    <title>Perfume</title>
    <!-- CSS 불러오기 -->
    <link rel="stylesheet" href="${ path }/css/planning/header.css">
    <!-- jQuery 불러오기 -->
    <script src="${ path }/js/jquery-3.6.3.js"></script>
    <!-- 로그인 API 자바스크립트 불러오기 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<style type="text/css">
* {
    box-sizing: border-box;
    /* border: 1px solid red; */
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
}

.header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1200px;
    margin: 0 auto;
    padding: 20px;
    height: 100px;
}

.logo {
    font-size: 36px;
    font-weight: bold;
}

a {
	text-decoration: none;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
}

nav li {
    margin-right: 20px;
}

nav a {
    text-decoration: none;
    color: #333;
    font-size: 18px;
    font-weight: bold;
}

/* 모달창 CSS */
/* .modal {
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
 */
 .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
} 
	/* ==== */
	input,button{
		border: none;
		font-weight: bolder;
		border-radius: 10px;
	}
	#id,#pwd{
		border: 1px solid gray;
	}
	#modaldivwrap{
		width: 600px;
		text-align: center;	
	}
	#modaldivwrap div{
		height: 30px;
		margin: 5px;
	}
	#modaldivwrap input{
		width: 60%;
		height: 100%;
		
	}
	#loginbtn{
		width: 60%;
		height: 100%;
		background-color: orange;
		color: white;
		font-size: x-large;
		font-weight: bolder;
		
	}
	#finddivwrap{
		margin: 15px;
		width: 600px;
		display: flex;
		justify-content: center;
	}
	#findId,#findPwd{
		font-size: x-large;
		font-weight: bolder;
	}
	#finddivwrap > div{
		width: 358px;
	}
	#finddivwrap > div > div{
		vertical-align: middle;
		float: left;
		width: 50%;
	}
	#finddivwrap > div > div > a{
		display: flex;
		justify-content: space-around;
	}
	#finddivwrap > div > div > a > button {
		width: 100%;
	}
	#ulwrap{
		width: 600px;
		height: 70px;
		text-align: center;	
		padding: 0;
		margin: 0;
		line-height: 35px;
	}
	#ulwrap li{
		display: inline-block;
		width: 358px;
	}
	#ulwrap li > button{
		width: 100%;
		height: 30px;
	}
	.modal-content{
		padding-bottom: 100px;
	}
	
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
							<li><a href="${ path }/mypage/mypage">MY PAGE</a></li>                                      
							<li><a href="${ path }/cart">CART</a></li>                                      
						</c:if>
						<c:if test="${ not empty loginMember && loginMember.division == '1' }">
							<li><a href="${ path }/admin/home">ADMIN PAGE</a></li>                                        
						</c:if>              
                    </c:if>
                </ul>
            </nav>
        </div>

        <!-- 로그인 모달창 구현 -->
        <div id="mymodal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="text-align: center;">LOGIN</h2>
                <form id="loginForm" action="${ path }/login" method="POST">
                    <div id="modaldivwrap">
	                        <label for="id" style="font-weight: bold;"> <span class="spanlogin">아이디</span> </label>
                    	<div>
	                        <input type="text" id="id" name="id" required placeholder="아이디를 입력하세요.">
                        </div>
	                        <label for="pwd" style="font-weight: bold;"><span class="spanlogin">비밀번호</span></label>
                        <div>
	                        <input type="password" id="pwd" name="pwd" required placeholder="비밀번호를 입력하세요.">
                        </div>
                        <div>
                        	<button type="submit" id="loginbtn">Login</button>
                    	</div>
                    </div>
                </form>
                    <div id="finddivwrap">
                    	<div>
                    		<div>
	                        	<a href="${ path }/planning/findId"><button type="button" id="findId" class="close" onclick="findId()">아이디 찾기</button></a>
	                        </div>
	                        <div>
	      						<a href="${ path }/planning/findPwd"><button type="button" id="findPwd" class="close" onclick="closeModal()">비밀번호 찾기</button></a>
	      					</div>
                    	</div>
                    </div>
                    <ul style="list-style: none;" id="ulwrap">
                        <li onclick="kakaoLogin();"><button type="button" style="background-color: yellow;">카카오로 로그인</button></li>
                        <li id="googleLogin" onclick="googleLogin();"><button type="button">구글로 로그인</button></li>
                    </ul>
            </div>
        </div>
    
    <script>
    
    
    
 		/* // 로그인 모달창
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
	    
	    function closeModal() {
	    	modal.style.display = 'none';
	    } */
	
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
        
        // 구글로 로그인 구현
        // 처음 실행하는 함수
		function init() {
			gapi.load('auth2', function() {
				gapi.auth2.init();
				options = new gapi.auth2.SigninOptionsBuilder();
				options.setPrompt('select_account');
		        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
				options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
		        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
		        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
				gapi.auth2.getAuthInstance().attachClickHandler('googleLogin', options, onSignIn, onSignInFailure);
			})
		}
		
		function onSignIn(googleUser) {
			var access_token = googleUser.getAuthResponse().access_token
			$.ajax({
		    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
				url: 'https://people.googleapis.com/v1/people/me'
		        // key에 자신의 API 키를 넣습니다.
				, data: {personFields:'birthdays', key:'AIzaSyAsg64zU00dzB-UbgI-Zyp7cXvr6qphxQc', 'access_token': access_token}
				, method:'GET'
			})
			.done(function(e){
		        //프로필을 가져온다.
				var profile = googleUser.getBasicProfile();
				console.log(profile)
			})
			.fail(function(e){
				console.log(e);
			})
		}
		function onSignInFailure(t){		
			console.log(t);
		}
    </script>
        
    </header>