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
  <link rel="stylesheet" href="${ path }/css/planning/header.css">
<style>
		.gradestars {
			max-height: 100%;
			max-width: 100%;
		}

       div * {                                        
       
/*         border: 2px solid red;      */
            box-sizing: border-box;
            
        }

        .wrap {
            width:100%;
            height:7000px;
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
        #s1_2 {height: 60%;  }

        #s2 {height: 16%;}

        

        #s4 {height: 13%;}

        #s5 {height: 13%;}

        #s6 {height: 10%;}

        #s7 {height: 6%;}
        
        #s8 {height: 8%;}






        
      

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
        
        #product-title {height: 5%; }
        
        #product-sizeinfo { height: 6%; }
        
        #product-caution {height: 20%; font-size: 12px; margin-bottom: 20px;}
        #product-meaning{ height: 11%; font-size: 12px;}
        #product-price{height: 5%; border-bottom: 1px solid #ccc; }
        
        #product-option{height: 10%; border-bottom: 1px solid #ccc;}
        .option-count { height: 15%;}
        #product-benefits{height: 8%; border-bottom: 1px solid #ccc;}
        
        #product-total {height: 3%; font-size: 13px; text-align: right;}
        #product-button { text-align: right;  }
        
        #product-menu {text-align: center; height: 5%; }
        
        #product{text-align: center;}
        
        #product-review-wrap {height: 91%;}
        
        #product-qna-wrap {height: 91%;}
        
        #product-image>div {height: 100%; float: left;}

.modal-dialog {
    overflow-y: initial !important
}

.modal-body {
    max-height: calc(100vh - 200px);
    overflow-y: auto;
}

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
            color: black;
            vertical-align: bottom; 
            transition: all 0.1s linear;
        }
        
      
		#like:hover  {
		  transform: scale(1.1);
		}
        
        
        
        
        

        #product-review-wrap>div {height: 100%; float: left; }
        #d3{width: 10%;}
        #d4{width: 10%;}
        #product-review{width: 80%; }
        
        #d5{height: 5%;}
        #review-name {text-align: center; height: 4%;}
        #grade-wrap{height: 12%; text-align: center;}
        #review-wrap {height: 76%; }
        
        #grade-wrap>div { height: 100%; float: left;}
        
        
        #product-qna-wrap>div{height: 100%; float: left;}
        #product-qna {width: 80%;}
        
        #qna-name{text-align: center; height: 6%;}
        #qna-content {height: 78%; background-color:  #fbfbf7;}
        #qna-page{height: 11%; text-align: center;  border-top: 1px solid #ccc;}
        

        #product-guide-wrap {height: 86%;}
        #product-guide-wrap>div {height: 100%; float: left;}
        #guide{width: 80%; padding: 10px; background-color:  #fcfcfb;}


        #guide>div{height: 100%; float: left;}
        #guide1{width: 50%;}
        #guide2{width: 50%; font-size: 13px; }

        #guide2>div>ul>li {list-style-type: none;}

        #payinfo{height: 40%; font-size: 12px; }
        #changeinfo {height: 60%; font-size: 12px;}

        #grade {
            width: 32%;
            
        }
			
		#grade-left {
			width: 34%
		
		}
        #grade_graph {
            width: 33%;
        }

		#review-filter>div {height: 100%; float: left;}
        #review-filter {height: 7%;}
        #review-content{height: 78%; background-color:  #fbfbf7;}
        #review-page {height: 15%; border-top: 1px solid #ccc;}

        #review-table {
            width: 100%;
            font-size: 12px;
            
        }

        #gradestyle {
        height: 70px;
        
        }
        #d6 {
            width: 5%;
        }
        #delivery-info{ width: 95%;}
        #guide2>div {
            height: 100%; float: left;
        }

        #related-product-wrap {height: 100%;}
        #related-product-name{height: 100%; text-align: center; width: 60%;}
        #related-product-wrap>div {height: 100%; float: left;}
        #d7{width: 20%; height: 100%}
        #d8{width: 20%; height: 100%}
   
        .card {
       padding: 20px;
       border: none;
       text-align: center;
       font-weight: bold;
       font-size: 10px;

       }

       #related-list {height: 60%;}
    

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
  
  
  li {list-style-type: none;
  font-weight: 600;
  color: gray;
  }

    .sidebar {height: 30%;  }
    .sidebar>div {height: 100%; float: left; }
    #fcwrap{height: 100%; width: 60%; border: 1px solid #ccc; }
    #cart2{ height: 20%;  }
    #share{height: 20%; }
    #up{height: 20%;}
    #down{height: 20%;}
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
      

 
    #sumbimg1{width: 25%; margin-right: 15px;}

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
            background-color:  #fbfbf7;
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
    
    	.reply {
    width: 100%;
    height: 100%;
    border: none;
    font-size: 10px;
}

.reply:focus {outline:none;}

.replyenroll>div {
    height: 100%;
    float: left;
}


.qnacontent {
    width: 100%;
    height: 100%;
    border: none;
    font-size: 10px;
    resize: none;
}
.qnacontent:focus {outline:none;}

.qna-answer-list>div {
    height: 100%;
    float: left;
}

.qnaenroll>div {
    height: 100%;
    float: left;
}


#card-img {
       box-shadow: 1px 1px 5px #e8e7e7;
       max-width: 100%;
       max-height: 100%;
       }
       
       
       .card-img-top {
       max-width: 100%;
       max-height: 100%;

      
       
       }
       
       	
#pprice {
	font-size: 16px;
}	


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
    
    
    .heartimg {
    max-height: 80%;
    max-width: 100%;
    }
    
    #product-title>div {
    height: 100%;
    float: left;
    }
    
	
.big {
       box-shadow: 1px 1px 5px #e8e7e7;
       max-width: 100%;
       max-height: 100%;
       }
       
       .img1 {
        box-shadow: 1px 1px 5px #e8e7e7;
       max-width: 100%;
       max-height: 100%;
       
       }
       
       .detailimg {
       box-shadow: 1px 1px 5px #e8e7e7;
       max-width: 50%;
       max-height: 50%;
       
       }
       
       
       #benefits {
       	height: 100%;
       }
	#Lcount {
		color: #f34141;
		
		font-weight: bold;
	}
	
	#replycontent {
	resize: none;
	}


</style>
</head>
<body>
<div class="spinner-wrapper" >
 <div class="spinner-border" role="status">
  <span class="sr-only">Loading...</span>
 </div>
  </div>
    <div class="wrap">
    	<input type="hidden" value="${loginMember.no }" id="loginMemberId">
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
         
         
 <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="staticBackdropLabel"></h5>
                 
                </div>
                <div class="modal-body" style="">
					<div>
                         <div id="review-view-table">
                         </div>

				    </div>
                    
                    
                    
                    <div style="border: 1px solid #ccc; background-color: rgb(239, 236, 236);">
                        <div style="border: 1px solid #ccc;" class="review-reply-form">
                            <div class="replyenroll">
                            
                            <c:if test="${not empty loginMember }">
                            <div class="mno" style="width: 10%;" data-id="${loginMember.no }">
                                <p style="font-size: 12px; padding: 5px; line-height: 60px;">${ loginMember.id }</p>
                            </div>
                            <div style=" width: 90%; height: 100%;">
                                <div style="border: 1px solid #ccc; margin: 15px;  height: 50%; background-color: white;">
                                <textarea name="" id="replycontent" cols="30" rows="3" class="reply" ></textarea>
                                </div>
                            </div>
                            </c:if>
                            
                            <c:if test="${empty loginMember }">
                            <div class="mno" style="width: 10%;" data-id="${loginMember.no }">
                                <p style="font-size: 12px; padding: 5px; line-height: 60px;">비회원</p>
                            </div>
                            <div style=" width: 90%; height: 100%;">
                                <div style="border: 1px solid #ccc; margin: 15px;  height: 50%; background-color: white;">
                                <textarea name="" id="" cols="30" rows="3" class="reply" placeholder="로그인 후 이용해주세요." disabled="disabled"></textarea>
                                </div>
                            </div>
                            </c:if>
                            
                            </div>  
                         </div>
                         
                         <c:if test="${not empty loginMember }">
                        <div style="text-align: right; padding: 10px;">
                            <button style="width: 70px; height: 20px; font-size: 10px;" value="" id="replyenter" class="badge badge-light">작성 하기</button>
                        </div>
                        </c:if>
                        
                        <c:if test="${empty loginMember }">
                        <div style="text-align: right; padding: 10px;">
                            <button style="width: 70px; height: 20px; font-size: 10px;" value="" id="loginenter" class="badge badge-pill badge-warning">로그인 하기</button>
                        </div>
                        </c:if>
                        
                    </div>

				
					 <div id="review-area" >
				
                     	<div class="review-reply-list" style="">
	                     
		                    <div style="height: 40px;" id="replyname">
		                    <p style="font-size: 13px; padding: 15px; font-weight: bold;"> </p>
		                    </div>
		                    <div style="height: 150px ;" id="reviewcontent"> 
		                    
		                    <div style="height: 60%;" id="replycontent">
		                    <p style="font-size: 13px; padding: 10px; font-weight: bold;"> </p>
		                    </div>
		                    
		                    <div style="height: 20%;">
		                    <p style="font-size: 11px; padding: 5px;">1681912287000<span>신고</span></p>
		                    </div>
		                    
		               		
		                    <div style="height: 20%; border-top: 1px solid #ccc;">
		                    <p style="font-size: 13px; padding: 5px;"></p>
		                    
		                    </div>
                   		</div>
					 </div>
                   </div> 
                  
                
                 
                </div>
                
                <div class="modal-footer">
                  <button type="button" class="badge badge-pill badge-secondary" data-dismiss="modal" >닫기</button>
                
                </div>
            </div>
      </div>
</div>



<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="staticBackdropLabel">답변하기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                <div>
                    <div id="qna-view-table">
                    </div>
                    <div class="qna-answer">
                    </div>
				</div>
				
		     <c:if test="${loginMember.division eq 1 }">
				<div id="qna-reply-form-wrap" >
				<input type="hidden" value="" id="qna-reply-hidden">
	                <div style=" border: 1px solid #ccc; background-color: rgb(239, 236, 236);">
	                        <div style="border: 1px solid #ccc;" class="qna-reply-form">
	                            <div class="qnaenroll">
	                            <div style="width: 10%;">
	                                <p style="font-size: 12px;  line-height: 60px; text-align: center; font-weight: bold;">A.</p>
	                            </div>
	                            <div style=" width: 90%; height: 100%;"  >
	                                <div style="border: 1px solid #ccc; margin: 15px;  height: 50%; background-color: white;">
	                                <textarea name="" cols="30" rows="3" class="qnacontent" id="qnaReviewContent"> 
	                                </textarea>
	                                </div>
	                            </div>
	                            </div>
	                        </div>
	                        
	                        
	                       <div style="text-align: right; padding: 10px;">
	                           <button style="width: 70px; height: 20px; font-size: 10px;" id="qnaReply" value="" data-id="${loginMember.no }" class="badge badge-light">답변 하기</button>
	                       </div>
	                 </div>
                </div>
                </c:if>
              
                 
                <div class="modal-footer">
                
          
                </div>
              </div>
            </div>
        </div>
    </div>        
         
         
         
         
         
         
        <div id="section">
            <div id="s1" >
                 <div id="s1_1">

                </div>
                <div id="s1_2">

                </div>
            </div>
            <div id="s2">
               
                <div id="product-image"  >
                    <div style="width: 20%;">

                    </div>
                    <c:forEach var="product" items="${ list }">
                    
                    <div style="width: 70%;"  >
                        <div style="height: 60%; width: 100%;" id="mainimg">
                        <c:forEach var="productfile" items="${ product.productfile }" begin="0"  end="0" >
                      
                        <c:if test="${productfile.pfsort eq '1' }">
                     
                        <img src="${ path }/upload/product/${ productfile.pfrenamefilename}" class="big" alt="">
                        </c:if>
                        </c:forEach>
                        </div>  
                        
                        <div id="sumb-wrap" style="height: 15%;">
                         <c:forEach var="productfile" items="${ product.productfile }"  begin="0"  end="0">
                         	<c:if test="${productfile.pfsort eq '1' }">
                            <div id="sumbimg1" >
                                <img src="${ path }/upload/product/${ productfile.pfrenamefilename}" class="img1" alt="">
                            </div>
                            </c:if>
                            </c:forEach>
                            <c:forEach var="productfile" items="${ product.productfile }" begin="1" end="2">
                            <c:if test="${productfile.pfsort eq '2' }">
                            <div id="sumbimg1" >
                                <img src="${ path }/upload/product/${ productfile.pfrenamefilename}" class="img1" alt="">
                            </div>
                            </c:if>
                            
                            </c:forEach>
                        </div>

                        <div style="height: 25%;">

                        </div>
                    </div>
                   
                    <div style="width: 10%;"></div>
                    
                </div>
                
               
                <div id="product-detail-area" style="height: 100%;">
                    <div id="product-detail" style="height: 100%;">
                     <hr>
                        
                    <div id="product-title" >
                    <div style="font-size: 20px; width: 50%;">
                    	 <strong>${product.name }</strong>&nbsp;
                    </div>
                    <div style="width: 40%; height: 45px;">
                    <img  src="${ path }/upload/product/icons8-하트-24.png" class="heartimg">
                    <span style="font-size: 15px; text-align: left;" id="Lcount">${LikeCount.likecount}</span>
                    </div>
                 
                         
                    </div>
                    <div id="product-l-meaning" style="font-size: 12px; font-weight: 600; color: gray;">
                        ${product.title }
                    </div>
             
                    <div id="product-sizeinfo">
                        <h6 style="font-size: 14px;">scent : <span><strong>${product.topcate.ptname }</strong> </span></h6> 
                         
                        <h6 style="font-size: 14px;">size :  <span><strong> <c:forEach var="option" items="${option}"> ${option.poname}ml </c:forEach></strong></span> </h6>   
                     
                    </div>
               
                    <div id="product-caution" style="font-size: 13px;">
                        <h6 style="font-size: 15px;"><b>구매 시 주의사항</b></h6>
                     
                        <li>1. 제작과정에서 생긴 작은 기포나 미세한 스크래치가 있을 수 있습니다.</li><br>
                        <li>2. 인쇄가 완전히 고르지 않을 수 있습니다.</li><br>
                        <li>3. 향수나 화장품은 다른 상품들과 달리 소모품 상품으로 제품의 겉 비닐포장이나
                        케이스가 한번이라도 펌핑을 한 경우, 가치가 감소된 경우엔 무조건 교환/반품/환불이 불가능합니다.</li><br>
                        <li>4. 컵의 입구 부분이 완전히 고르지 않을 수 있습니다.</li><br>
                    </div>
                    <div id="product-meaning">
                        <h6 style="font-size: 15px;"><b>설명</b></h6>
                        ${product.detail }
                        
                    </div>
                    <div id="product-price">
                        <div id="price" >
                        
                        
                        <c:forEach var="benefit" items="${product.benefit}" begin="0" end="0">
                        <c:if test="${not empty product.benefit }">
                        <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
                        <fmt:parseNumber var="saleprice" value="${product.price*salepricerate}"/>
                        <fmt:parseNumber var="productsaleprice" value="${product.price-saleprice}"/>
                        
                        
                        <h2><strong><fmt:formatNumber value="${productsaleprice}" pattern="###,###"/></strong></h2>
                        </c:if>
                        
                        
                      
                     	</c:forEach>
                     	  <c:if test="${empty product.benefit }">
                        
                        <h2><strong><fmt:formatNumber value="${product.price}" pattern="###,###"/></strong></h2>
                        </c:if>
                     	
                     	
                        </div>
                        <div id="origin_price">
                       		
                        </div>
                        <c:forEach var="benefit" items="${product.benefit}">
                        <c:set var="bnratio" value="${benefit.bnratio}%" />
                      
                        </c:forEach>
                        <div id="sale">
                        
                            <h3 style="color: navy; font-weight: bold;" >${bnratio}</h3>
                        </div>
                        
                    </div>

                    <div id="product-benefits">
                        <table id="benefits" width="100%" >
                            <tr style="font-weight: bold;">
                                <th width="20%">적립금</th>
                                <td width="80%" style="font-size: 20px; color: navy;">5%</td>
                            </tr>
                            <tr style="font-weight: bold;">
                                <th>배송비</th>
                                <td>90000원 미만 주문 시 배송비 3000원이 추가 됩니다.</td>
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
                                    <div style="width: 55%; font-size: 16px; font-weight: bold; line-height: 40px;">
                                    <p>${product.eng } -<span class="sizeval">${option.poname}ml</span></p>
                                    </div>
                                    
                                    				
                                    				<c:forEach var="benefit" items="${product.benefit}" begin="0" end="0">
								                        <c:if test="${not empty product.benefit }">
									                        <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
									                        <fmt:parseNumber var="saleprice" value="${option.poprice*salepricerate}"/>
									                        <fmt:parseNumber var="productsaleprice" value="${option.poprice-saleprice}"/>
		                                            			   <div class="quantity" style="width: 25%; text-align: center; line-height: 40px; ">
			                                                        <span>
			                                                            <a class="opt-minus"  onclick="optminus(${productsaleprice})">-</a>
			                                                            <input id="quantity" name="quantity_name" style="border: none; " value="1" type="text"  />
			                                                            <a class="opt-plus" onclick="optplus(${productsaleprice})">+</a>
			                                                        </span>
			                                                    </div>
						                                </c:if>
					                                </c:forEach>
					                                
                                    			    <c:if test="${empty product.benefit }">
                                     							<div class="quantity" style="width: 25%; text-align: center; line-height: 40px">
			                                                        <span>
			                                                            <a class="opt-minus"  onclick="optminus(${option.poprice})">-</a>
			                                                            <input id="quantity" name="quantity_name" style="border: none;" value="1" type="text"  />
			                                                            <a class="opt-plus" onclick="optplus(${option.poprice})">+</a>
			                                                        </span>
			                                                    </div>
                                    				     </c:if>
                               
                                                    <div class="price" style="width: 20%; line-height: 40px; font-size: 12px;">
                                                    
                                                    <c:forEach var="benefit" items="${product.benefit}" begin="0" end="0">
								                        <c:if test="${not empty product.benefit }">
									                        <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
									                        <fmt:parseNumber var="saleprice" value="${option.poprice*salepricerate}"/>
									                        <fmt:parseNumber var="productsaleprice" value="${option.poprice-saleprice}"/>
		                                                    <span id="selected-price">${productsaleprice}</span>&nbsp;<span>원<span>&nbsp;&nbsp;<a href="" onclick="">x</a></span>
						                                </c:if>
					                                </c:forEach>
					                                
					                                <c:if test="${empty product.benefit }">
					                         			<span id="selected-price">${option.poprice}</span>&nbsp;<span>원<span>&nbsp;&nbsp;<a href="" onclick="">x</a></span>       
					                                </c:if>
					                                
                                                   </div>
                                </div>
                                </c:forEach>   
                                               
                                                                               
                            
                   
                    
                    
                    <div id="product-total">
                        TOTAL :<span id="total"><b>0</b></span><span>원</span><span>(</span><span  style="font-size: 8px;" id="totalcount">0</span><span>)개</span>
                    </div>
                    <div id="product-button">
                    <c:if test="${not empty loginMember }">
                  
                        <button id="like" onclick="likeCheck(${loginMember.no}, ${product.PNo})">LIKE</button>
                    </c:if>
                    <c:if test="${empty loginMember }">
                        <button id="like" onclick="requestLogin()">LIKE</button>
                    </c:if>
                    
                    
                        <button id="cart" onclick="cartInsert(${product.PNo})">CART</button>
                        <button id="buy" onclick="nowOrder(${product.PNo})">BUY NOW</button>

                    </div>
					
						<div style="text-align: right; margin: 15px; height: 40px;">
						<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><img src="${path }/upload/product/icon-facebook.png" class="big"></a>
						<a id="btnFacebook" class="link-icon twitter" href="javascript:shareTwitter();"><img src="${path }/upload/product/icon-twitter.png" class="big"></a>
						<a id="btnFacebook" class="link-icon kakao" href="javascript:clip();" ><img src="${path }/upload/product/link.png" class="big"></a>
						</div>
						
				
					
                    </div>
                    <div id="d">
                        <div style="height: 20%;">
                            
                        </div>
                        <div class="sidebar" >
                            <div style="width: 40%;">


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
                <br>
                <p style="font-weight: bold; font-size: 25px;"> ${product.eng }     </p>
                <br>
                 <c:forEach var="productfile" items="${ product.productfile }">
                	<c:if test="${productfile.pfsort eq '2' }">
                    <div id="detailimg" >
                     <img src="${ path }/upload/product/${ productfile.pfrenamefilename}" class="detailimg" alt="">
                    </div>
                   </c:if>
                   <br>
                  
                    </c:forEach>
                    <div>
                       <p style="font-size: 15px; font-weight: bold; color: gray;"> 프로젝트 (퍼퓸)의 모든 디자인, 일러스트, 사진들은 <br><br>
                        상표 및 디자인 특허,
                        저작권보호를 받고 있습니다. <br><br>
                        프로젝트 (퍼퓸) 과 유사한 제품을 제조, 판매할 경우, 민,형사상의 책임을 묻겠습니다.</p>
<br>
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
                            <div id="payinfo" style="font-weight: 600; color: gray;" >
                                <h6 id="payinfo-title" style="border-bottom: 2px solid #ccc;"><b>상품결제정보</b></h6><p></p><br>
                                고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  
                                무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
                                주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.
                            </div>
                            <div id="changeinfo" style="font-weight: 600; color: gray;">
                                <h6 id="changeinfo-title" style="border-bottom: 2px solid #ccc;"><b>교환 및 반품정보</b></h6><p></p><br>
                                <strong >교환 및 반품이 가능한 경우</strong><br>
                                - 상품을 공급 받으신 날로부터 7일이내.&nbsp;<div>
                                - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br>
                                &nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 7일이내.</div><div><br>
                                    </div>

                                <strong >교환 및 반품이 불가능한 경우</strong><div>
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
                        	<div id="grade-left">
                        	
                        	</div>
                            <div id="grade" style="background-color: white; color: black; border-radius: 5px; line-height: 10px;  ">
                                <br>
                                <c:set var = "total" value = "0" />
                                 <c:set value="${fn:length(grade)}" var="gradeCount"/>
                                <c:forEach var="productboard" items="${grade}" varStatus="status">
                               <c:set var= "total" value="${total + productboard.pbGrade}"/>
                               </c:forEach>
                                  <c:if test="${total != 0 }">
                                <h1>
                                <span style="color: navy;">

                                 <fmt:formatNumber value="${total / gradeCount}" pattern=".0" var="totalplay"/>
                                ${totalplay}</span> 
                                <span>/5</span>
        
                                </h1>
                                <h6 style="font-weight: bold; color: gray;">${gradeCount}명 참여</h6>
                                </c:if>
                                  <c:if test="${total == 0 }">
                                  <h5>
                                	<span style="font-size: 15px; padding: 10px; font-weight: bold;">등록된 후기가 없습니다.</span></h5>
                                  </c:if>
                            </div>
                            <div id="grade_graph"></div>
                        </div>
                        <div id="review-wrap">
                            <div id="review-filter">
                                <div style="width: 20%;" class="rfilter"><p>REVIEW</p></div>    
                                <c:if test="${empty loginMember  }">
                                <div style="width: 80%; text-align: right;"  class="rfilter" >
                                    <h5> <button class="badge badge-light"  type="button" onclick="requestLogin()">WRITE</button></h5> 
                                </div>
                                </c:if>
                                <c:if test="${not empty loginMember }">
                                <div style="width: 80%; text-align: right;"  class="rfilter" >
                                    <h5> <button class="badge badge-light"  type="button" data-toggle="modal" data-target="#staticBackdrop1${productboard.pbcNo}" id="writeloginck">WRITE</button></h5> 
                                </div>
                                
                                </c:if>
                            </div>
                            <div id="review-content">
                           
                            <div class="accordion" id="accordionExample"> 
                            
                                <table id="review-table">
                                	<thead>
                                        <tr >
                                            <td align="center">번호</td>
                                            <td >제목</td>
                                            <td>아이디</td>
                                            <td align="center">등록 시간</td>
                                            <td align="center">평점</td>
                                        </tr>
                                    </thead>
                                    <tr class="review-board-list">
                                    
                                    
                                
                                    
                                    </tr>
                                  <c:forEach var="productboard" items="${board}" varStatus="status">
                                         
                                  <tbody style="height: 60px;" >
                                    <tr class="xans-record-" id="reviewline">
                                        <td  align="center">${productboard.pbNo}</td>
                                        <td width="600px"  >
<!--                                             <a data-toggle="collapse" href=#collapseExample${productboard.pbNo} role="button" aria-expanded="false" aria-controls="collapseExample"> -->
									 <a class="link" data-toggle="modal" data-target="#staticBackdrop" id="reviewreply" class="badge badge-light" onclick="reviewNo(${productboard.pbNo})">
                                            ${productboard.pbTitle}</a>
                                    

<!--                                             </a> -->
                                            <span>[${productboard.replycount }]</span>
                                           
                                        </td>
                                        <td><b>${productboard.mid}</b></td>
                                        <fmt:formatDate value="${productboard.pbdate}"
														pattern="yyyy-MM-dd HH:ss" var="pbdate" />
                                        <td align="center" style="color: gray;"><b>${pbdate}</b></td>
                                 
                                        <td align="center" id="gradestyle"><c:choose>
                                        <c:when test="${productboard.pbGrade > 4.5}"><img src="${path }/upload/product/5-stars.png" class="heartimg"></c:when>
                                            <c:when test="${productboard.pbGrade <= 4.5 && productboard.pbGrade > 3.5}"><img src="${path }/upload/product/free-icon-stars-7372056.png" class="heartimg"></c:when>
											<c:when test="${productboard.pbGrade <= 3.5 && productboard.pbGrade > 2.5}"><img src="${path }/upload/product/3stars.png" class="heartimg"></c:when>
											<c:when test="${productboard.pbGrade <= 2.5 && productboard.pbGrade > 1.5}"><img src="${path }/upload/product/2stars.png" class="heartimg"></c:when>
											<c:when test="${productboard.pbGrade <= 1.5 && productboard.pbGrade > 0}"><img src="${path }/upload/product/1star.png" class="heartimg"></c:when>
											<c:when test="${productboard.pbGrade == 0}"></c:when>
										
											</c:choose></td>
                                    </tr>
                                  <tr >
                                      
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbNo}" id="toglespace"> --%>
                <div id="collapseOne${productboard.pbNo}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
               <div>
               
                <div style="height: 30px; border: 1px solid #ccc; padding: 5px;" >
                	<button type="button" data-toggle="modal" data-target="#staticBackdrop" id="reviewreply" class="badge badge-light" onclick="reviewNo(${productboard.pbNo})">댓글 작성</button> 
                	<c:if test="${loginMember.id == productboard.mid }">
                	<button class="badge badge-light" type="button" id="" onclick="" value="">수정하기</button>
                	<button class="badge badge-secondary" type="button" data-toggle="modal" data-target="#" id="" onclick="" value="">x</button>
                	</c:if>
                	<c:if test="${loginMember.id != productboard.mid }">
                	<button class="badge badge-danger">신고 하기</button>
                	
                	</c:if>
                </div>
                
                <br><br>
         
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
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=1'#review">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ pageInfo.prevPage }'#review">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage}">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>						
						<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ status.current }#review'">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ pageInfo.nextPage }#review'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ pageInfo.maxPage }#review'">&gt;&gt;</button>
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
                        		 <c:if test="${empty loginMember  }">
                                <div style="width: 80%; text-align: right;"  class="rfilter" >
                                    <h5> <button class="badge badge-light"  type="button" onclick="requestLogin()">WRITE</button></h5> 
                                </div>
                                </c:if>
                        		<c:if test="${not empty loginMember }">
                                <div style="width: 80%; text-align: right;"  class="rfilter" >
                                  <h5><button class="badge badge-light" type="button" onclick="" data-toggle="modal" data-target="#staticBackdrop2${productboard.pbcNo}100">WRITE</button></h5>  
                                </div>
                                </c:if>
                        </div>
                        <div id="qna-content">
                         <div class="accordion" id="accordion1"> 
                            
                                <table id="review-table">
                                	<thead>
                                        <tr >
                                            <td align="center">번호</td>
                                            <td align="center">답변 여부</td>
                                            <td align="center">제목</td>
                                            <td>아이디</td>
                                            <td align="center">등록 시간</td>
                                        
                                        </tr>
                                    </thead>
                                  <c:forEach var="productboard" items="${qnaboard}" varStatus="status">
                                  <tbody style="height: 60px;">
                                    <tr class="xans-record-" id="reviewline">
                                        <td  align="center">${productboard.pbNo}</td>
                                         <c:if test="${productboard.replycount > 0}">
                                         
                                        <td align="center" style="color: lime;"><b>[답변 완료]</b></td>
                                         </c:if>
                                          <c:if test="${productboard.replycount < 1}">
                                        <td align="center"><b>[미 답변]</b></td>
                                         </c:if>
                                        <td width="600px "  style="height: 30px;">
<!--                                             <a data-toggle="collapse" href=#collapseExample${productboard.pbNo} role="button" aria-expanded="false" aria-controls="collapseExample"> -->
										<c:if test="${not empty productboard.pbPwd }">
										<span >
                                         <img alt="" src="${path }/upload/product/free-icon-lock-4208464.png" class="gradestars">
                                        </span>  
										</c:if>
										 <c:if test="${not empty productboard.pbTitle}">
												  <c:if test="${empty loginMember }">
		                                			 <a class="link" type="button" href="javascript:requestQna();">
		                                            상품 문의</a>		
		                                	      </c:if>
												  <c:if test="${loginMember.id eq productboard.mid || loginMember.division eq 1}">  
											       	<a class="link" type="button" data-toggle="collapse" data-target="#collapseOne${productboard.pbNo}" aria-expanded="false" aria-controls="collapseOne${productboard.pbNo}">
		                                            상품 문의</a>
		                                          </c:if>
                                         </c:if>
<!--                                             </a> -->
									       
                                            <span class="qnaReplyCount" >
                                            [${productboard.replycount}]
                                            </span>
                                            <c:if test="${productboard.replycount < 1 && loginMember.division eq 1}">
                                       		<button class="badge badge-success"  type="button" data-toggle="modal" data-target="#staticBackdrop2" id="qnareplyenter" onclick="qnaNo(${productboard.pbNo})" value="${productboard.pbNo}">답변하기</button>
                                       		 </c:if>
                                        </td>
                                             
                                        <td><b><c:out value="${fn:substring(productboard.mid,0,fn:length(productboard.mid)-2)}" /> **</b></td>
                                        
                                         <fmt:formatDate value="${productboard.pbdate}"
														pattern="yyyy-MM-dd HH:ss" var="pbdate" />
                                        <td align="center" style="color: gray;"><b>${pbdate}</b></td>
                                 
                                     
                                    </tr>
                                    
                                	
                                    
        
                                    
                                    <c:if test="${loginMember.division eq 2}">
                                  <tr id="secretwrap${productboard.pbNo}">
               				      <td colspan="5">
           							<div id="collapseOne${productboard.pbNo}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
               						<div>    
			                     <div class="secret">
			                		<label for="password">비밀번호 : </label>
			                     <input type="password" name="password" id="pwd1${productboard.pbNo}"  size="10">
			                     <button class="badge badge-light"   id="btnno" value="${productboard.pbNo}" onclick="qnaStatus(${productboard.pbNo}, '${productboard.pbPwd}')" > 확인 </button>
			                </div>     
			               <br><br>  
			               </div>
			           </div>
               </td>
            </tr>
            <tr id="pwdpasswrap${productboard.pbNo}" style="display: none">                       
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbNo}" id="toglespace"> --%>
                <div id="collapseOne${productboard.pbNo}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
               <div>
   
                <div style="height: 30px; border: 1px solid #ccc; padding: 5px;" >
            
                	<button type="button"  data-toggle="modal" data-target="#staticBackdrop2" id="qnack" onclick="qnaNo(${productboard.pbNo})"  class="badge badge-light">답변 확인</button>
              
                </div>
                
                <br><br>
               
               </div>
                </div>
               </td>
            </tr>
            
            
            
            
            </c:if>
            <c:if test="${loginMember.division eq 1}">
                              <tr>
                                      
                <td colspan="5">
<%--                 <div class="collapse" id="collapseExample${productboard.pbNo}" id="toglespace"> --%>
                <div id="collapseOne${productboard.pbNo}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
               <div>
               
                <div style="height: 30px; border: 1px solid #ccc; padding: 5px;" >
               	  <button class="badge badge-light" type="button" data-toggle="modal" data-target="#staticBackdrop2" id="qnareplyenter" onclick="qnaNo(${productboard.pbNo})" value="${productboard.pbNo}"> 이 글은 비밀글입니다.</button>
                </div>
                
                <br><br>
          
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
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=1'#qna">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ qnapageInfo.prevPage }'#qna">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ qnapageInfo.startPage }" end="${ qnapageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage}">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>						
						<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ status.current }'#qna">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ qnapageInfo.nextPage }'#qna">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/product/detail?no=${no}&page=${ qnapageInfo.maxPage }'#qna">&gt;&gt;</button>
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
                
                    <div id="d7"></div>
                    
                    <div id="related-product-name">
                    <br>
                        <h4><b>관련 상품</b></h4>
                        
                         <p style="font-size: 12px; font-weight: bold; color: gray;">또 다른 상품을 만나보세요</p>
                        <div class=center id="related-list">
                            <c:forEach var="product" items="${ relatedProduct }">
                            
                            <div class="card" id="relatedcard">
                            <div id="card-img">
                                <img src="${ path }/upload/product/${product.pfrenamefilename}" class="card-img-top" alt="..." >
                            </div>
                          	<hr>
                            <div>
                               <h6>${product.name }</h6>
                               <p class="card-text">${product.eng}</p>
                            </div>
                            <hr>
                            <div style="position: relative;">
                                <c:forEach var="benefit" items="${product.benefit}" begin="0" end="0">
                                   <fmt:formatDate value="${benefit.bnenddate}" pattern="yyyy-MM-dd" var="enddate"/>
                                     <c:if test="${not empty product.benefit }">
                                            <fmt:parseNumber var="salepricerate" value="${benefit.bnratio/100}"/>
                                             <fmt:parseNumber var="saleprice" value="${product.price*salepricerate}"/>
                                             <fmt:parseNumber var="productsaleprice" value="${product.price-saleprice}"/>
                                     <p class="card-text" id="pprice" >
                                     <fmt:formatNumber value="${productsaleprice}" pattern="###,###"/>
                                     <span style="font-size: 12px;">won</span> <br></p>
                                     
                                     </c:if>
								</c:forEach>
                                     <c:if test="${empty product.productbenefit }">
                                         <p class="card-text" id="pprice"><fmt:formatNumber value="${product.price}" pattern="###,###"/>  <span style="font-size: 12px;">won</span></p>
                                     </c:if>        
                            </div>
                            </div>
                            
                            </c:forEach>
                        </div>
                    </div>
                    
                    <div id="d8"></div>

                </div>
            </div>
            <br><br><br><br>
         <br><br><br>
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
        
        <div class="modal fade" id="staticBackdrop1${productboard.pbcNo}" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel" ><b>REVIEW</b></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <table class="table">
					<tr>
						<td>
                            <span class="material-symbols-outlined">
                                account_circle
                                </span>
                           
                        </td>
                        <td id="writerNo" data-id="${loginMember.no}">
                            ${loginMember.id}
                        </td>
	
					</tr>
					<tr>
					<c:forEach var="product" items="${ list }">
                        <td><p style="font-size: 12px; font-weight: bold;" id="PNo" data-id="${product.PNo}">상품 명</p></td>
                        <td>${product.eng }</td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td><p style="font-size: 12px; font-weight: bold;">글 제목</p></td>
						<td><input class="form-control"  id="pbTitle" type="text"></td>

                    </tr>
                    <tr>
						<td><p style="font-size: 12px; font-weight: bold;">평점</p></td>
						<td> <select name="grade" id="pbGrade" style="color: rgba(65, 56, 2, 0.815);">
							<option value="*">--</option>
                            <option value="5" selected>★★★★★</option>
                            <option value="4">★★★★☆</option>
                            <option value="3">★★★☆☆</option>
                            <option value="2">★★☆☆☆</option>
                            <option value="1">★☆☆☆☆</option>
                        </select></td>
					</tr>
					<tr>
						<td><p style="font-size: 12px; font-weight: bold;">내용</p></td>
						<td><textarea class="form-control" id="pbContent" rows="10"></textarea></td>
					</tr>
					<tr>
                        <td><p style="font-size: 12px; font-weight: bold;">비밀번호</p></td>
                        <td><input type="password" width="10px;" id="pbPwd"></td>
                    </tr>					
				</table>
            </div>
            
            <div class="modal-footer">
            	<c:forEach var="productboardCategory" items="${boardcate}" begin="0" end="0" >
                <button id="reviewWrite" type="button" class="badge badge-pill badge-info" value="${productboardCategory.pbcno}" onClick="window.location.reload()">등록하기</button>
                </c:forEach>
				<button type="button" class="badge badge-pill badge-light" data-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
        
       
<!--     </div> -->
    
    
        <div class="modal fade" id="staticBackdrop2${productboard.pbcNo}100" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel" ><b>QnA</b></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <table class="table" >
                    <tr>
                        <td colspan="2" >
                            <p style="font-size: 20px; font-weight: bold;" id="qnaWriterNo" data-id="${loginMember.no}">
                            ${loginMember.id}</p>
                            <c:forEach var="product" items="${ list }">
                            <p style="font-size: 12px; font-weight: bold; color: gray;"  id="qnaPNo" data-id="${product.PNo}"> 
                            상품 명 : ${product.eng }</p>
                            </c:forEach>
                        </td>
                    </tr>
                   <tr>
                        <td><p style="font-size: 12px; font-weight: bold;">Q.</p></td>
						<td><input class="form-control"  id="qnaPbTitle" type="text"></td>

                    </tr>
					
                   <tr>
						<td><p style="font-size: 12px; font-weight: bold;">문의 내용</p></td>
						<td><textarea class="form-control" id="qnaPbContent" rows="10"></textarea></td>
					</tr>
					<tr>
                        <td><p style="font-size: 12px; font-weight: bold;">비밀번호</p></td>
                        <td><input type="password" width="10px;" id="qnaPbPwd"></td>
                    </tr>			
				</table>
            </div>
            <div class="modal-footer">
               <c:forEach var="productboardCategory" items="${boardcate}" begin="1" end="1" >
                <button class="badge badge-pill badge-success" type="button"  id="qnaWrite" value="${productboardCategory.pbcno}"  onClick="window.location.reload()">등록하기</button>
                </c:forEach>
				<button type="button" class="badge badge-pill badge-light" data-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
   
    
</body>
<script>

	
	
	 function optminus(mprice) {

      
//        price = $('#selected-price').text();   
       
//        console.log(price -= mprice);
       
//        console.log("가격 " + price);
      
      
	    
};

var totalcount = 1;
var quantity = 1;
var price = 0;
var originprice = 0;
$('#optselect').change(function() {
	 price = Number($('#selected-price').text()); 
	 
	 originprice =  price;
	 console.log("가격 " + price);
	 
	
});

function optplus(pprice) {
	$('#selected-price').text(price += pprice);
	$('#total').text(price);
	$('#quantity').val(++quantity);
	
    
}

function optminus(mprice) {
	$('#selected-price').text(price -= mprice);
	$('#total').text(price);
	$('#quantity').val(--quantity);
	if(price <= 0 || quantity <= 0) {
		$('#selected-price').text(originprice);
		alert('최소 주문 수량은 1개입니다.');
	}
	

}



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


function requestLogin(){
	 alert('로그인 후 다시 이용해주세요.');
 };

 
 function requestQna(){
	 alert('비밀글은 작성자만 열람 가능합니다.');
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

				$('#Lcount').html(result);
				
			
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
								likeCountUpdate(PNo, MNo, result);
							} 
							
						}else if (result == 0) {
							if(confirm('관심 상품을 등록 하시겠습니까?')) {
								likeCountUpdate(PNo, MNo, result);
							}
						}
						
					}	
					
			 });
	
		
	 
	 };

};



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


// qna 글 상세 조회
function qnaNo(no)  {
	let pbNo = no;
	console.log(pbNo);
	$.ajax({
		type: 'GET',
		url: '${path}/qnaView',
		dataType: 'json',
		data: {
			pbNo
		},
		success : (obj) => {
			let result = '';
			if(obj !== null) {
				console.log(obj);	
				
				result = '<table class="table">' +
				         '<tr>' +
				         '<td>' + '<p style="font-size: 14px; color: green; font-weight: bold;"> Q.' + 
				         obj.pbTitle  +
				         '</p>'  +
				         '</td>' +
				         '<td style="text-align: right;">'  + '<p style="font-size: 12px; font-weight: bold; color: gray;">'  +
				         obj.pbdate  + 
				         '</p>'  +
				         '</td>' +
				         '</tr>' +
				         '<td colspan="2" rowspan="2">' +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;"> 회원 명 : ' +
				         obj.mid +
				         '</p>'  +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;" > 상품 명 : ' +
				         obj.peng +
				         '</p>'  +
				         '</td>'  + ' </tr>'  +
				         ' <tr>' + '</tr>'  +
				         '<tr>'  + '<td colspan="2">'  + '<textarea class="qnacontent" id="contents" rows="10" disabled>'  + obj.pbContent +
				         '</textarea>' + '</td>'  + '</tr>'  +
				         '</table>'	
					
			}
 			    $('.qna-answer').empty();
			    $('#qna-view-table').empty();
				$('#qna-view-table').prepend(result);
				$('#qnaReply').attr('value', pbNo);
				
				
			
			
		}
		
	});
	// qna 글의 댓글 조회
	 $.ajax({
			type: 'GET',
			url: '${path}/reviewReplyRe',
			dataType: 'json',
			data: {	
				pbNo
			},
			success: (obj) => {
				result = '';
				if(obj !== null) {
					
					
					 for (let i = 0; i < obj.length; i++) {
						
						 console.log(obj[i]);
						 result +=  '<div style=" border: 1px solid #ccc; background-color: rgb(239, 236, 236);">'  +
						 '<div class="qna-answer-list">'  +
				         '<div style="width: 10%;">'  +
				         ' <p style="font-size: 12px;  line-height: 60px; text-align: center; font-weight: bold;">A.'  +
				         '</p>'  + '</div>' +
				         '<div style=" width: 90%; height: 100%; padding: 20px;">'  +
				         '<div class="qnacontent" id="contents"  style="background-color: rgb(239, 236, 236);">'  +
				         obj[i].pbrContent  +
				         '</div>' +  '<br>' + '<br>'+ '<p style="font-size: 8px;  color: gray;">' +
				         obj[i].pbrdate + '</p>'  + '</div>'  + '</div>'  + '</div> '
						
					
					
					 }
					
					 $('.qna-answer').html(result);
					
					 
					 
				}
				
				
			}
		
	    });
	
};


// qna 답변 작성
 $('#qnaReply').click(function () {
 	 
	 let pbNo = $('#qnaReply').val();
		console.log(pbNo);
	 
	 let mNo = $('#qnaReply').attr('data-id');
		console.log('관리자 번호 : ' + mNo);	
		
	 let pbrContent = $('#qnaReviewContent').val();
		console.log('답변 내용 : ' + pbrContent);
		
		$.ajax({
			type: 'POST',
			url: '${path}/qnaReply',
			dataType: 'json',
			data: {	
				pbNo, mNo, pbrContent
			},
			success: (obj) => {
				let result ='';
				console.log(obj)
				if(obj !== null) {
					
					result = 
						     '<div style=" border: 1px solid #ccc; background-color: rgb(239, 236, 236);">'  +
					         '<div class="qna-answer-list">'  +
					         '<div style="width: 10%;">'  +
					         ' <p style="font-size: 12px;  line-height: 60px; text-align: center; font-weight: bold;">A.'  +
					         '</p>'  + '</div>' +
					         '<div style=" width: 90%; height: 100%; padding: 20px;">'  +
					         '<div class="qnacontent" id="contents"  style="background-color: rgb(239, 236, 236);">'  +
					         obj.pbrContent  +
					         '</div>'   +  '<br>' + '<br>'  + '<p style="font-size: 8px;  color: gray;">' +
					         obj.pbrdate + '</p>'  + '</div>'  + '</div>'  + '</div> '

				}
  			 $('.qna-answer').append(result);
  			 $('#qna-reply-form-wrap').empty();
  			 $('#qna-reply-form-hidden').val(pbNo);
  			 
			}
			
		});
					
 });
	 
 
$(document).on('click', '#replyupdate', function () {
	
	let no = $(this).val();
	console.log(no);
	$(this).parents('.replyz').find('#replycontent').html('<textarea name="" id="" cols="40" rows="5">' +  '</textarea>');
});3
 

function replyupdate2(no) {
	
	console.log("댓글 번호 " + no);
}

function reviewNo(no) {
		let pbNo = no;
		var result1 = pbNo;
		let loginMemberNo = $('#loginMemberId').val();
		console.log(loginMemberNo);
		
	$.ajax({
		type: 'GET',
		url: '${path}/reviewRe',
		dataType: 'json',
		data: {	
			pbNo
		},
		success: (obj) => {
				let result = '';
				console.log(obj)
				if(obj !== null) {
					
					if(obj.pbGrade == 5 ) {
					result = '<table class="table">' +
			         '<tr>' +
			         '<td>' + '<p style="font-size: 14px;font-weight: bold;">' + 
			         obj.pbTitle  +
			         '</p>'  +
			         '</td>' +
			         '<td style="text-align: right;">'  + '<p style="font-size: 12px; font-weight: bold; color: gray;">'  +
			         obj.pbdate  + 
			         '</p>'  +
			         '</td>' +
			         '</tr>' +
			         '<td colspan="2" rowspan="2">' +
			         '<p style="font-size: 12px; font-weight: bold; color: gray;"> 회원 명 : ' +
			         obj.mid +
			         '</p>'  +
			         '<p style="font-size: 12px; font-weight: bold; color: gray;" > 상품 명 : ' +
			         obj.peng +
			         '</p>'  
			          + '<p style="height: 40px; font-size: 12px; font-weight: bold; color: gray;"> 평점 : ' +
						'<img src="${path}/upload/product/5-stars.png" class="gradestars">' +
			         '</p>'  +
			         '</td>'  + ' </tr>'  +
			         ' <tr>' + '</tr>'  +
			         '<tr>'  + '<td colspan="2">'  + '<textarea class="qnacontent" id="contents" rows="10" disabled>'  + obj.pbContent +
			         '</textarea>' + '</td>'  + '</tr>'  +
			         '</table>'
					}
					else if(obj.pbGrade == 4) {
						result = '<table class="table">' +
				         '<tr>' +
				         '<td>' + '<p style="font-size: 14px; font-weight: bold;">' + 
				         obj.pbTitle  +
				         '</p>'  +
				         '</td>' +
				         '<td style="text-align: right;">'  + '<p style="font-size: 12px; font-weight: bold; color: gray;">'  +
				         obj.pbdate  + 
				         '</p>'  +
				         '</td>' +
				         '</tr>' +
				         '<td colspan="2" rowspan="2">' +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;"> 회원 명 : ' +
				         obj.mid +
				         '</p>'  +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;" > 상품 명 : ' +
				         obj.peng +
				         '</p>'  
				          + '<p style="height: 40px; font-size: 12px; font-weight: bold; color: gray;"> 평점 : ' +
							'<img src="${path}/upload/product/free-icon-stars-7372056.png" class="gradestars">' +
				         '</p>'  +
				         '</td>'  + ' </tr>'  +
				         ' <tr>' + '</tr>'  +
				         '<tr>'  + '<td colspan="2">'  + '<textarea class="qnacontent" id="contents" rows="10" disabled>'  + obj.pbContent +
				         '</textarea>' + '</td>'  + '</tr>'  +
				         '</table>'
						
						
						
						
						
					}
					else if(obj.pbGrade == 3) {
						result = '<table class="table">' +
				         '<tr>' +
				         '<td>' + '<p style="font-size: 14px; font-weight: bold;">' + 
				         obj.pbTitle  +
				         '</p>'  +
				         '</td>' +
				         '<td style="text-align: right;">'  + '<p style="font-size: 12px; font-weight: bold; color: gray;">'  +
				         obj.pbdate  + 
				         '</p>'  +
				         '</td>' +
				         '</tr>' +
				         '<td colspan="2" rowspan="2">' +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;"> 회원 명 : ' +
				         obj.mid +
				         '</p>'  +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;" > 상품 명 : ' +
				         obj.peng +
				         '</p>'  
				          + '<p style="height: 40px; font-size: 12px; font-weight: bold; color: gray;"> 평점 : ' +
							'<img src="${path}/upload/product/free-icon-stars-1357646.png" class="gradestars">' +
				         '</p>'  +
				         '</td>'  + ' </tr>'  +
				         ' <tr>' + '</tr>'  +
				         '<tr>'  + '<td colspan="2">'  + '<textarea class="qnacontent" id="contents" rows="10" disabled>'  + obj.pbContent +
				         '</textarea>' + '</td>'  + '</tr>'  +
				         '</table>'
						
						
						
						
						
					}
					else if(obj.pbGrade == 1) {
						result = '<table class="table">' +
				         '<tr>' +
				         '<td>' + '<p style="font-size: 14px; font-weight: bold;">' + 
				         obj.pbTitle  +
				         '</p>'  +
				         '</td>' +
				         '<td style="text-align: right;">'  + '<p style="font-size: 12px; font-weight: bold; color: gray;">'  +
				         obj.pbdate  + 
				         '</p>'  +
				         '</td>' +
				         '</tr>' +
				         '<td colspan="2" rowspan="2">' +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;"> 회원 명 : ' +
				         obj.mid +
				         '</p>'  +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;" > 상품 명 : ' +
				         obj.peng +
				         '</p>'  
				          + '<p style="height: 40px; font-size: 12px; font-weight: bold; color: gray;"> 평점 : ' +
							'<img src="${path}/upload/product/free-icon-lock-4208464.png" class="gradestars">' +
				         '</p>'  +
				         '</td>'  + ' </tr>'  +
				         ' <tr>' + '</tr>'  +
				         '<tr>'  + '<td colspan="2">'  + '<textarea class="qnacontent" id="contents" rows="10" disabled>'  + obj.pbContent +
				         '</textarea>' + '</td>'  + '</tr>'  +
				         '</table>'
						
						
						
						
						
					} else {
						result = '<table class="table">' +
				         '<tr>' +
				         '<td>' + '<p style="font-size: 14px;  font-weight: bold;">' + 
				         obj.pbTitle  +
				         '</p>'  +
				         '</td>' +
				         '<td style="text-align: right;">'  + '<p style="font-size: 12px; font-weight: bold; color: gray;">'  +
				         obj.pbdate  + 
				         '</p>'  +
				         '</td>' +
				         '</tr>' +
				         '<td colspan="2" rowspan="2">' +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;"> 회원 명 : ' +
				         obj.mid +
				         '</p>'  +
				         '<p style="font-size: 12px; font-weight: bold; color: gray;" > 상품 명 : ' +
				         obj.peng +
				         '</p>'  
				          + '<p style="height: 40px; font-size: 12px; font-weight: bold; color: gray;"> 평점 : ' +
							'<img src="${path}/upload/product/free-icon-stars-2stars.png" class="gradestars">' +
				         '</p>'  +
				         '</td>'  + ' </tr>'  +
				         ' <tr>' + '</tr>'  +
				         '<tr>'  + '<td colspan="2">'  + '<textarea class="qnacontent" id="contents" rows="10" disabled>'  + obj.pbContent +
				         '</textarea>' + '</td>'  + '</tr>'  +
				         '</table>'
						
						
					}
				}	
				
				
				
				 $('#review-view-table').html(result);
// 				 $('#review-area').html(result);
// 				 $('#replyenter').attr('value',pbNo);
			
// 				 $('#replyupdate').attr('value', loginMemberNo);
				 
				}
				
		
		
		
	});
	
	
	$.ajax({
	      type: 'GET',
	      url: '${path}/reviewReplyRe',
	      dataType: 'json',
	      data: {   
	         pbNo
	      },
	      success: (obj) => {
	            let result = '';
	            let result2 = '';
	            if(obj !== null) {
	               
	             for (let i = 0; i < obj.length; i++) {
	                	console.log(obj[i]);
	                	
	                	
	                if(loginMemberNo == obj[i].mno) {
	               result += '<div class="review-reply-list">' +  
	               '<div style=" height: 40px;" id="replyname">' + 
	               '<p style="font-size: 13px; padding: 15px; font-weight: bold;">' +
	               obj[i].mid + 
	               '</p>' +
	               '</div>' + 
	               '<div style="height: 150px ;" id="reviewcontent">' +
	               '<div style="height: 60%;" id="replycontent">' +  '<p style="font-size: 13px; padding: 10px; font-weight: bold;">' +
	                obj[i].pbrContent  + '</p>' + 
	               '<div style="text-align: right; padding: 10px;">' +
	               '<button style="width: 70px; height: 20px; font-size: 10px;" value="" id="replyupdate" class="badge badge-light">수정 하기</button>' +
	               '<button style=" height: 20px; font-size: 10px;" value="" id="replydelete" class="badge badge-secondary">X</button>' +
	               '</div>' + 
	               '</div>' + 
	               '<div style="height: 20%; " >' + 
	               '<p style="font-size: 11px; padding: 5px;">' + 
	               obj[i].pbrdate +
	               '<span>신고</span></p>' + 
	               '</div>'  +
	               '<div style="height: 20%; border-top: 1px solid #ccc;" >' + 
	               '<p style="font-size: 13px; padding: 5px;">' +'</p>' +
	               '</div>' + 
	               '</div>' + 
	               '</div>'
	                
	            
	               
	                } else {
	                   
	                   result += '<div class="review-reply-list">' +  
	                     '<div style=" height: 40px;" id="replyname">' + 
	                     '<p style="font-size: 13px; padding: 15px; font-weight: bold;">' +
	                     obj[i].mid + 
	                     '</p>' +
	                     '</div>' + 
	                     '<div style="height: 150px ;" id="reviewcontent">' +
	                     ' <div style="height: 60%;" id="replycontent" >' + '<p style="font-size: 13px; padding: 10px; font-weight: bold;">' +
	                     obj[i].pbrContent + '</p>' +
	                     '</div>' + 
	                     '<div style="height: 20%;" >' + 
	                     '<p style="font-size: 11px; padding: 5px;">' + 
	                     obj[i].pbrdate +
	                     '<span>신고</span></p>' + 
	                     '</div>'  +
	                     '<div style="height: 20%; border-top: 1px solid #ccc;" >' + 
	                     '<p style="font-size: 13px; padding: 5px;">' +'</p>' +
	                     '</div>' + 
	                     '</div>' + 
	                     '</div>'
	                      
	                     
	                }
	                
	               
	            }   
	             
// 	             $('#review-area').empty();
	             $('#review-area').html(result);
	             $('#replyenter').attr('value',pbNo);
	         
// 	             $('#replyupdate').attr('value', loginMemberNo);
	             
	            }
	            
	      } 
	      
	      
	   });

	
	
	
	
	
	
	
	
	
	
	
	
}


$('#qnaWrite').click(function () {
		let pbcNo = $('#qnaWrite').val();
		console.log('카테고리 번호 : ' + pbcNo);
	
		let pbTitle = $('#qnaPbTitle').val();
		console.log("게시글 제목 : " + pbTitle);
		
		
		let pbContent = $('#qnaPbContent').val();
		console.log("내용  : " +  pbContent);
		
		let PNo = $('#qnaPNo').attr('data-id');
		console.log('상품번호 : ' +  PNo);
		
		let writerNo = $('#qnaWriterNo').attr('data-id');
		console.log('작성자 번호 : ' +  writerNo);
	
		
		if($('#qnapbPwd').val() === '') {
			var pbPwd = null;
			$('#qnaPbPwd').attr('value',pbPwd);
		} else {
			var	pbPwd =	$('#qnaPbPwd').val();
		}
		console.log("비밀번호  : " +  pbPwd);
	
	
		$.ajax({
			type: 'POST',
			url: '${path}/qnaWrite',
			dataType: 'json',
			data: {	
				pbcNo, pbTitle, pbContent, pbPwd, PNo, writerNo
			},
			success: (obj) => {
				let result = '';
				console.log(obj);
				
				
			}
		
		
		});
		
		
});







$('#reviewWrite').click(function () {
	    let pbcNo = $('#reviewWrite').val();
		console.log("카테고리 번호 : " + pbcNo);
		
		let pbTitle = $('#pbTitle').val();
		console.log("게시글 제목 : " + pbTitle);
		
		let pbGrade = $('#pbGrade option:selected').val();
		console.log("평점  : " + pbGrade);
		
		let pbContent = $('#pbContent').val();
		console.log("내용  : " +  pbContent);
		
		let PNo = $('#PNo').attr('data-id');
		console.log('상품번호 : ' +  PNo);
		
		let writerNo = $('#writerNo').attr('data-id');
		console.log('작성자 번호 : ' +  writerNo);
		
		
		if($('#pbPwd').val() === '') {
			var pbPwd = null;
			$('#pbPwd').attr('value',pbPwd);
		} else {
			var	pbPwd =	$('#pbPwd').val();
		}
		console.log("비밀번호  : " +  pbPwd);
		
		
			$.ajax({
				type: 'POST',
				url: '${path}/reviewWrite',
				dataType: 'json',
				data: {	
					pbcNo, pbTitle, pbGrade, pbContent, pbPwd, PNo, writerNo
				},
				success: (obj) => {
					let result = '';
					console.log(obj);
					
					
// 					if(obj !== null) {
					
// 						result = '<tr class="xans-record-" id="reviewline">' +
// 				         '<td  align="center">' +  obj.pbNo  + '</td>'  +
// 				         '<td  width="600px" >' +  '<a class="link" type="button" data-toggle="collapse" data-target="#collapseOne' + obj.pbNo + 
// 				         '" aria-expanded="false" aria-controls="collapseOne' + obj.pbNo + '">' +
// 				         obj.pbTitle  + '</a>'  + '<span>' + obj.replycount  + '</span>'  +
// 				         '</td>'  + '<td>' + obj.mid  + '</td>' 
				       
				  	
					
// 				}
				
// 					$('.review-board-list').append(result);
				}
				
		
		});
			
			
});





$('#replyenter').click(function () {
	   let pbNo = $('#replyenter').val();
		console.log("게시판 번호 : " + pbNo);
	
		let MNo = $('.mno').attr('data-id');
		console.log('회원번호 : ' + MNo);
		
		let pbrContent = $('#replycontent').val();
		console.log('댓글 내용 : ' + pbrContent);
		
	
		
		if (confirm('댓글을 작성하시겠습니까?'))  {
		$.ajax({
			type: 'POST',
			url: '${path}/reviewReply',
			dataType: 'json',
			data: {	
				pbNo, pbrContent , MNo
			},
		
			success: (obj) => {
				console.log(obj);
				let result = '';
				console.log(obj.mid) 
					
				if(obj !== null) {
					result = '<div class="review-reply-list">' +  
					'<div style=" height: 40px;" id="replyname">' + 
					'<p style="font-size: 13px; padding: 15px; font-weight: bold;">' +
					obj.mid + 
					'</p>' +
					'</div>' + 
					'<div style="height: 150px ;" id="reviewcontent">' +
					' <div style="height: 60%;" id="replycontent" >' + '<p style="font-size: 13px; padding: 10px; font-weight: bold;">' +
					obj.pbrContent + '</p>' +
					'<div style="text-align: right; padding: 10px;">' +
					'<button style="width: 70px; height: 20px; font-size: 10px;" value="" id="replyupdate" class="badge badge-light">수정 하기</button>' +
					'<button style=" height: 20px; font-size: 10px;" value="" id="replydelete" class="badge badge-secondary">X</button>' +
					'</div>' + 
					
					'</div>' + 
					'<div style="height: 20%;" >' + 
					'<p style="font-size: 11px; padding: 5px;">' + 
					obj.pbrdate +
					'<span>신고</span></p>' + 
					'</div>' + 
					'<div style="height: 20%; border-top: 1px solid #ccc;" >' + 
					'<p style="font-size: 13px; padding: 5px;">' +'</p>' +
					
					'</div>' + 
					'</div>'	
					
			    }
				$('#review-area').prepend(result);
			}
			
	});
		}else {
			alert('다시 시도해주세요.');
		}

});



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
	    	 
	    	
	    	
	    	 
	    	 
	    	 
	    	 
	    	 
	    	 
	    	 
	    	 
// 	    	 var result2 = $('#optselect option:selected').val2();
// 	    	 console.log("result2" + result2);
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



function shareTwitter() {
    var sendText = "perfume"; // 전달할 텍스트
    var sendUrl = "perfume.tistory.com/"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

function shareFacebook() {
    var sendUrl = "perfume.tistory.com/"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

function clip(){

var url = '';
var textarea = document.createElement("textarea");
document.body.appendChild(textarea);
url = window.document.location.href;
textarea.value = url;
textarea.select();
document.execCommand("copy");
document.body.removeChild(textarea);
alert("URL이 복사되었습니다.")
}




const spinnerWrapperE1 = document.querySelector('.spinner-wrapper');

window.addEventListener('load', () => {
spinnerWrapperE1.style.opacity = '0';

setTimeout(() => {
    spinnerWrapperE1.style.display = 'none';
}, 1200);

});





</script>




</html>