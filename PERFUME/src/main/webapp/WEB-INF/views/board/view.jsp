<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
	<script src="${ path }/js/jquery-3.6.3.js"></script>
	
<style type="text/css">
	body{
		     background-color: #f6f6f2;
		 }
 	div#board-write-container{width:900px; margin:0 auto; text-align:center;}
    table#tbl-board{width:800px; margin:0 auto;/*  border:1px solid black; */ border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; /* border:1px solid;  */padding: 5px 0; text-align:center;} 
    table#tbl-board td {/* border:1px solid;  */padding: 5px 0 5px 10px; text-align:left;}
    div#comment-container button#btn-insert{width:60px;height:50px; color:white; background-color:#3300FF;position:relative;top:-20px;}
</style>
</head>
<body>
	<h2 style="text-align: center;">공지사항</h2>
	<br><br><br>
	
	<section id="content">   
		<div id="board-write-container">
			<table id="tbl-board" class="table">
				<tr>
					<th>글번호</th>
					<td>${ board.BNo }</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>${ board.BTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ board.writerId }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${ board.BCount }</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>${ board.BContent }</td>
				</tr>
				<%--글작성자/관리자인경우 수정삭제 가능 --%>
				<tr>
					<th colspan="2">
						<c:if test="${ not empty loginMember && loginMember.division == 1 }">
							<button type="button" onclick="location.href='${ path }/board/update?no=${ board.BNo }'">수정</button>
							<button type="button" id="btnDelete">삭제</button>
						</c:if>
						<button type="button" onclick="location.href='${ path }/board/list'">목록으로</button>
					</th>
				</tr>
			</table>
	    </div>
	</section>
	
	<!-- Bootstrap jQuery, JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	
	<script>
		$(document).ready(() => {
			$('#btnDelete').on('click', () => {
				if(confirm('정말로 게시글을 삭제 하시겠습니까?')) {
					location.replace('${ path }/board/delete?no=${ board.BNo }');
				}
			});
		
		});
	</script>
<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>	
</body>
</html>