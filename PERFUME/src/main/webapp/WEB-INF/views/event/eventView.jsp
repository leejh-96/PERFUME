<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardView</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
	<script src="${ path }/js/jquery-3.6.3.js"></script>
    
	<style>
    h2{ margin-top: 50px; margin-bottom: 60px; }
 	section{ width: 1200px; height: auto; margin-left: auto; margin-right: auto; }
    body{ background-color: #f6f6f2; }
    #boardList{ color:dimgray; width: 80%; margin-left: auto; margin-right: auto; }
	#boardList .titleTable{ background-color: rgb(228, 228, 228); text-align: center; width: 20%; }
    #boardList .contentTable{ width: 80%; padding-left: 4%; }
    #boardList #dateTitle{ width: 8%; text-align: center; }
    #contentTable{ text-align: center; margin: 30%; padding: 5%; }
    #preTitle:hover, #nextTitle:hover { background-color: rgb(228, 228, 224); }
    #titleAtag {color: inherit; text-decoration: none; }

/* 목록 버튼 */
    #btnList { background-color: rgb(120, 116, 100); border-color: rgb(120, 116, 100); margin-left: 10%; }
    #btnList:hover { background-color: rgb(90, 98, 104); border-color: rgb(90, 98, 104); }
    #btnUpdate, #btnDelete { background-color: rgb(120, 116, 100); border-color: rgb(120, 116, 100); }
    #btnUpdate:hover, #btnDelete:hover { background-color: rgb(90, 98, 104); border-color: rgb(90, 98, 104); }

/* 게시물 내 a태그 버튼 형식으로 변경 */	
	#contentTable a:link, #contentTable a:visited {
	  background:#e2d9b3;
	  color:#fff;
	  border:none;
	  position:relative;
	  height:60px;
	  font-size:1.6em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	  text-align: center;
      text-decoration: none;
      display: inline-block;
	}
	#contentTable a:hover, #contentTable a:active{
	  background:#fff;	/* 하얀색 */
	  color:#e2d9b3; /* 녹색 */
	}
	#contentTable a:before, #contentTable a:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #e2d9b3;
	  transition:400ms ease all;
	}
	#contentTable a:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	#contentTable a:hover:before, #contentTable a:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
<section>
    <h2 align="center">EVENT</h2>
    <div id="boardListTable">
        <table id="boardList" class="table table-hover">
            <thead>
                <tr>
                    <th class="titleTable" scope="col" colspan="2">제목</th>
                    <td class="contentTable" scope="col" colspan="2">${ board.BTitle }</td>
                </tr>
                <tr>
                    <th class="titleTable" colspan="2">기간</th>
                    <td class="contentTable" colspan="2">
                    	<c:if test="${ empty board.bnCreateDate }">
	                    	상시 진행 중인 이벤트입니다.                    	
                    	</c:if>
                    	<c:if test="${ not empty board.bnCreateDate }">
	                    	<fmt:formatDate type="date" value="${ board.bnCreateDate }" pattern="yyyy-MM-dd"/> ~ 
	                    	<fmt:formatDate type="date" value="${ board.bnEndDate }"  pattern="yyyy-MM-dd"/>                    	
                    	</c:if>
                    </td>
                </tr>
                <tr>
                    <td id="dateTitle">작성일</td>
                    <td id="dateContent">
                    	<fmt:formatDate type="date" value="${ board.BCreateDate }" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <td id="contentTable" colspan="4">${ board.BContent }</td>
                </tr>            
                <tr>
                    <th class="titleTable" colspan="2">이전글</th>                    
                    <c:if test="${ empty board.preTitle }">
                    	<td class="contentTable" id="preTitle" colspan="2">이전글이 존재하지 않습니다.</td>
                    </c:if>
                    <c:if test="${ not empty board.preTitle }">
                    	<td class="contentTable" id="preTitle" colspan="2">
                    		<a id="titleAtag" href="${ path }/event/eventView?no=${ board.preNo }">${ board.preTitle }</a>
                    	</td>
                    </c:if>
                </tr>
                <tr>
                    <th class="titleTable" colspan="2">다음글</th>
                    <c:if test="${ empty board.nextTitle }">
                    	<td class="contentTable" id="preTitle" colspan="2">다음글이 존재하지 않습니다.</td>
                    </c:if>
                    <c:if test="${ not empty board.nextTitle }">
                    	<td class="contentTable" id="preTitle" colspan="2">
                    		<a id="titleAtag" href="${ path }/event/eventView?no=${ board.nextNo }">${ board.nextTitle }</a>
                    	</td>
                    </c:if>
                </tr>
            </tfoot>
            
        </table>
        <button id="btnList" type="button" class="btn btn-secondary"
        		onclick="location.href='${ path }/eventList'">목록</button>
		<c:if test="${ not empty loginMember && loginMember.division == '1' }">
			<button id="btnUpdate" type="button" class="btn btn-secondary"
				onclick="location.href='${ path }/event/eventUpdate?no=${ board.BNo }'">수정</button>
			<button id="btnDelete" type="button" class="btn btn-secondary">삭제</button>
		</c:if>

        
    </div>
</section>

<script>
		$(document).ready(() => {
			
			$('#btnDelete').on('click', () => {
				if(confirm('정말로 게시글을 삭제 하시겠습니까?')) {
					location.replace('${ path }/eventDelete?no=${ board.BNo }');
				}
			});
		
			let bnCreateDate = new Date('<fmt:formatDate type="date" value="${ board.bnCreateDate }" pattern="yyyy-MM-dd HH:mm:ss"/>');
			let bnEndDate = new Date('<fmt:formatDate type="date" value="${ board.bnEndDate }" pattern="yyyy-MM-dd HH:mm:ss"/>');
			let today = new Date();
			
			$('#contentTable').find('a:eq(0)').on('click', () => {

				if (bnEndDate.getTime() >= today.getTime() && bnCreateDate.getTime() <= today.getTime()) {
					
					// 게시글의 앵커 태그 누를 때 현재 페이지의 값을 파라미터로 넘기기
					 let myString = "월";					// 찾을 문자열
					 let title = "${board.BTitle}";
	
					 if (title.indexOf(myString) > -1) {	// 찾을 문자열이 제목에 포함되어있는지 확인하는 코드
						  // 기본 이벤트 동작을 중단. href 속성을 변경하기 위해 앵커태그의 이벤트 중단시킴				  
						  event.preventDefault();
						  // url 다시 지정
						  var url = '${ path }/participatePresentPerfume?bNo=${ board.BNo }&bTitle=${ board.BTitle }';
						  // 새로운 URL로 이동합니다.
						  window.location.href = url;
					 } else {
						 // a태그에 연결해준 URL로 이동
						 return true;
					 }
					 
				} else {
				  alert('이벤트 참여 기간이 아닙니다.');
					return false;
				}
			});
			
			// 쿠폰 당첨용 버튼 js
			$('#contentTable').find('a:eq(1)').on('click', () => {
				if (bnEndDate.getTime() < today.getTime()) {
					alert('당첨 추첨 한다아아아앙');
					 
				} else {
				 alert('추첨 기간이 아니다아아아아앙');
				}
			});
			
		});
</script>









    <!-- Bootstrap jQuery, JS -->	
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
    
<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>