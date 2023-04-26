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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <title>비밀번호 찾기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
	<h2>비밀번호 찾기</h2>
	<h3>회원가입 시 등록한 회원정보를 통해 임시 비밀번호를 발급받을 수 있습니다.</h3>
	<form action="${ path }/planning/findPwdResult" id="findPwdForm" method="POST">
		<h4>등록된 회원 정보로 찾기</h4>
		<p>회원 가입 시 등록한 정보를 정확히 입력해주세요.</p>
		<!-- 이름 -->
		<p>
			<label for="userName">
				<input type="text" placeholder="이름" name="userName" id="userName" required>
			</label>
		</p>
		<!-- 아이디 -->
		<p>
			<label for="userId">
				<input type="text" placeholder="아이디" name="userId" id="userId" required>
			</label>
		</p>
		<!-- 이메일 -->
		<p>
			<label for="userEmail">
				<input type="email" placeholder="이메일" name="userEmail" id="userEmail" required>
			</label>
		</p>
		<!-- 비밀번호 찾기 -->
		<p>
			<button type="submit">비밀번호 찾기</button>
		</p>
	</form>
	

	<p>위 방법으로 비밀번호를 찾을수 없는 경우 <a href="#">고객센터</a>에 문의해주세요.</p>
	
	<button type="button" onclick="location.href='${ path }/planning/findId';">자매품 : 아이디 찾기</button>
</body>
</html>