<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boardList</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        h2{
            margin-top: 50px;
        }
        section{
            width: 1200px;
            height: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        thead{
            background-color: rgb(228, 228, 228);
        }

        body{
            background-color: #f6f6f2;
        }
        #boardList{
            color:dimgray;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }
        #writeButton{
            float: right;
            margin-right: 5%;
        }
        #writeButton button:hover{
            background-color: rgb(120, 116, 100);
            border-color: rgb(120, 116, 100);
        }

        #searchBar{
            width: 30%;
            margin-left: auto;
            margin-right: auto;
        }
        input[type="submit"] {
            background-color: rgb(120, 116, 100);
            border-color: rgb(120, 116, 100);
        }

        #pageBar{
            width: 30%;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        #pageBar button:hover{
            background-color: rgb(120, 116, 100);
            border-color: rgb(120, 116, 100);
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
    <section>
        <h2 align="center">EVENT</h2>
        <div id="boardListTable">
            <div id="writeButton">    
                <button type="button" class="btn btn-outline-secondary btn-sm">글쓰기</button>
                <button type="button" class="btn btn-outline-secondary btn-sm">쿠폰등록</button>
            </div>
            <br><br>
            <table id="boardList" class="table table-hover">
                <thead>
                    <tr>
                        <th class="" scope="col">번호</th>
                        <th class="" scope="col">제목</th>
                        <th class="" scope="col">등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="">1</td>
                        <td class="">제목</td>
                        <td class="">날짜</td>
                    </tr>
                    <tr>
                        <td class="">2</td>
                        <td class="">Jacob</td>
                        <td class="">Thornton</td>
                    </tr>
                    <tr>
                        <td class="" scope="row">3</td>
                        <td class="">Larry the Bird</td>
                        <td class="">@twitter</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="searchNpage">
            <form action="GET">
                <div id="searchBar" class="input-group input-group-sm">
                    <select class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
                        <option selected>검색 설정</option>
                        <option value="1">제목</option>
                        <option value="2">내용</option>
                        <option value="3">제목+내용</option>
                    </select>
                    <input type="text" class="input-group-append" placeholder="내용을 입력해 주세요.">
                    <div class="input-group-append">
                        <input class="btn btn-secondary" type="submit" value="검색" />
                    </div>
                </div>
            </form>
            <div id="pageBar">
                <button type="button" class="btn btn-outline-secondary">&laquo;</button>
                <button type="button" class="btn btn-outline-secondary">&lsaquo;</button>
                <button type="button" class="btn btn-outline-secondary">1</button>
                <button type="button" class="btn btn-outline-secondary">2</button>
                <button type="button" class="btn btn-outline-secondary">3</button>
                <button type="button" class="btn btn-outline-secondary">4</button>
                <button type="button" class="btn btn-outline-secondary">5</button>
                <button type="button" class="btn btn-outline-secondary">&rsaquo;</button>
                <button type="button" class="btn btn-outline-secondary">&raquo;</button>
            </div>
        </div>
    </section>
    











    <!-- Bootstrap jQuery, JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>