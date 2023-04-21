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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<style>
    h2{
        margin-top: 50px;
        margin-bottom: 60px;
    }
    section{
        width: 1200px;
        height: auto;
        margin-left: auto;
        margin-right: auto;
    }
    body{
        background-color: #f6f6f2;
    }

    #boardList{
        color:dimgray;
        width: 80%;
        margin-left: auto;
        margin-right: auto;
    }
    #boardList * {
        pointer-events: none;
    }

    #boardList .titleTable{
        background-color: rgb(228, 228, 228);
        text-align: center;
        width: 20%;
    }
    #boardList .contentTable{
        width: 80%;
        padding-left: 4%;
    }

    #boardList #dateTitle{
        width: 8%;
        text-align: center;
    }
    #boakrdList #dateContent{
        width: 8%;
        text-align: center;
    }
    #boardList #countTitle{
        width: 8%;
        text-align: center;
    }
    #boakrdList #countContent{
        width: 8%;
        text-align: center;
    }
    #contentTable{
        text-align: center;
        margin: 30%;
        padding: 5%;
    }

/* 목록 버튼 */
    #btnList {
        background-color: rgb(120, 116, 100);
        border-color: rgb(120, 116, 100);
        margin-left: 10%;
    }
    #btnList:hover {
        background-color: rgb(90, 98, 104);
        border-color: rgb(90, 98, 104);
    }
    #btnUpdate, #btnDelete {
        background-color: rgb(120, 116, 100);
        border-color: rgb(120, 116, 100);
    }
    #btnUpdate:hover, #btnDelete:hover {
        background-color: rgb(90, 98, 104);
        border-color: rgb(90, 98, 104);
    }

/* 게시물 내 a태그 버튼 형식으로 변경 */
	 #contentTable a:link, #contentTable a:visited {
     background-color: rgb(120, 116, 100);
     color: maroon;
     padding: 15px 25px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
	}
	 #contentTable a:hover, #contentTable a:active {
	     background-color: rgb(90, 98, 104);
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
                    <td class="contentTable" colspan="2">기간<%-- ${ 베네핏 테이블에서 값 가져오기 } --%></td>
                </tr>
                <tr>
                    <td id="dateTitle">작성일</td>
                    <td id="dateContent">
                    	<fmt:formatDate type="date" value="${ board.BCreateDate }" />
                    </td>
                    <td id="countTitle">조회수</td>
                    <td id="countContent">${ board.BCount }</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td id="contentTable"colspan="4">${ board.BContent }</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th class="titleTable" colspan="2">이전글</th>
                    <td class="contentTable" colspan="2">이전글 제목</td>
                </tr>
                <tr>
                    <th class="titleTable" colspan="2">다음글</th>
                    <td class="contentTable" colspan="2">다음글 제목</td>
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











    <!-- Bootstrap jQuery, JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>