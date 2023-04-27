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
	<script src="${ path }/js/jquery-3.6.3.js"></script>
	
<style type="text/css">
	body{
		     background-color: #f6f6f2;
		 }
 	div#board-write-container{width:900px; margin:0 auto; text-align:center;}
    table#tbl-board{width:800px; margin:0 auto;/*  border:1px solid black; */ border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; /* border:1px solid;  */padding: 5px 0; text-align:center;} 
    table#tbl-board td {/* border:1px solid;  */padding: 5px 0 5px 10px; text-align:left;}
    div#comment-container button#btn-insert{width:60px;height:50px; color:black; background:#f6f6f2; position:relative;top:-20px;}
    
        /*댓글테이블*/
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
</style>
</head>
<body>
	<h2 style="text-align: center;">QnA</h2>
	<br><br><br>
	
	<section id="content">   
		<div id="board-write-container">
			<table id="tbl-board" class="table">
				<tr>
					<th>글번호</th>
					<td>${ board.no }</td>
				</tr>
				<tr>
					<th>제 목</th>
					<td>${ board.title }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ board.writerId }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${ board.readCount }</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>${ board.content }</td>
				</tr>
				<%--글작성자/관리자인경우 수정삭제 가능 --%>
				<tr>
					<th colspan="2">
						<c:if test="${ not empty loginMember && loginMember.id == board.writerId }">
							
							<button type="button" onclick="location.href='${ path }/qnaBoard/update?no=${ board.no }'">수정</button>
							<button type="button" id="btnDelete">삭제</button>
						</c:if>
						<button type="button" onclick="location.href='${ path }/qnaBoard/list'">목록으로</button>
					</th>
				</tr>
			</table>
			
			<br> 
			
		    <table id="tbl-comment">
		    	<c:forEach var="reply" items="${ board.replies }">
		    	   	<tr class="level1">
			    		<td>
			    			<sub class="comment-writer">${ reply.writerId }</sub>
			    			<sub class="comment-date">${ reply.createDate }</sub>
			    			<br>
			    			<span>${ reply.content }</span>
			    		</td>
			    		<td>
			    			<c:if test="${ not empty loginMember && loginMember.division == 1}">
			    				<form action="${path}/reply/delete" method="post">
				    				<input type="hidden" name="boardNo" value="${ board.no }">
				    				<input type="hidden" name="replyNo" value="${ reply.no }">
				    				
				    				<!-- <button id="replyDelete">삭제</button> -->
			    				</form>
			    			</c:if>
			    		</td>
			    	</tr>
		    	</c:forEach>
		    </table>
		    
		    <div id="comment-container">
		    	<div class="comment-editor">
		    		<form action="${ path }/board/reply" method="POST">
		    			<input type="hidden" name="boardNo" value="${ board.no }">
		    			<br>
						<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
						<button type="submit" id="btn-insert">등록</button>	    			
		    		</form>
		    	</div>
		    </div>
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
					location.replace('${ path }/qnaBoard/delete?no=${ board.no }');
				}
			});
		
		});
		
		$('#replyContent').on('focus', () => {
			if(${ empty loginMember}) {
				alert('로그인 후 이용해 주세요.')	;
				
				$('#userId').focus();
			}
		});
	</script>
</body>
</html>