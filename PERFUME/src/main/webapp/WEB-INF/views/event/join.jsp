<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signUp</title>

    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<!-- CSS -->
	<link rel="stylesheet" href="${ path }/css/event/join.css">
	<!-- jQuery -->
	<script src="${ path }/js/jquery-3.6.3.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    <section>
    <h1 id="title" align="center">회원가입</h1>
    <form class="needs-validation" name="memberJoinFrm" action="${ path }/join" method="POST" onsubmit="return check()" novalidate>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="userId">아이디</label>
                <input type="text" name="id" id="userId" class="form-control" placeholder="아이디 입력" pattern="^[a-z][a-z0-9]{3,11}$"
                        data-toggle="tooltip" data-placement="top" title="첫 글자는 반드시 영문 소문자, 4 ~ 12자의 영문 소문자 숫자" required>
                <span id="idCheck" style="font-size: small;"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="password">비밀번호</label>
                <input type="password" name="pwd" id="password" class="form-control" placeholder="비밀번호 입력" 
                        data-toggle="tooltip" data-placement="top" title="하나 이상의 대소문자, 하나의 숫자 및 하나의 특수 문자(!,@,$,%,&,*)를 포함한 8 ~ 12자"
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$" required>
                <span id="pwdCheck" style="font-size: small;"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" id="confirm-password" class="form-control" placeholder="비밀번호 입력"
                		pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$"  required>
                <span id="conPwdCheck" style="font-size: small;"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="name">이름</label>
                <input type="text" name="name" id="name" class="form-control" placeholder="이름 입력"
                        pattern="^[가-힣]{2,10}$" required>
                <span id="nameCheck" style="font-size: small;"></span>
            </div>
        </div>
<!-- 생년월일 -->
        <div id="topDivBirth" class="form-group">
            <div id="divBirth1" class="form-row">
                <div  class="col-md-6 mb-3">
                    <label id="labelBirth" for="birth-year">생년월일</label>
                </div>
            </div>
            <div id="divBirth2" class="form-row">
                <div id="divBirth3" class="col-md-6 mb-3">
                    <input type="text" name="birthYear" id="birth-year" class="form-control" placeholder="년" pattern="^(19[0-9][0-9]|20\d{2})$" required>
                    <select name="birthMonth" id="birth-month" class="custom-select" required>
                        <option selected disabled value="">월</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <input type="text" name="birthDate" id="birth-date" class="form-control" placeholder="일" required>
                    <small id="birthHelpBlock" class="form-text text-muted">
                    년(네 자리 ex.1995) <b style="color: orange;">일(두 자리 ex.01)</b>로 입력해주세요.
                    </small>
                    <span id="birthCheck" style="font-size: small;"></span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="gender">성별</label>
                <select name="gender" id="gender" class="custom-select" required>
                    <option selected disabled value="">성별</option>
                    <option value="남">남성</option>
                    <option value="여">여성</option>
                </select><br>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="email">이메일</label>
                <input type="email" name="mail" id="email" class="form-control" placeholder="이메일 입력"
                        pattern="^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$" required>
                <small id="emailHelpBlock" class="form-text text-muted">
                    이메일 인증을 위한 필수 입력사항입니다.
                </small>
                <span id="emailCheck" style="font-size: small;"></span>
            </div>
        </div>
<!-- 전화번호 -->
        <div class="form-group">    
            <div class="col-md-6 mb-3">
                <label for="phone">전화번호</label>
                <div id="phDiv">
                    <input type="tel" name="phone" id="phone" class="form-control" placeholder="휴대폰 번호를 입력해주세요" pattern="^[0-9]{10,11}$" required>
                    <button type="button" id="btnPh1" class="btn btn-secondary" disabled>인증번호 받기</button><br>
                </div>
                <div>
                    <input type="text" id="verification-code" name="verification-code" class="form-control" placeholder="인증번호를 입력해주세요" required>
                    <button type="button" id="btnPh2" class="btn btn-secondary" disabled>인증번호 확인</button><br>
                </div>
                <small id="phoneHelpBlock" class="form-text text-muted">휴대폰 인증을 위한 필수 입력사항입니다.</small>
                <span id="phoneCheck" style="font-size: small;"></span>
            </div>
        </div>
<!-- 주소 -->
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="sample6_postcode">주소</label>
                <div class="addressDiv">
                    <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호" required>
                    <input type="button" id="addressBtn"class="btn btn-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                </div>
                <div class="addressDiv">
                    <input type="text" name="addr1" id="sample6_address" class="form-control" placeholder="주소" >
                </div>
                <div class="addressDiv">
                    <input type="text" name="addr2" id="sample6_detailAddress" class="form-control" placeholder="상세주소(선택 입력 가능)">
                </div>
                <div class="addressDiv">
                    <input type="text" name="addr3" id="sample6_extraAddress" class="form-control" placeholder="참고항목(선택 입력 가능)">
                </div>
            </div>
        </div>
<!-- 이용약관 -->
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <div class="form-check">
                    <label class="form-check-label"><input type="checkbox" id="check-all" class="form-check-input" onchange="checkAll()"> <b>[전체 동의]</b><br>
                    <div>
                        이용약관 및 개인정보 수집 및 이용,<br>
                        쇼핑정보 수신(선택)에 모두 동의합니다.
                    </div>
                    </label><br>
                    <label class="form-check-label">
                    	<input type="checkbox" name="option1" id="essential-agreement" class="form-check-input" required> <b>[필수]</b> 필수 이용 약관에 동의합니다.
                    </label>
                    <!-- 버튼 아코디언 챗 gpt 참고 -->
                    <button type="button" id="btnAgr1" class="btn btn-secondary btn-sm" onclick="showEssentialAgreement()">+</button>    
                    <div id="essential-agreement-content" class="divAgr">
                        <h6><b>필수 약관</b></h6>
                        <pre>
제1조(목적)

이 약관은 (주)내음 (전자상거래 사업자)가 운영하는 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.
「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」

제2조(정의)

①"몰" 이란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                    </div>
                    <label class="form-check-label">
                    	<input type="checkbox" name="tCheck" id="optional-agreement" value="Y" class="form-check-input"> <b>[선택]</b> 마케팅 용도와 광고성 정보 수신에 동의합니다.
                    </label>
                    <button type="button" id="btnAgr2" class="btn btn-secondary btn-sm" onclick="showOptionalAgreement()">+</button>
                    <div id="optional-agreement-content" class="divAgr">
                        <h6><b>선택 약관</b></h6>
                        <pre>
할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.

단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.

선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</pre>
                    </div>
                </div>
            </div>
        </div>
        <div id="submitDiv">
            <button id="btnSubmit" class="btn btn-secondary btn-lg" type="submit" ><b>회원가입</b></button>
        </div>
    </form>
    </section>    

    <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {

    'use strict';

        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
            
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();

                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);

    })();
    
    $(document).ready(function(){
    	
        // 아이디 체크
        $('#userId').keyup((event) => {
        	// let id = event.target.value;                // 자바스크립트용 표현
	        let id = $(event.target).val();             	// 제이쿼리 표현
	        let regExp = /^[a-z][a-z0-9]{3,11}$/
	        
	        if(id === null || id === '') {
	            $('#idCheck').text('').css({color: 'red', fontweight: 'bold'});
	        } else if(regExp.test(id)) {
	           	$.ajax({
	           		type: 'POST',
	           		url: '${path}/event/idCheck',
	           		dataType: 'json',
	           		data: {
	           			id
	           		},
	           		success: (obj) => {
	           			if(obj.duplicate){
	           				$('#idCheck').text('이미 사용중인 아이디입니다.').css({color: 'red', fontweight: 'bold'});
	           			} else {
	           				$('#idCheck').text('사용 가능한 아이디입니다.').css({color: 'green', fontweight: 'bold'});
	           			}
	           		},
	           		error: (error) => {
	           			console.log(error);
	           		}
	           	});
	        } else {
	            $('#idCheck').text('첫 글자는 반드시 영문 소문자, 4 ~ 12자의 영문 소문자 숫자').css({color: 'red', fontweight: 'bold'});
	        }
        });

        // 비밀번호 체크
        $('#password').keyup((event) => {
	        // let id = event.target.value;                // 자바스크립트용 표현
	        let pwd = $(event.target).val();             // 제이쿼리 표현
	        let regExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$/        // 정규표현식
	
	        if(pwd === null || pwd === '') {
	            $('#pwdCheck').text('').css({color: 'red', fontweight: 'bold'});
	        } else if(regExp.test(pwd)) {
	            $('#pwdCheck').text('').css({color: 'green', fontweight: 'bold'});
	        } else {
	            $('#pwdCheck').text('하나 이상의 영문 대문자, 소문자, 숫자 및 특수 문자(!,@,$,%,&,*)를 포함한 8 ~ 12자').css({color: 'red', fontweight: 'bold'});
	        }
        });

        // 비밀번호 일치 확인
        $('#confirm-password').keyup((event) => {
            let pass1 = document.getElementById('password').value;
            let pass2 = document.getElementById('confirm-password').value;

            if(pass2 === null || pass2 === ''){
                $('#conPwdCheck').text('').css({color: 'red', fontweight: 'bold'});
            } else if(pass1 !== pass2){
                $('#conPwdCheck').text('비밀번호가 일치하지 않습니다.').css({color: 'red', fontweight: 'bold'});
            } else{
                $('#conPwdCheck').text('비밀번호가 일치합니다.').css({color: 'green', fontweight: 'bold'});
            }
        });

        // 이름 체크
        $('#name').keyup((event) => {
	        // let id = event.target.value;                // 자바스크립트용 표현
	        let name = $(event.target).val();             // 제이쿼리 표현
	        let regExp = /^[가-힣]{2,10}$/        // 정규표현식
	
	        if(name === null || name === '') {
	            $('#nameCheck').text('').css({color: 'red', fontweight: 'bold'});
	        } else if(regExp.test(name)) {
	            $('#nameCheck').text('').css({color: 'green', fontweight: 'bold'});
	        } else {
	            $('#nameCheck').text('띄어쓰기 없이 한글로만 작성해주십시오.').css({color: 'red', fontweight: 'bold'});
	        }
        });

        // 생년월일
        // 년
        $('#birth-year').keyup((event) => {
            // let id = event.target.value;                // 자바스크립트용 표현
            let year = $(event.target).val();             // 제이쿼리 표현
            let regExp = /^(19[0-9][0-9]|20\d{2})$/       // 정규표현식
            var now = new Date();	                        // 현재 날짜 및 시간
            var nowYear = now.getFullYear();
            
            if(year > nowYear) {
                $('#birthCheck').text('유효하지 않은 연도입니다.').css({color: 'red', fontweight: 'bold'});
            } else {
            	if(year < 1900){  		
	                $('#birthCheck').text('유효하지 않은 연도입니다.').css({color: 'red', fontweight: 'bold'});
            	} else {
	                if(year === null || year === '') {
	                    $('#birthCheck').text('').css({color: 'red', fontweight: 'bold'});
	                } else if(regExp.test(year)) {
	                    $('#birthCheck').text('').css({color: 'green', fontweight: 'bold'});
	                } else {
	                    $('#birthCheck').text('태어난 연도를 정확히 입력해주세요.').css({color: 'red', fontweight: 'bold'});
	                }
            	}
            }
        });
        // 일
        $('#birth-date').keyup((event) => {

            // let id = event.target.value;                // 자바스크립트용 표현
            let date = $(event.target).val();             // 제이쿼리 표현
            let birthMonth = $('#birth-month option:selected').val();

            if(birthMonth == '01' || birthMonth == '03' || birthMonth == '05' || birthMonth == '07' || birthMonth == '08' || birthMonth == '10' || birthMonth == '12') {
                
                let regExp = /^(0[1-9]|[1-2][0-9]|3[0-1])$/
                
                if(date === null || date === '') {
                    $('#birthCheck').text('').css({color: 'red', fontweight: 'bold'});
                } else if(regExp.test(date)) {
                    $('#birthCheck').text('').css({color: 'green', fontweight: 'bold'});
                } else {
                    $('#birthCheck').text('태어난 일을 정확히 입력해주세요.').css({color: 'red', fontweight: 'bold'});
                }
                
            } else if(birthMonth == '04' || birthMonth == '06' || birthMonth == '09' || birthMonth == '11') {
                
                let regExp = /^(0[1-9]|[1-2][0-9]|3[0])$/
                
                if(date === null || date === '') {
                    $('#birthCheck').text('').css({color: 'red', fontweight: 'bold'});
                } else if(regExp.test(date)) {
                    $('#birthCheck').text('').css({color: 'green', fontweight: 'bold'});
                } else {
                    $('#birthCheck').text('태어난 일을 정확히 입력해주세요.').css({color: 'red', fontweight: 'bold'});
                }

            } else { // 2월
                
                let birthYear = $('#birth-year').val();
                // 윤년
                var isleap = (birthYear % 4 == 0 && (birthYear % 100 != 0 || birthYear % 400 == 0));
                
                if(isleap){
                    let regExp = /^(0[1-9]|[1-2][0-9])$/
    
                    if(date === null || date === '') {
                        $('#birthCheck').text('').css({color: 'red', fontweight: 'bold'});
                    } else if(regExp.test(date)) {
                        $('#birthCheck').text('').css({color: 'green', fontweight: 'bold'});
                    } else {
                        $('#birthCheck').text('태어난 일을 정확히 입력해주세요.').css({color: 'red', fontweight: 'bold'});
                    }
                    
                } else {
                    let regExp = /^(0[1-9]|[1-2][0-8])$/
    
                    if(date === null || date === '') {
                        $('#birthCheck').text('').css({color: 'red', fontweight: 'bold'});
                    } else if(regExp.test(date)) {
                        $('#birthCheck').text('').css({color: 'green', fontweight: 'bold'});
                    } else {
                        $('#birthCheck').text('태어난 일을 정확히 입력해주세요.').css({color: 'red', fontweight: 'bold'});
                    }
                }
            }
        });

        // 이메일 체크 
        $('#email').keyup((event) => {
	        // let id = event.target.value;                // 자바스크립트용 표현
	        let email = $(event.target).val();             // 제이쿼리 표현
	        let regExp = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/       // 정규표현식
	
	        if(email === null || email === '') {
	            $('#emailCheck').text('').css({color: 'red', fontweight: 'bold'});
	        } else if(regExp.test(email)) {
	            // 이메일 중복 검사
	            $.ajax({
	           		type: 'POST',
	           		url: '${path}/event/emailCheck',
	           		dataType: 'json',
	           		data: {
	           			email
	           		},
	           		success: (obj) => {
	           			if(obj.duplicate){
	           				$('#emailCheck').text('이미 사용중인 이메일입니다.').css({color: 'red', fontweight: 'bold'});
	           			} else {
	           				$('#emailCheck').text('사용 가능한 이메일입니다.').css({color: 'green', fontweight: 'bold'});
	           			}
	           		},
	           		error: (error) => {
	           			console.log(error);
	           		}
	           	});
	            
	        } else {
	            $('#emailCheck').text('이메일 형식에 맞게 제대로 입력해주세요. (ex.perfume@mimoa.com)').css({color: 'red', fontweight: 'bold'});
	        }
        });

     // 폰 정규식 체크
        $('#phone').keyup((event) => {
	        // let id = event.target.value;                // 자바스크립트용 표현
	        let phone = $(event.target).val();             // 제이쿼리 표현
	        let regExp = /^[0-9]{11,11}$/       // 정규표현식
	
	        if(phone === null || phone === '') {
	            $('#phoneCheck').text('').css({color: 'red', fontweight: 'bold'});
	            $('#btnPh1').attr("disabled", true);
	        } else if(regExp.test(phone)) {
	        	
	            $.ajax({
	           		type: 'POST',
	           		url: '${path}/event/phoneCheck',
	           		dataType: 'json',
	           		data: {
	           			phone
	           		},
	           		success: (obj) => {
	           			if(obj.duplicate){
	           				$('#phoneCheck').text("이미 사용중인 휴대폰 번호입니다.").css({color: 'red', fontweight: 'bold'});
	           				$('#btnPh1').attr("disabled", true);
	           				console.log("중복검사 실패?");
	           			} else {
	           				$('#phoneCheck').text('').css({color: 'green', fontweight: 'bold'});
	        	            $('#btnPh1').attr("disabled", false);
	        	            console.log("중복검사 성공?");
	           			}
	           		},
	           		error: (error) => {
	           			console.log(error);
	           		}
	           	});
	           
	        } else {
	            $('#phoneCheck').text("휴대폰 번호를 '-'없이 숫자만 입력해주세요.").css({color: 'red', fontweight: 'bold'});
				$('#btnPh1').attr("disabled", true);
	        }
        });
        
    // 휴대폰 번호 인증 	
	//휴대폰 번호인증
		var code2 = "";
		$("#btnPh1").click(function(){
		    var phone = $("#phone").val();
		    $.ajax({
		        type:"POST",				// post 형식으로 발송
		        url:"sendSMS", 			// controller 위치
		        data: {phoneNumber:phone},	// 전송할 데이터값
		        cache : false,
		        success:function(data){
		            if(data == "error"){	//실패시 
		                alert("휴대폰 번호가 올바르지 않습니다.")
		            }else{           		//성공시        
		                alert("인증 번호가 발송되었습니다. 휴대폰에서 인증번호를 확인해주십시오.")
		                $('#btnPh2').attr("disabled", false);	
		            
		                code2 = data; 		// 성공하면 데이터저장
		            }
		        }
		    });
		});
  	//휴대폰 인증번호 대조
		$("#btnPh2").click(function(){
		    if($("#verification-code").val() == code2){ // 위에서 저장한값을 비교
		        alert('인증되었습니다.')
		        $('#btnPh1').attr("disabled", true);
		        $('#btnPh2').attr("disabled", true);
		        $('#verification-code').attr("disabled", true);
		        $('#phoneCheck').text("전화번호 인증이 완료되었습니다.").css({color: 'green', fontweight: 'bold'});
		    }else{
		        alert('인증을 실패하였습니다.')
		        $('#phoneCheck').text("전화번호 인증을 완료하지 못했습니다. 다시 시도해주세요.").css({color: 'red', fontweight: 'bold'});
		    }
		});
  	
    }); /* 도큐먼트레디함수마무리 */

	    // 제출 유효성 검사
	    function check(){
	    	
	    	var inval_Arr = new Array(10).fill(false);
	
	       	//아이디 체크
	       	if(document.getElementById("idCheck").style.color === 'red'){
	       		document.getElementById("idCheck").focus();
	   	        inval_Arr[0] = false;
	       	} else {
	       		inval_Arr[0] = true;
	       	}    
	
	       	// 비밀번호 체크
	 	   	if(document.getElementById("pwdCheck").style.color === 'red'){
	   	        inval_Arr[1] = false;
	   	    } else {
	   	    	inval_Arr[1] = true;    	
	   	    }
	   	    	
	   	    // 비번 일치 체크	
	       	if(document.getElementById("conPwdCheck").style.color === 'red'){
	   	        inval_Arr[2] = false;
	   	    } else {
	   	    	inval_Arr[2] = true;	    	
	   	    }
	    	    	
	   	    // 이름 체크	
	       	if(document.getElementById("nameCheck").style.color === 'red'){
	   	        inval_Arr[3] = false;
	   	    } else {
	   	    	inval_Arr[3] = true;
	   	    }
	   	    	
	   	    // 생년월일 체크	
	       	if(document.getElementById("birthCheck").style.color === 'red'){
	           	inval_Arr[4] = false;
	   	    } else {
	   	    	inval_Arr[4] = true; 	
	   	    }
	   	    	
	   	    // 이메일 체크	
	       	if(document.getElementById("emailCheck").style.color === 'red'){
	   	        inval_Arr[5] = false;
	   	    } else {
	   	    	inval_Arr[5] = true;	    	
	   	    }
	   	    	
	   	    // 폰 정규식 체크	
	       	if(document.getElementById("phoneCheck").style.color === 'red'){
	   	        inval_Arr[6] = false;
	   	    } else {
	   	    	inval_Arr[6] = true;	    	
	   	    }
	   	    	
	   	   	// 폰 인증 체크	
			if(!document.getElementById("verification-code").disabled){
	   	        inval_Arr[7] = false;
	   	    } else {
	   	    	inval_Arr[7] = true;
	   	    }
	   	    	
	   	    // 주소 체크	
	       	if((document.getElementById("sample6_postcode").value === null || document.getElementById("sample6_postcode").value === '')
	           || (document.getElementById("sample6_address").value === null || document.getElementById("sample6_address").value === '')){
	           	inval_Arr[8] = false;
	   	    } else {
	   	    	inval_Arr[8] = true;
	   	    }
	   	    
	   	    // 필수약관 체크
	       	if(!document.getElementById("essential-agreement").checked){
	   	        inval_Arr[9] = false;
	   	    } else {
	   	    	inval_Arr[9] = true;
	   	    }
	   	    	
	       	let validAll = true;
	       	for(let i = 0; i < inval_Arr.length; i++){
	       	  if(inval_Arr[i] === false){
	       	    validAll = false;
	       	  }
	       	}
	
	       	if(validAll){
	       	  return true;
	       	} else {
	       	  alert('입력한 정보들을 다시 한 번 확인해주세요.');
	       	  return false;
	       	}
	    }
	    

        // 약관 동의 전체 체크 기능
        function checkAll() {
            var checkboxes = document.getElementsByClassName("form-check-input");
            var checkAllCheckbox = document.getElementById("check-all");
            
            for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = checkAllCheckbox.checked;
            }
        }

        // 약관 동의 본문 보기 아코디언 기능
        function showEssentialAgreement(event) {
            var cont = document.getElementById("essential-agreement-content");
            if (cont.style.display === "block") {
                cont.style.display = "none";
            } else {
                cont.style.display = "block";
            }
        }
        function showOptionalAgreement(event) {
            var cont = document.getElementById("optional-agreement-content");
            if (cont.style.display === "block") {
                cont.style.display = "none";
            } else {
                cont.style.display = "block";
            }
        }

        // 주소 api
        function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
        }
    </script>

    <!-- 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- Bootstrap jQuery, JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" ></script>
<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>