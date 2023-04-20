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
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
	<h2>아이디 찾기 결과</h2>
		<c:if test="${ id != null }">
		    <p>찾으시는 아이디는 <span id="partialId">${fn:substring(id, 0, 4)}</span>**** 입니다.</p>
		    <button type="button" onclick="auth()">아이디 전체보기</button>
		    <c:set var="fullId" value="${id}" scope="session"/>
		</c:if>

		<c:if test="${ id == null }">
		    <p>해당하는 아이디가 없습니다. 다시 시도해주세요.</p>
		    <p><a href="${path}/planning/findId">아이디 찾기 화면으로 돌아가기</a></p>
		</c:if>

	<script>
		function auth() {
			  var password = prompt("추가 인증을 위해 비밀번호를 입력해주세요.");
			  if (password != null) {
				  // 서버에 비밀번호 검증 요청을 보내는 코드 (예시)
				  fetch('/check-password', {
					  method: 'POST',
					  body: JSON.stringify({ password: password }),
					  headers: {
						  'Content-Type': 'application/json'
						  }
				  })
				  .then(response => {
					  if (response.ok) {
						  // 비밀번호가 맞을 때, 아이디 전체 보여주는 코드
						  document.getElementById("partialId").innerHTML = "${fullId}";
						  } else {
							  alert('비밀번호가 일치하지 않습니다.');
							  }
					  })
					  .catch(error => {
						  console.error('Error:', error);
						  });
				  }
			  }
	</script>
</body>
</html>