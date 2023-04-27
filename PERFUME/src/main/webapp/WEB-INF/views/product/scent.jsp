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

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
  <script src="${path }/js/jquery-3.6.3.js"></script>
  <script src="${path }/slick/slick.min.js"></script>


<link rel="stylesheet" href="${ path }/css/planning/slider.css">
<link rel="stylesheet" href="${ path }/css/planning/footer.css">


<link rel="stylesheet" href="${path}/css/planning/header.css">
  <link rel="stylesheet" href="${path}/slick/slick-theme.css">
  <link rel="stylesheet" href="${path}/slick/slick.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Open+Sans&display=swap');
    
        div * {
/*             border: 2px solid red;      */
            box-sizing: border-box;
            
        }

        body {
            /* background-color: #f6f6f2; */
        }
        #section2_1{
            font-family: 'Nanum Myeongjo', serif;
/*          background-color: #f6f6f2;  */
        }
        .wrap {
            width:100%;
            height:4000px;
            margin:auto;
            font-family: 'Nanum Myeongjo', serif;
        }

        #header{
            height: 2%;
            
            background-color: white;
            /* position: fixed; */
            
          
        }

        #header1{ width: 30%;}
        #header2{ width: 20%; }
        #header>div {
            float: left;
            height: 100%;
        }

        #section {
            height: 90%;
            
        }

/*         #footer { */
/*             height: 8%; */
/*             background-color: rgb(157, 226, 203); */
        
/*         } */
        #section1 {height: 17%;
             /* border-bottom: 1px solid;  */
          }
       #section2 {height: 83%; } 

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
    

       #listwrap {height: 80%; }
       #pagebar {height: 20%; text-align: center; }



      

/*         h2 { */
/*             line-height: 0; */
/*         } */


    #scent {
    font-size: 27px;
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
       background-color: white;
       position: fixed;
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;
       z-index: 9999;
       display: flex;
       justify-content: center;
       align-items: center;
       transition: all 1.2s;
    }  

    
    .spinner-border {
       height: 30px;
        width: 30px;
        border: 2px solid;
   
        border-top: 2px solid white;
    }

    .etcsymbols{ text-align: right; background-color: white;} 
    .p-status-wrap{border-bottom: 25px solid  transparent;
    border-top: 25px solid rgb(231, 231, 135); width:0; height: 0;
    border-left: 25px solid rgb(216, 201, 134);
    border-right: 25px solid transparent;
  
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

    .slider .slick-list {
    margin:0 -20px;
}

.slick-slide {
    margin:0 20px;
}

.scentcate {
    box-shadow: 1px 1px 10px #bbb;
}

.scentname {width: 100%;  opacity: 0.9; text-align: right; font-weight: bold;    } 

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
    
    /* vertical-align: bottom; */
   /* margin-top: -100px; */
   background-color: teal;
}	
	
	
#discount {
       height: 70%; 
/*     background-color: rgb(120, 116, 100); */
/*     border-radius: 50%; */
/*     line-height: 30px; */
/*     font-size: 15px; */
/*     width: 20%;  */
}
	
	
#big {
max-width: 100%;
}

#card-img {
       box-shadow: 1px 1px 5px #e8e7e7;
       }
       
       #share {
	max-width: 100%;
	max-height: 80%;
	vertical-align: bottom;

	transition: all 0.2s linear;
}

.like {
	vertical-align: bottom;
color: #f34141;
	font-size: 14px;
}

.a img {
	transition: all 0.1s linear;
}

#share:hover {
	transform: scale(1.2);
}

.productlink {
	font-size: 18px; font-weight: bold;
	color: #333;
	
}

.productlink:hover {
	text-decoration: none;
	color: #333;
}


    </style>
</head>
<body>
<div class="spinner-wrapper" >
 <div class="spinner-border" role="status">
  <span class="sr-only">Loading...</span>
 </div>
  </div>


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />


    <div class="wrap">
      <header>
        <div class="header-container">
            <nav class="main-nav">
                <ul>
                    <li><a href="${ path }/aboutSite">ABOUT US</a></li>
                    <li><a href="${ path }/planning/special">SPECIAL</a></li>
                    <li><a href="${ path }/product/list">SCENT</a></li>
                    <li><a href="${ path }/product/paper">MOUILLETTE</a></li>
                </ul>
            </nav>
            <h1 class="logo"><a href="${ path }/">NAEUM</a></h1>
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
        <div id="loginmodal">
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
                    </div>
                    <ul style="list-style: none;">
                        <li onclick="kakaoLogin();"><button type="button">카카오로 로그인</button></li>
                        <li id="googleLogin" onclick="googleLogin();"><button type="button">구글로 로그인</button></li>
                    </ul>
            </div>
        </div>
    
    <script>
		 // 모달창 가져오기
		 $(document).ready(function() {
	    // 로그인 버튼 클릭 시 모달창 보이기
	    $('.openLogin').click(function(e) {
	        e.preventDefault();
	        $('#loginmodal').show();
	    });
	
	    // 모달창 바깥 클릭 시 모달창 닫기
	    $('#loginmodal').click(function(event) {
	        if (event.target == this) {
	            $(this).hide();
	        }
	    });
	
	    // X버튼 클릭 시 모달창 닫기
	    $('#loginmodal .close').click(function() {
	        $('#loginmodal').hide();
	    });
	});
	    
	
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

        <div id="section">
            <div id="section1">
               <section class="slider">
	  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	    <!-- 인디케이터 -->
	    <ol class="carousel-indicators">
	      <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
	      <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
	      <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
	    </ol>
	
	    <!-- 슬라이드 이미지 -->
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	        <a href="#">
	          <img src="${ path }/images/planning/slider001.png" class="d-block w-100" alt="Slider Image 1">
	        </a>
	      </div>
	      <div class="carousel-item">
	        <a href="#">
	          <img src="${ path }/images/planning/slider002.png" class="d-block w-100" alt="Slider Image 2">
	        </a>
	      </div>
	      <div class="carousel-item">
	        <a href="#">
	          <img src="${ path }/images/planning/slider003.png" class="d-block w-100" alt="Slider Image 3">
	        </a>
	      </div>
	    </div>
	
	    <!-- 이전, 다음 버튼 -->
	    <button class="carousel-control-prev border-0" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">이전</span>
		</button>
		<button class="carousel-control-next border-0" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">다음</span>
		</button>
	  </div>
	</section>
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
                        <p id="scent" align="center">${scent.ptname } </p>
                        
                    </div>
                        
                    <div id="s3">
                        <div id="s3_1">

                        </div>
                        <div id="s3_2" style="text-align:center; position: relative;">
                            <div id="scent-detail" style="font-size: 12px; font-weight: bold; color: gray;">
                                ${scent.ptdetail }
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
                            	<div class="scentcate" style="position: relative;" data-id="3"> <div class="scentname" style="position: absolute; bottom:0;">CITRUS</div>
                                 <a href="${ path }/product/scent?no=1"><img src="https://img.freepik.com/free-photo/citrus-background-with-assorted-fresh-citrus-fruits_114579-9901.jpg?size=626&ext=jpg&ga=GA1.1.1462281178.1681576788&semt=sph" src="" id="big"></a>
                                </div>
                                <div class="scentcate" style="position: relative;" data-id="3"><div class="scentname" style="position: absolute; bottom:0;">FRUITY</div>
                                 <a href="${ path }/product/scent?no=2"><img src="https://t4.ftcdn.net/jpg/05/12/54/69/240_F_512546992_UGywRqXpPQhyljBPI1HUuxjXLOojRzXe.jpg" src="" id="big"></a>
                                </div>
                                <div class="scentcate" style="position: relative;" data-id="3"><div class="scentname" style="position: absolute; bottom:0;">SPICY</div>
                                 <a href="${ path }/product/scent?no=3"><img src="https://img.freepik.com/free-photo/still-life-of-cosmetic-products_23-2149163108.jpg?w=1060&t=st=1681578891~exp=1681579491~hmac=07489f94c2933710dbaeccb1b44abec4d2b2db3ea63a14633aa17c8b67cdfe21" src="" id="big"></a>
                                </div>
                                <div class="scentcate" style="position: relative;" data-id="3"><div class="scentname" style="position: absolute; bottom:0;">FLORAL</div>
                                 <a href="${ path }/product/scent?no=4"><img src="https://img.freepik.com/free-photo/simplistic-pink-and-white-roses-and-copy-space-background_23-2148408316.jpg?size=626&ext=jpg&ga=GA1.2.1462281178.1681576788&semt=sph" src="" id="big"></a>
                                </div>
                                <div class="scentcate" style="position: relative;" data-id="3"><div class="scentname" style="position: absolute; bottom:0;">WOODY</div>
                                 <a href="${ path }/product/scent?no=6"><img src="https://t3.ftcdn.net/jpg/04/98/69/46/240_F_498694611_qUPJVlIdwV2cTU1QXrka1HqR9ea8D7oC.jpg" src="" id="big"></a>
                                </div>
                                <div class="scentcate" style="position: relative;" data-id="3"><div class="scentname" style="position: absolute; bottom:0;">LIGHTFLORAL</div>
                                 <a href="${ path }/product/scent?no=5"><img src="https://img.freepik.com/free-photo/bunch-of-fresh-twigs-and-plants-in-vase_23-2148104490.jpg?size=626&ext=jpg&ga=GA1.2.1462281178.1681576788&semt=ais" src="" id="big"></a>
                                </div>
                            	
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
                          <c:if test="${gender eq 'F' }">
							<button class="gender" type="button" id="gender1" value="F" style="border: 1px solid; font-weight: bold;"
								onclick="location.href='${ path }/product/scent?no=${no}&gender=F'">FEMME</button>
							&nbsp; &nbsp;
							<button class="gender" type="button" id="gender1" value="M"
								onclick="location.href='${ path }/product/scent?no=${no}&gender=M'">HOMME</button></c:if>
							<c:if test="${empty gender}">
							<button class="gender" type="button" id="gender1" value="F" 
								onclick="location.href='${ path }/product/scent?no=${no}&gender=F'">FEMME</button>
							&nbsp; &nbsp;
							<button class="gender" type="button" id="gender1" value="M"
								onclick="location.href='${ path }/product/scent?no=${no}&gender=M'">HOMME</button></c:if>
								<c:if test="${gender eq 'M' }">
							<button class="gender" type="button" id="gender1" value="F" 
								onclick="location.href='${ path }/product/scent?no=${no}&gender=F'">FEMME</button>
							&nbsp; &nbsp;
							<button class="gender" type="button" id="gender1" value="M" style="border: 1px solid; font-weight: bold;"
								onclick="location.href='${ path }/product/list?gender=M'">HOMME</button></c:if>
								
                        </div>
                        <div id="s5_brand">
                            <!-- <p id="scent"><mark  style="background-color: rgb(243, 239, 236)"> BRAND</mark>  </p> -->
                            <table id="brand-select">
                            <tr>
                            
                                <th  width="100px">BRAND</th>
                                <c:forEach var="product" items="${ brand }">
                                
                                        <c:if test="${product.brand == bn }">
										<td><label for="brand"></label> 
										<c:if test="${not empty gender}">
												<input type="checkbox" name="brand" id="bn" onclick="brandselect('${productboard.brand}')"
												checked	onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&bn=${product.brand}'">${product.brand}
                                         </c:if> 
                                         <c:if test="${empty gender}">
												<input type="checkbox" name="brand" id="bn" class="brandselect"
												checked	onclick="location.href='${ path }/product/scent?no=${no}&bn=${product.brand}'">${product.brand}
                                         </c:if></td>
												</c:if>
												
												<c:if test="${product.brand != bn }">
										<td><label for="brand"></label> 
										<c:if test="${not empty gender}">
												<input type="checkbox" name="brand" id="bn"
												onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&bn=${product.brand}'">${product.brand}
                                         </c:if> 
                                         <c:if test="${empty gender}">
												<input type="checkbox" name="brand" id="bn" class="brandselect"
												onclick="location.href='${ path }/product/scent?no=${no}&bn=${product.brand}'">${product.brand}
                                         </c:if></td>
												</c:if>
                                
                                </c:forEach>
                            </tr>
                            </table>
                        </div>
                    
                        <div id="productfilter">
                        <c:choose>
                        	<c:when test="${not empty gender && not empty bn}">
                        		<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&sort=4"> 사용 후기</a>
                        	</c:when>
                        	<c:when test="${not empty gender && empty bn}">
                        		<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&gender=${gender}&sort=4"> 사용 후기</a>
                        	</c:when>
                        	<c:when test="${empty gender && not empty bn}">
                        		<a class="link"	href="${ path }/product/scent?no=${no}&bn=${bn}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/scent?no=${no}&bn=${bn}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&bn=${bn}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&bn=${bn}&sort=4"> 사용 후기</a>
                        	</c:when>
                        	<c:otherwise>
	                        	<a class="link"	href="${ path }/product/scent?no=${no}&sort=1"> 최신 상품 </a> <span class="bar">|</span> 
								<a class="link"	href="${ path }/product/scent?no=${no}&sort=2"> 낮은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&sort=3"> 높은 가격 </a> <span class="bar">|</span>
								<a class="link"	href="${ path }/product/scent?no=${no}&sort=4"> 사용 후기</a>
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
                                        <div id="card-img" style="position: relative;"> 
                                        
                                        
                                         <c:forEach var="productfile" items="${ product.productfile }">
                                        <c:if test="${productfile.pfsort eq '1' }">
                                        <a href="${ path }/product/detail?no=${product.PNo}">
                                        
                                         <img src="${ path }/upload/product/${ productfile.pfrenamefilename}" class="card-img-top" alt="..." > </a>
                                           </c:if>
                                        </c:forEach>
                                        	<div class="etcsymbols"
													style="width: 100%; height: 40px; bottom: 0px; padding: 5px;">

													<input type="hidden" value="${productlike.PNo }"
														id="likeList" data-id="${productlike.PNo }"
														name="likeName" />



													<c:if test="${not empty product.productlike }">
														<a href="javascript:likeCheck(${loginMember.no}, ${product.PNo})">
                                                        <img
															src="${ path }/upload/product/like.png"
															class="heartimg${product.PNo}" data-id="${product.PNo}"
															id="share">
														</a>
														<span id="share2${product.PNo}" class="like">${product.likecount}</span>
													</c:if>


													<c:if test="${empty product.productlike && not empty loginMember }">

														<a href="javascript:likeCheck(${loginMember.no}, ${product.PNo})">
                                                         <img src="${ path }/upload/product/dislike(2).png"
															class="heartimg${product.PNo}" data-id="${product.PNo}"
															id="share">
														</a>
														<span id="share2${product.PNo}" class="dislike">${product.likecount}</span>
													</c:if>

													<c:if test="${empty loginMember }">


														<a href="javascript:requestLogin()"> <img
															src="${ path }/upload/product/icons8-하트-24.png" class="heartimg"
															id="share">

														</a>
														<span id="share2" class="like" >${product.likecount}</span>
													</c:if>
												</div>
                                        
                                        </div>
                                        
                                       <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>
									<fmt:parseNumber value="${product.date.time / (1000*60*60*24)}" integerOnly="true" var="newdate" />
									<%-- <fmt:formatDate value="${product.date }" --%>
<%-- 														pattern="yyyy-MM-dd" var="newdate" /> --%>
									             <c:if test="${today - newdate le 3}">
													<div class="p-status-wrap" style="position: absolute;">
													</div>
													<div style="position: absolute; text-align: center; padding: 3px;">
										            <h5 style="color: white; font-weight: bold; font-size: 13px;">NEW</h5>
													</div>
	                                             </c:if>	
                                        
                                        <div class="p-status"style="position: absolute; width: 100%;">
                                        
                                        
                                        
                                        
                                        
                                        
                                        
<%--                                         <c:if test="${product.date}"> --%>
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
                                       
                                        <hr>
                                        <div>
                                       <h6 style="font-size: 10px; font-weight: bold;">${product.brand }</h6>
                                       <h5 id="pname" style="font-size: 18px; font-weight: bold;"><a class="productlink" href="${ path }/product/detail?no=${product.PNo}">${product.name }
										</a></h5>	
                                       <p class="card-text" style="font-size: 10px;">${product.eng }</p>
                                   
                                        </div>
                                        
                                        <hr>
                                        <div style="position: relative;">
                                             <c:forEach var="benefit" items="${product.benefit}">
                                             <fmt:formatDate value="${benefit.bnenddate}" pattern="yyyy-MM-dd" var="enddate"/>
                                             <c:if test="${not empty product.benefit }">
                                            <div style="position: absolute; height: 90%; width: 100%; text-align: right; padding: 1px;">
                                                <span class="badge badge-danger" id="discount"> SALE <br>   ${benefit.bnratio}%</span>
                                            </div>
                                            <!-- 원가 - (원가 * 할인율) = 세일가  -->
                                           
                                           
                                           
                                          <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
                                             <fmt:parseNumber var="saleprice" value="${product.price*salepricerate}"/>
                                             <fmt:parseNumber var="productsaleprice" value="${product.price-saleprice}"/>
                                            <p class="card-text" id="pprice" ><fmt:formatNumber value="${productsaleprice}" pattern="###,###"/><span style="font-size: 12px;">won</span> <br>
                                            <span class="originprice">
                                            <fmt:formatNumber value="${product.price}" pattern="###,###"/>
                                            <span class="originprice" style="font-size: 8px;">won</span></span></p>
                                            
                                            </c:if>
											</c:forEach>
                                            <c:if test="${empty product.productbenefit }">
                                            <p class="card-text" id="pprice"><fmt:formatNumber value="${product.price}" pattern="###,###"/>  <span style="font-size: 12px;">won</span></p>
                                            </c:if>
                                           
                                           
                                        </div>
                                        
                                        
<%--                                           <c:forEach var="benefit" items="${product.benefit}"> --%>
<%--                                           <fmt:formatDate value="${benefit.bnenddate}" pattern="yyyy-MM-dd" var="enddate"/>  --%>
<%--                                            <c:if test="${not empty product.benefit }"> --%>
                                           
<%--                                         	<p class="card-text" id="pprice">${product.price } <span>won</span> <br> --%>
<%--                                             <span class="originprice">${product.price }<span class="originprice">won</span></span></p> --%>
<%--                                         	</c:if> --%>
                                          
<%--                                           </c:forEach> --%>
<%--                                           <c:if test="${empty product.productbenefit }"> --%>
<%--                                           <p class="card-text" id="pprice">${product.price } <span>won</span></p>  --%>
<%--                                           </c:if>  --%>
                                          
                                        
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
                        		<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&page=1'">&lt;&lt;</button>
							    <button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&bn=${bn}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        	
                        	</c:when>
                        
                        <c:when test="${not empty gender && empty bn}">
                        	<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&page=1'">&lt;&lt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&gender=${gender}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        
                        </c:when>
                        
                        <c:when test="${empty gender && not empty bn}">
                        	<button onclick="location.href='${ path }/product/scent?no=${no}&bn=${bn}&page=1'">&lt;&lt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&bn=${bn}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/scent?no=${no}&bn=${bn}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&bn=${bn}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                        </c:when>
                        <c:otherwise>
							<button onclick="location.href='${ path }/product/scent?no=${no}&page=1'">&lt;&lt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ pageInfo.prevPage }'">&lt;</button>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:choose>
									<c:when test="${ status.current == pageInfo.currentPage}">
										<button disabled>${ status.current }</button>
									</c:when>
									<c:otherwise>						
										<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ status.current }'">${ status.current }</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ pageInfo.nextPage }'">&gt;</button>
							<button onclick="location.href='${ path }/product/scent?no=${no}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
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
 
 
const spinnerWrapperE1 = document.querySelector('.spinner-wrapper');

window.addEventListener('load', () => {
spinnerWrapperE1.style.opacity = '0';

setTimeout(() => {
    spinnerWrapperE1.style.display = 'none';
}, 1200);

});

 
function requestLogin(){
	 alert('로그인 후 다시 이용해주세요.');
};

	
function likeCountUpdate(PNo, MNo, like) {
	 
	$.ajax({
		type: 'POST',
		url: '${path}/likeCountUpdate',
		dataType: 'json',
		data: {	
			PNo, MNo, like
		},
		success : (obj) => {
              let result = '';
			
			result = obj.likecount
			
			console.log(result)
			
		
			$('#share2' +PNo).html(result);
			
			
		}	
	
	});
	

};





	
	
function likeCheck(mno, pno) {
	 let MNo = mno;
	 let PNo = pno;
	 console.log(MNo);
	 console.log(PNo);

	 if(${empty loginMember})  {
		 alert('로그인 후 다시 이용해주세요.');
	 } else {
	 
	
			 $.ajax({
					type: 'POST',
					url: '${path}/likeCheck',
					dataType: 'json',
					data: {	
						MNo,PNo
					},
					success : (result) => {
						
						console.log();
						
						if(result == 1) {
							
							if(confirm('관심 상품을 해제 하시겠습니까?')) {
								$('.heartimg'+ PNo).attr('src', '${ path }/upload/product/dislike(2).png')
								$('#share2' + PNo).css('color', 'black')
								likeCountUpdate(PNo, MNo, result);
							} 
							
						}else if (result == 0) {
							
							
							if(confirm('관심 상품을 등록 하시겠습니까?')) {
								$('.heartimg' +PNo).attr('src', '${path}/upload/product/like.png')
								$('#share2' + PNo).css('color', '#f34141')
								likeCountUpdate(PNo, MNo, result);
							}
						}
						
					}	
					
			 });
	
		
	 
	 };

};

     
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

 
   

  
//     $(".card").on({
//         "mouseenter":function(){
           
//             $(this).find('#share').css("visibility","visible");
        
      



//         },
//         "mouseleave":function(){
//             $(this).find('#share').css("visibility","hidden");
            
//         }
//       });
 
      $(".card-img-top").on({
        "mouseenter":function(){
           
            $(this).css({'opacity':'0.6'});

        },
        
        "mouseleave":function(){
            $(this).css({'opacity':'1'});
            
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
  
  
//부트스트랩 캐러샐 슬라이드 구현
  $(document).ready(function(){
	    $('#myCarousel').carousel();
	});
  
  $('.carousel-indicators li').click(function(){
      var goToSlide = $(this).data('slide-to');
      $('#myCarousel').carousel(goToSlide);
  });
  
  // 캐러셀 객체 생성
	$('.carousel').carousel({
		interval: 4000, // 이미지 전환 시간(ms)
	    pause: "hover", // 마우스 호버 시 멈춤 여부
	    wrap: true // 무한 루프 여부
	})
	
	
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
</script>
</html>