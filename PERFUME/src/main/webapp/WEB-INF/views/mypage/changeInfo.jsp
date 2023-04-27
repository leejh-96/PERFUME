<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta name="_csrf" content="${_csrf.token}">
	<meta charset="utf-8">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<title>마이페이지 회원정보수정</title>
    <!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <style>
        a {
            text-decoration: none;
        }
        a:link {
            color: black;
        }
        a:visited {
            color: black;
        }
        table {
            table-layout: fixed;
        }
        table tbody tr {
            line-height: 3rem;
            table-layout: fixed;
            word-break: keep-all;
        }
        input {
        	margin: 10px 0px 10px 0px;
        }
    </style>
</head>
<body>
	<%@ include file="../planning/header.jsp" %>
	<div class="container mt-5" style="min-width: 1200px">
		<div class="row">
			<%@ include file="mypageMenu.jsp" %>
            <div class="col">
            	<%@ include file="quickMenu.jsp" %>
                <div>
                    <h5><b>회원정보변경</b></h5>
                </div>
                <table class="table">
                    <tbody class="table-group-divider">
                        <tr>
                            <th class="col-2">아이디(이메일)</th>
                            <td>${memberDTO.memberId}</td>
                        </tr>
                        <tr>
                            <th class="col-2">이름</th>
                            <td>${memberDTO.name}</td>
                        </tr>
                        <tr>
                            <th class="col-2">성별</th>
                            <td>
                            	<c:choose>
                            		<c:when test="${memberDTO.gender eq '남'}">
	                           			<label><input type="radio" name="gender" value="남자" checked>&nbsp;남자</label>
	                                	&nbsp;
	                                	<label><input type="radio" name="gender" value="여자">&nbsp;여자</label>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<label><input type="radio" name="gender" value="남자">&nbsp;남자</label>
	                                	&nbsp;
	                                	<label><input type="radio" name="gender" value="여자" checked>&nbsp;여자</label>
	                            	</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="col-2">생년월일</th>
                            <td>
                                <select id="years">
                                	<c:forEach var="year" begin="1950" end="2030">
                                		<c:choose>
                                			<c:when test="${birthYear eq year}">
                                				<option value="${birthYear}" selected>${birthYear}</option>
                                			</c:when>
                                			<c:otherwise>
                                				<option value="${year}">${year}</option>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </select>
                                <select id="months">
                                	<c:forEach var="month" begin="1" end="12">
                                		<c:choose>
                                			<c:when test="${birthMonth eq month}">
                                				<option value="${birthMonth}" selected>${birthMonth}</option>
                                			</c:when>
                                			<c:otherwise>
                                				<c:choose>
                                					<c:when test="${month < 10}">
                                						<option value="0${month}">0${month}</option>
                                					</c:when>
                                					<c:otherwise>
                                						<option value="${month}">${month}</option>
                                					</c:otherwise>
                                				</c:choose>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </select>
                                <select id="days">
                                	<c:forEach var="day" begin="1" end="31">
                                		<c:choose>
                                			<c:when test="${birthDay eq day}">
                                				<option value="${birthDay}" selected>${birthDay}</option>
                                			</c:when>
                                			<c:otherwise>
                                				<c:choose>
                                					<c:when test="${day < 10}">
                                						<option value="0${day}">0${day}</option>
                                					</c:when>
                                					<c:otherwise>
                                						<option value="${day}">${day}</option>
                                					</c:otherwise>
                                				</c:choose>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="col-2">휴대폰 번호</th>
                            <td>${memberDTO.phone}</td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <h5><b>비밀번호확인</b></h5>
                </div>
                <table class="table">
                    <tbody class="table-group-divider">
                        <tr>
                            <th class="col-2 table-active" style="text-align: center;">비밀번호확인</th>
                            <td><input type="password" class="form-control form-control-sm ms-2" id="userPassword" maxlength="16" style="width:200px; height:25px"/></td>
                        </tr>
                    </tbody>
                </table>
                <div align="center">
                    <button type="button" class="btn btn-dark" onclick="changeInfo()">변경</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/mypage/confirmPassword/${type}'">취소</button>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../planning/footer.jsp" %>
</body>
<script type="text/javascript">
	function changeInfo() {
		let formData = new FormData();
		formData.append("birthDate", $("#years :selected").val()+'-'+$("#months :selected").val()+'-'+$("#days :selected").val());
		formData.append("gender", $('input[name="gender"]:checked').val());
		formData.append("userPassword", $("#userPassword").val());
		
		let token = $("meta[name='_csrf']").attr("content");
	    let header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			url : "${path}/mypage/changeInfo",
			type : "POST",
			processData : false,
			contentType : false,
			data : formData,
			beforeSend : function(xhr) {
	            xhr.setRequestHeader(header, token);
	        },
	        success:function(result) {
	        	if(result==1) window.location.href = "${path}/mypage";
	        	else if(result==2) alert('비밀번호가 일치하지 않습니다.');
	        	else alert("서버에서 문제가 발생했습니다.");
	        },
			error:function(xhr, status, error) {
				var errorResponse = JSON.parse(xhr.responseText);
				var errorCode = errorResponse.code;
				var message = errorResponse.message;
				alert(message);
			}
		});
	});
</script>
</html>