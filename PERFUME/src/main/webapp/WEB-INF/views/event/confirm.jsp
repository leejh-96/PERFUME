<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	// 이벤트 참여할 때 약관 동의 비동의	
		if (confirm('${ msg }')) {
		  window.location.href = '${ pageContext.request.contextPath }${locationAgr}'; 	  // 선택약관 Y로 변경 동의시 이동할 url
		} else {
		  window.location.href = '${ pageContext.request.contextPath }${locationNotAgr}'; // 선택약관 Y로 변경 동의하지 않을시 이동할 url
		}
	</script>
</body>
</html>