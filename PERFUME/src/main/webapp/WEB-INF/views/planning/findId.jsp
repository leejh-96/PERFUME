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
    <title>아이디 찾기</title>
</head>
<body>
	<h2>아이디 찾기</h2>
	<h3>회원가입 시 등록한 이메일을 통해 아이디를 찾을 수 있습니다.</h3>
	<form action="#" name="find-id-info" id="find-id-info" method="post">
		<h4>등록한 이메일 정보로 아이디 찾기</h4>
		<p>회원 가입 시 등록한 이메일 정보를 정확히 입력해주세요.</p>
		<!-- 이메일 -->
		<p>
			<label for="user-email">
				<input type="email" placeholder="가입 시 등록한 이메일을 입력해주세요." size="30" name="userEmail" id="userEmail" required>
			</label>
		</p>
		</p>
		<!-- 아이디 찾기 -->
		<p>
			<button type="submit">아이디 찾기</button>
		</p>
	</form>
	<p>위 방법으로 아이디를 찾을수 없는 경우 <a href="#">고객센터</a>에 문의해주세요.</p>
</body>
</html>