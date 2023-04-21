<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>eventList</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
h2 {
	margin-top: 50px;
}

section {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

thead {
	background-color: rgb(228, 228, 228);
}

body {
	background-color: #f6f6f2;
}
.noTable{
	width: 15%;
	text-align: center;
}
.titleTable{
	width: 60%;
}
.dateTable{
	width: 25%;
	text-align: center;	
}
#titleAtag{
	color: inherit;
 	text-decoration: none;
}
#boardList {
	color: dimgray;
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

#writeButton {
	float: right;
	margin-right: 5%;
}

#writeButton button:hover {
	background-color: rgb(120, 116, 100);
	border-color: rgb(120, 116, 100);
}

#searchNpage {
	margin-bottom : 5%;
}

#searchBar {
	width: 30%;
	margin-left: auto;
	margin-right: auto;
}

input[type="submit"] {
	background-color: rgb(120, 116, 100);
	border-color: rgb(120, 116, 100);
}

#pageBar {
	width: 30%;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

#pageBar button:hover {
	background-color: rgb(120, 116, 100);
	border-color: rgb(120, 116, 100);
}
#pageBar button:disabled{
	background-color: rgb(120, 116, 100);
	border-color: rgb(120, 116, 100);
	color: white;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp" />
	<section>
		<h2 align="center">EVENT</h2>
		<div id="boardListTable">
			<div id="writeButton">
				<c:if test="${ not empty loginMember && loginMember.division == '1' }">
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="location.href='${ path }/event/eventWrite'">글쓰기</button>
					<button type="button" class="btn btn-outline-secondary btn-sm">쿠폰등록</button>
				</c:if>
			</div>
			<br>
			<br>
			<table id="boardList" class="table table-hover">
				<thead>
					<tr>
						<th class="noTable" scope="col">번호</th>
						<th class="titleTable" scope="col">제목</th>
						<th class="dateTable" scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="3" style="text-align: center; height: 300px; vertical-align: middle;"><h4>조회된 게시글이 없습니다.</h4></td>
						</tr>
					</c:if>
					<c:if test="${ not empty list }">
						<c:forEach var="event" items="${ list }">
							<tr>
								<td class="noTable">${ event.BNo }</td>
								<td class="titleTable">
		                        	<a id="titleAtag" href="${ path }/event/eventView?no=${ event.BNo }">
		                        		${ event.BTitle }
		                        	</a>
								</td>
								<td class="dateTable">
									<fmt:formatDate type="date" value="${ event.BCreateDate }" />
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div id="searchNpage">
			<form name="memberJoinFrm" action="${ path }/eventSearch" method="GET">
				<div id="searchBar" class="input-group input-group-sm">
					<select name="searchType" class="custom-select" id="inputGroupSelect04"
						aria-label="Example select with button addon">
						<option value="1" selected>제목</option>
						<option value="2">내용</option>
						<option value="3">제목+내용</option>
					</select>
					<input type="text" name="searchKeyword" class="input-group-append" placeholder="검색어를 입력해주세요.">
					<div class="input-group-append">
						<input class="btn btn-secondary" type="submit" value="검색" />
					</div>
				</div>
			</form>
			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=1'">&laquo;</button>
				<!-- 이전 페이지로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=${ pageInfo.prevPage }'">&lsaquo;</button>
				<!-- 5개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button class="btn btn-outline-secondary" disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-secondary"
								onclick="location.href='${ path }/eventSearch?page=${ status.current }'">${ status.current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=${ pageInfo.nextPage }'">&rsaquo;</button>
				<!-- 맨 끝으로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=${ pageInfo.maxPage }'">&raquo;</button>
			</div>
		</div>
	</section>




	<!-- Bootstrap jQuery, JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<jsp:include page="/WEB-INF/views/planning/footer.jsp" />