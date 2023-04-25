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
<title>관리자페이지-회원상세</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
/* 회원상세보기&&회원수정 */
table{
	text-align: center;
}
#myModal{
	z-index: 2000;
}
.tabledetail{
	margin-top :50px;
}
.buttonlist{
	text-align: center;
}
.tableback_color{
	background-color: rgb(118, 174, 135);
}
/* 회원상세보기&&회원수정 */
</style>
<script type="text/javascript">

function Inactive(memberNo,memberName){
	
	if (confirm(memberName+'님의 계정을 비활성화 하시겠습니까?')) {
		
		let adminPwd = prompt('\n\n관리자님의 비밀번호 인증이 필요한 서비스입니다.\n\n비밀번호를 입력해주세요.');
		
		console.log(adminPwd)
		
		if (adminPwd !== null) {
			
			$.ajax({
				url : '${path}/admin/adminPwdCheck',
				type : 'post',
				data : {adminPwd},
				dataType : 'json',
				success : function(result){
					if (result === true) {
						$.ajax({
							url : '${path}/admin/memberDelete',
							type : 'post',
							data : {memberNo},
							dataType : 'json',
							success : function(result){
								if (result > 0) {
									alert('회원 비활성화에 성공했습니다.')
									window.location.href='${path}/admin/memberList';
								}else {
									alert('회원 비활성화에 실패했습니다.')
									return false;
								}
							},
							error : function(error){
								alert('에러 발생')
							}
						})
					}else if (result === false) {
						alert('입력하신 비밀번호와 관리자님의 비밀번호가 일치하지 않습니다.')
						return false;
					}
				},
				error : function(error){
					alert('에러')
				}
			})
			
		}else {
			return false;
		}
	}
}

function Postcode(){
	new daum.Postcode({
         oncomplete: function(data) {
             
        	let address = data.address;
            $('#addr1').val(address);
             
         }
     }).open();
 }
/* 중복검사를 했는지 체크하는 변수 */
let idCheck = 0;
function idChecked(){
	
	let id = $('#memberId').val();
	let idpattern = new RegExp('^[a-z][a-z0-9]{3,11}$');
	
	if (idpattern.test(id)) {
		console.log('유효성검사 통과')
		$.ajax({
			url : '${path}/admin/idCheck',
			type : 'get',
			data : {id},
			dataType : 'json',
			success : function(result){
				if (result > 0) {
					alert('이미 사용중인 아이디 입니다.')
				}else if (result === 0) {
					alert('사용가능한 아이디 입니다.')
					idCheck++
					console.log(idCheck)
				}
			},
			error : function(error){
				alert(error)
			}
		})
	}else {
		alert('아이디를 지정된 형식에 맞게 올바르게 입력해주세요.')
		return false;
	}
}

function check(){
	
	let idpattern = new RegExp('^[a-z][a-z0-9]{3,11}$');
	let passwordpattern = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$");
	
	let id = $('#memberId').val();
	let pass1 = $('#pass1').val();
	let pass2 = $('#pass2').val();
	let email = $('#email').val();
	
	if (!idpattern.test(id)) {
		alert('아이디를 지정된 형식에 맞게 올바르게 입력해주세요!')
		return false;
	}else if (idCheck === 0) {
		alert('아이디 중복검사를 진행해 주세요!')
		return false;
	}
	if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pass1)) {
		alert('비밀번호를 지정된 형식에 맞게 올바르게 입력해주세요!')
		return false;
	}else {
		if (pass1 !== pass2) {
		alert("동일한 비밀번호를 입력해주세요!")
		$('#pass2').val('');
		$('#pass2').focus();
		return false;
		}else {
			let addr1 = $('#addr1').val();
			let addr2 = $('#addr2').val();
			let addr = addr1+' '+addr2;
			$('#hideenAddr').val(addr);
		}
	}
}
</script>
</head>
<body>
<div class="container" style="height: 100px;"></div>

<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

					<table class="table table-hover tabledetail">
						<thead>
							<tr class="table-warning">
                                <th colspan="2"><strong>회원상세정보</strong></th>
                            </tr>
						</thead>
                        <tbody>
                            <tr class="table-warning">
                                <th>회원번호</th>
                                <td>
                                	${member.memberNo }
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원구분</th>
                                <td>
                                	${member.memberDevision}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원가입경로</th>
                                <td>
                                	${member.memberPath}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원아이디</th>
                                <td>
                                	${member.memberId}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원이름</th>
                                <td>
                                	${member.memberName}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>생년월일</th>
                                <td>
                                	<fmt:formatDate type="date" value="${member.memberBirth}"/>
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원성별</th>
                                <c:if test="${member.gender == 'M' || member.gender == '남성' || member.gender == '남자'|| member.gender == '남'}">
	                                <td>
	                                	남성
	                                </td>
                                </c:if>
                                <c:if test="${member.gender == 'F' || member.gender == '여성' || member.gender == '여자'|| member.gender == '여'}}">
	                                <td>
	                                	여성
	                                </td>
                                </c:if>
                            </tr>
                            <tr class="table-warning">
                                <th>회원이메일</th>
                                <td>
                                	${member.memberMail}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원전화번호</th>
                                <td>
                                	${member.memberPhone}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원주소</th>
                                <td>
                                	${member.memberAddr}
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원포인트</th>
                                <td>
                                	${member.memberPoint} <span>POINT</span> 
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <th>회원생성일</th>
                                <td>
                                	<fmt:formatDate type="date" value="${member.memberCreateDate}"/>
                                </td>
                            </tr>
                         </tbody>
                     </table>
                     
                     <div class="buttonlist">
	               		<button class="btn btn-warning" data-toggle="modal" data-target="#myModal">수정하기</button>
	               		<button class="btn btn-warning" onclick="location.href='${path}/admin/memberList'">목록으로</button>
	               		<button class="btn btn-warning" onclick="Inactive('${member.memberNo}','${member.memberName}')">비활성하기</button>
               		 </div>
                     
                     <!-- The Modal -->
					  <div class="modal fade" id="myModal">
					    <div class="modal-dialog modal-xl">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">회원수정</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        <!-- Modal Header -->
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					        <form action="${path}/admin/memberUpdate" method="POST" class="form-inline w-100" onsubmit="return check();">
					        <input type="hidden" name="memberNo" value="${member.memberNo}">
		                        <table class="table">
			                        <tbody>
			                            <tr>
			                                <th colspan="3" class="tableback_color"><strong>회원상세정보</strong></th>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원번호</th>
			                                <td colspan="2">
			                                	${member.memberNo}
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원구분</th>
			                                
			                            	<c:if test="${member.memberDevision eq '2'}">    
				                                <td colspan="2">
				                                	일반회원
				                                </td>
			                            	</c:if>
			                            
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원가입경로</th>
			                                <td colspan="2">
			                                	${member.memberPath}
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원아이디</th>
			                                <td>
			                                	<input id="memberId" type="text" name="memberId" placeholder="형식: 첫글자는 반드시 영문 소문자,4~12자의 영문,소문자,숫자 입력" class="container" required="required">
			                                </td>
			                                <td><button type="button" class="btn btn-warning" onclick="idChecked()">중복검사</button></td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원비밀번호</th>
			                                <td colspan="2">
			                                	<input id="pass1" type="password" placeholder="형식: 영문자, 숫자, 특수문자 포함하여 총 8 ~ 15자로 입력" class="container" required="required">
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">비밀번호확인</th>
			                                <td colspan="2">
			                                	<input id="pass2" type="password" placeholder="형식: 영문자, 숫자, 특수문자 포함하여 총 8 ~ 15자로 입력" class="container" name="memberPwd" required="required">
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원이름</th>
			                                <td colspan="2">
			                                	${member.memberName}
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">생년월일</th>
			                                <td colspan="2">
			                                	<fmt:formatDate type="date" value="${member.memberBirth}"/>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원성별</th>
			                                <c:if test="${member.gender == 'M' || member.gender == '남성' || member.gender == '남자'|| member.gender == '남'}">
				                                <td colspan="2">
				                                	남성
				                                </td>
			                                </c:if>
			                                <c:if test="${member.gender == 'F' || member.gender == '여성' || member.gender == '여자'|| member.gender == '여'}}">
				                                <td colspan="2">
				                                	여성
				                                </td>
			                                </c:if>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원이메일</th>
			                                <td colspan="2">
			                                	<input id="email" type="email" name="memberMail" placeholder="형식: kildong@kh.com" class="container" required="required">
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원전화번호</th>
			                                <td colspan="2">
			                                	<input type="tel" name="memberPhone" placeholder="형식: - 제외한 숫자, 01000000000" class="container" required="required">
			                                </td>
			                            </tr>
			                            <tr>
						                    <th rowspan="2" class="tableback_color">
						                        회원주소
						                    </th>
						                    <td>
						                    	<input id="addr1" type="text" placeholder="도로명 주소를 입력해주세요." class="container" required>
						                    </td>
						                    <td>
						                    	<input type="button" class="btn btn-warning" onclick="Postcode()" value="우편번호 찾기">
						                    </td>
						                </tr>
						                <tr>
						                    <td colspan="3">
						                        <input id="addr2" type="text" placeholder="상세 주소를 입력해주세요." class="container" required>
						                        <input id="hideenAddr" type="hidden" name="memberAddr" value="">
						                    </td>
						                </tr>
			                            <tr>
			                                <th class="tableback_color">회원포인트</th>
			                                <td colspan="2">
			                                	${member.memberPoint} <span>POINT</span> 
			                                </td>
			                            </tr>
			                            <tr>
			                                <th class="tableback_color">회원생성일</th>
			                                <td colspan="2">
			                                	<fmt:formatDate type="date" value="${member.memberCreateDate}"/>
			                                </td>
			                            </tr>
			                         </tbody>
                     			</table>
	                           	 
                       		 	<!-- Modal footer -->
						        <div class="container buttonlist">
						          <button type="submit" class="btn btn-warning">수정하기</button>
						          <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
						        </div>
				        	 	<!-- Modal footer -->
                           	</form>
					        </div>
					        <!-- Modal body -->
					        
					      </div>
					    </div>
					  </div>
               		  <!-- The Modal -->
	
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>
	
	
<div class="container" style="height: 100px;"></div>
	
</body>
</html>