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
	<title>eventSearch</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<!-- CSS -->
	<link rel="stylesheet" href="${ path }/css/event/eventSearch.css">
	<!-- jQuery -->
	<script src="${ path }/js/jquery-3.6.3.js"></script>
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
			<div id="searchResult" style="margin-left: 10%;">[ ${ searchType } ]에서 [ ${ searchKeyword } ]을(를) 검색하신 결과입니다.</div>
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
							<td colspan="3" style="text-align: center; height: 300px; vertical-align: middle;">
								<h4>조회된 게시글이 없습니다.</h4>
							</td>
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
				<button id="btnList" type="button" class="btn btn-secondary"
        		onclick="location.href='${ path }/eventList'">최신목록</button>			
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
					onclick="location.href='${ path }/eventSearch?page=1&searchType=${ searchType }&searchKeyword=${ searchKeyword }'">&laquo;</button>
				<!-- 이전 페이지로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=${ pageInfo.prevPage }&searchType=${ searchType }&searchKeyword=${ searchKeyword }'">&lsaquo;</button>
				<!-- 5개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button class="btn btn-outline-secondary" disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-secondary"
								onclick="location.href='${ path }/eventSearch?page=${ status.current }&searchType=${ searchType }&searchKeyword=${ searchKeyword }'">${ status.current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=${ pageInfo.nextPage }&searchType=${ searchType }&searchKeyword=${ searchKeyword }'">&rsaquo;</button>
				<!-- 맨 끝으로 -->
				<button type="button" class="btn btn-outline-secondary"
					onclick="location.href='${ path }/eventSearch?page=${ pageInfo.maxPage }&searchType=${ searchType }&searchKeyword=${ searchKeyword }'">&raquo;</button>
			</div>
		</div>
	</section>

	<!-- Bootstrap jQuery, JS -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<jsp:include page="/WEB-INF/views/planning/footer.jsp" />