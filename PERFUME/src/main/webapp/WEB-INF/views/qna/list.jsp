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
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<style>
	
	
	 section{
           width: 1200px;
           height: 600px;
           margin-left: auto;
           margin-right: auto;
         }
     #tbl-board{
      		color:dimgray;
            width: 70%;
            height: 60%;
            margin-left: auto;
            margin-right: auto;
     }
    
	 thead{
            background-color: rgb(228, 228, 228);
        }
     body{
            background-color: #f6f6f2;
        }
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center;}
</style>

</head>
<body>
	<h2 style="text-align: center;">QnA 게시판 </h2>
	
	<section id="content">
		<div id="board-list-container">
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp;&nbsp;
			<c:if test="${ not empty loginMember }">
				<button type="button" onclick="location.href='${ path }/qnaBoard/write'">글쓰기</button>
			</c:if>
	
			<table id="tbl-board" class="table table-hover table-sm">
				<thead>
					<tr>
						<th class="th">번호</th>
						 <th class="th">구분</th>
						<th class="th">제목</th>
						<th class="th">작성자</th>
						<th class="th">등록일</th>
						<!-- <th class="th">첨부파일</th> -->
						<th class="th" style="text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${ empty list }">
					<tr>
						<td colspan="6">
							조회된 게시글이 없습니다.
						</td>
					</tr>	
				</c:if>
				<c:if test="${ not empty list }">
					<c:forEach var="board" items="${ list }">
						<tr>
							<td>${ board.no }</td>
							<td>Q&A</td>
							<td>
								<a href="${ path }/qnaBoard/view?no=${ board.no }">
									${ board.title }
								</a>
							</td>
							<td>${ board.writerId }</td>
							<td>
								<fmt:formatDate type="date" value="${ board.createDate }"/>
							</td>
							<td style="text-align: center;">${board.readCount }</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
			<div id="pageBar">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='${ path }/qnaBoard/list?page=1'">&lt;&lt;</button>
	
				<!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/qnaBoard/list?page=${ pageInfo.prevPage }'">&lt;</button>
	
				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:choose>
						<c:when test="${ status.current == pageInfo.currentPage}">
							<button disabled>${ status.current }</button>
						</c:when>
						<c:otherwise>						
							<button onclick="location.href='${ path }/qnaBoard/list?page=${ status.current }'">${ status.current }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
	
				<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/qnaBoard/list?page=${ pageInfo.nextPage }'">&gt;</button>
	
				<!-- 맨 끝으로 -->
				<button onclick="location.href='${ path }/qnaBoard/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>
		</div>
	</section>
	
	<!-- Bootstrap jQuery, JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
</body>
</html>