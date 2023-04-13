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
    <title>BoardWrite</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <!-- Bootstrap jQuery, JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
  
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
        /* #boardList * {
            pointer-events: none;
        } */

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
        #contentBody{
            text-align: center;
            margin: 30%;
            padding: 0%;
        }
        .input {
            width:100%;
            height: 100%;
            border: none;
            background-color: transparent;
        }

    /* 목록 버튼 */
        #btnList, #btnSubmit, #btnReset {
            background-color: rgb(120, 116, 100);
            border-color: rgb(120, 116, 100);
        }
        #btnList:hover, #btnSubmit:hover, #btnReset:hover {
            background-color: rgb(90, 98, 104);
            border-color: rgb(90, 98, 104);
        }
    </style>
</head>
<body>
    <section>
        <h2 align="center">EVENT</h2>
        <div id="boardListTable">
            <form action="#" method="POST">
                <table id="boardList" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="titleTable" scope="col" colspan="2">제목</th>
                            <td class="contentTable" scope="col" colspan="2"><input class="input" type="text" placeholder="제목을 입력하세요" required><input class="input" type="text" hidden></td>
                        </tr>
                        <tr>
                            <th class="titleTable" colspan="2">작성자</th>
                            <td class="contentTable" colspan="2">작성자 아이디</td>
                        </tr>                       
                        <tr>
                            <td id="contentBody"colspan="4">
	                            <textarea id="summernote" name="content" rows="1" cols="1"></textarea>
                            </td>
                        </tr>    
                    </thead>
                    <tfoot>
                        <tr>
                            <td class="btnTd" colspan="4" align="center">
                                <div id="btnDiv" class="btn-group" role="group" aria-label="Basic example">
                                    <button id="btnList" type="button" class="btn btn-secondary">목록</button>
                                    <input id="btnSubmit" type="submit" class="btn btn-secondary" value="등록">
                                    <input id="btnReset" type="reset" class="btn btn-secondary" value="취소">
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </form>
            
        </div>
    </section>

	<script>
		/* .ready()    제이쿼리에서 사용하는 자바스크립트의 onload와 같은 기능을 하는 메소드 */
 		$(document).ready(function() {
			
		/* 썸머노트 */
 			$('#summernote').summernote({
 				// 에디터 높이
				 height: 500,
				 // 에디터 한글 설정
				 lang: "ko-KR",
				 // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
				 focus : true,
				 toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview','fullscreen', 'help']]
				  ],
				  // 추가한 글꼴
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				 // 추가한 폰트사이즈
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			});
 			
 		});
	</script>

	



</body>
</html>