<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eventWrite</title>

   	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	    
	<!-- 썸머노트CDN방식 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
   
	<!-- CSS -->
	<link rel="stylesheet" href="${ path }/css/event/eventUpdate.css">
</head>
<body>

    <section>
        <h2 align="center">EVENT</h2>
        <div id="boardListTable">
            <form action="${ path }/event/eventUpdate" method="POST">
            	<input type="hidden" name="no" value="${ board.BNo }">
                <table id="boardList" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="titleTable" scope="col" colspan="2">제목</th>
                            <td class="contentTable" scope="col" colspan="2">
                            	<input name="bTitle" class="input" type="text" placeholder="제목을 입력하세요" value="${ board.BTitle }" required>
                            </td>
                        </tr>
                        <tr>
                            <th class="titleTable" colspan="2">작성자</th>
                            <td class="contentTable" colspan="2"><input type="text" id="writer" name="writer" class="input" value="${ loginMember.id }" readonly></td>
                        </tr>                       
                        <tr>
                            <td id="contentBody"colspan="4">
	                            <textarea id="summernote" name="bContent" rows="15" cols="50" required>${ board.BContent }</textarea>
                            </td>
                        </tr>    
                    </thead>
                    <tfoot>
                        <tr>
                            <td class="btnTd" colspan="4" align="center">
                                <div id="btnDiv" class="btn-group" role="group" aria-label="Basic example">
                                    <button id="btnList" type="button" class="btn btn-secondary"
                                    		onclick="location.replace('${path}/eventList')" >목록</button>
                                    <input id="btnSubmit" type="submit" class="btn btn-secondary" value="수정">
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
	/* .ready()  >  제이쿼리에서 사용하는 자바스크립트의 onload와 같은 기능을 하는 메소드 */
 	$(document).ready(function() {
			
		/* 썸머노트 */
	    var toolbar = [
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
        ];

 	    var setting = {
 	            height : 500,
 	            minHeight : null,
 	            maxHeight : null,
 	            focus : true,
 	            lang : 'ko-KR',
 	            placeholder: '내용을 입력해주세요.',
 	            toolbar : toolbar,
 	            // 추가한 글꼴
 	            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 			    // 추가한 폰트사이즈
 	            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
 	            // 콜백함수
 	            callbacks : { 	//여기 부분이 이미지를 첨부하는 부분
 	                            // onImageUpload 함수 : 이미지를 업로드했을 때 동작하는 함수
 	                            onImageUpload : function(files, editor, welEditable) {
 	                                // 파일 업로드(다중 업로드를 위해 반복문 사용)
 	                                for (var i = files.length - 1; i >= 0; i--) {
 	                                    sendFile(files[i],this);
 	                                }
 	                            }
 	            }
 	    };

 	    $('#summernote').summernote(setting);

 	    // 자바스크립트 함수를 통해 ajax로 서버에서 파일 업로드 진행. 서버에서 기대하는 값 : 파일 업로드 성공 후 파일 경로를 return
 	    function sendFile(file, el){			// 함수의 인수 file, summernote의 엘리먼트(el)      
 	    data = new FormData();			// FormData 객체 생성
 	            data.append("file", file);		// FormData에 파일 추가
 	            $.ajax({
 	            	dataType: 'json',
 	                data: data,													// ajax요청에 FormData 객체 전달
 	                type: "POST",												// ajax 요청의 HTTP 메소드를 POST로 설정
 	                url: "uploadSummernoteImageFile",							// AJAX요청을 보낼 URL
 	                contentType: false,											// 전송되는 데이터 유형 설정
 	                enctype: 'multipart/form-data',								// 폼 데이터가 파일 업로드를 포함하는경우 enctype 설정
 	                processData: false,											// 데이터를 처리하지 않도록 설정
 	                success: function(obj) {									// ajax요청이 성공하면 실행될 콜백 함수 정의, data 
 	                        $(el).summernote('editor.insertImage', obj.url);	// Summernote의 엘리먼트 el에 이미지를 삽입
// 	                		console.log('되는거니.... 들어왔니...');
// 	                		console.log(obj.url);
 	                }

 	            });
 	    }
 	    
 	});
	</script>

	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>