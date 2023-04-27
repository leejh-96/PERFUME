<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Perfume</title>
    <!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- bootstrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- bootstrap js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/dist/jquery.js' />"></script>
	<style>
		<%@ include file="/resources/css/mypage/myreview.css" %>
        a {
            text-decoration: none;
        }
        a:link {
            color: black;
        }
        a:visited {
            color: black;
        }
	    .bundle {
	        width: 25%;
	        height: 25%;
	    }
	</style>
	<script type="text/javascript">
		$(document).ready(function () {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			console.log(token);
			console.log(header);
			
			$('#deleteBtn').on("click", function() { // 상품평 삭제
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				
				var reviewID = $("#reviewID").val(); // 삭제할 상품 번호
			    
				var data = {
					"reviewID" : reviewID
				};
				
				if (confirm("상품평을 삭제하시겠습니까?")) {
            		$.ajax({
        	            url: "${path}/category/1/api/deleteReview",
        	            type: "POST",
        	            data: data,
        	            beforeSend : function(xhr) {
            				xhr.setRequestHeader(header, token);
            			},
        	            success : function(result){
        	            	if (result) {
        	            		alert("상품평이 삭제되었습니다.");
        		                location.reload();
        	            	}
        	            },error : function(xhr, status, error) {
            				var errorResponse = JSON.parse(xhr.responseText);
            				var errorCode = errorResponse.code;
            				var message = errorResponse.message;
            				alert(message);
            			}
        	        });	
        		} else {
        			return;
        		}
			});
			
			function show () {
				document.querySelector(".modal-background").className = "modal-background show";
			}
	
			function close () { 
				document.querySelector(".modal-background").className = "modal-background";
			}
			
            $(document).on("click", "#editBtn", function(){
                var content = $(this).data("content"); // 작성한 상품평 내용
				var reviewID = $(this).data("reviewid"); // 작성한 상품평 번호
				$("#content").val(content);
				$("#reviewID").val(reviewID);
				$(".write-review-content").val(content);
			    
				$.getJSON("${path}/category/1/getAttachList", {reviewID : reviewID}, function(arr){
					console.log(arr);
					var str = "";
					$(arr).each(function(i, obj){
	        			str += "<li data-imagepath='"+obj.imagePath+"'";
	    				str += " data-imagename='"+obj.imageName+"' ><div>";
	    				str += "<span>"+obj.imageName+"</span>";
	    				str += "<button class='imgDeleteBtn' type='button' data-imagename='"+obj.imageName+"'>X</button><br>";
	    				str += "<img src='" + obj.imagePath + "'>";
	    				str += "</div>";
	    				str += "</li>";
	        		}); 
					
					$(".uploadResult ul").html(str);
				});
				
			    show();
            });
			
			document.querySelector(".cancelBtn").addEventListener('click', close); // 모달창 닫기
			
			$('#finishBtn').on("click", function() { // 상품평 수정하기
            	var token = $("meta[name='_csrf']").attr("content");
        		var header = $("meta[name='_csrf_header']").attr("content");
        		
                var reviewID = $("#reviewID").val(); // 상품평 번호
               	var content = $(".write-review-content").val(); // 상품평 내용
               	var list = new Array();
               	
               	if (content != "") {
               		$(".uploadResult ul li").each(function(i, obj) {
            			var jobj = $(obj);
            			
            			var attachDTO = new Object();
            			attachDTO.imageName = jobj.data("imagename");
            			attachDTO.imagePath = jobj.data("imagepath");
            			list.push(attachDTO);
            		});
                   	
            		var data = {
            			reviewID : reviewID,
            			content : content,
            			attachList : list
            		};
            		
            		$.ajax({
    		            url: "${path}/category/1/api/update",
    		            type: "POST",
    		            contentType: 'application/json; charset=utf-8',
    		            data: JSON.stringify(data),
    		            beforeSend : function(xhr) {
            				xhr.setRequestHeader(header, token);
            			},
    		            success : function(result){
    		            	if (result == 1) {
    			                $(".modal").hide();
    			                alert("상품평이 수정되었습니다.");
    			                location.reload();
    		            	} else {
    		            		alert("상품평 수정 실패");
    		            	}
    		            },error : function(xhr, status, error) {
            				var errorResponse = JSON.parse(xhr.responseText);
            				var errorCode = errorResponse.code;
            				var message = errorResponse.message;
            				alert(message);
            			}
    		        });
               	} else {
               		alert("상품평을 작성해주세요.");
               	}
        	});
            
			$(".uploadResult").on("click", "button", function(e) {
            	var token = $("meta[name='_csrf']").attr("content");
        		var header = $("meta[name='_csrf_header']").attr("content");
        		
        		console.log("delete file");
        		var targetFile = $(this).data("imagename");
        		var targetLi = $(this).closest("li");
        		
        		var data = {
        			imageName : targetFile
        		};
        		
        		$.ajax({
        			url: '${path}/category/1/deleteFile',
        			data: data,
        			type: 'POST',
        			beforeSend : function(xhr) {
        				xhr.setRequestHeader(header, token);
        			},
       				success: function(result) {
       					alert("이미지가 삭제되었습니다.");
       					$("#file").val(""); // 초기화
       					targetLi.remove();
       				},error : function(xhr, status, error) {
        				var errorResponse = JSON.parse(xhr.responseText);
        				var errorCode = errorResponse.code;
        				var message = errorResponse.message;
        				alert(message);
        			}
        		});
        	});
        	
        	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        	var maxSize = 5242880;
        	
        	function checkExtension(fileName, fileSize){
        		if(fileSize >= maxSize){
        			alert("파일 사이즈 초과");
        			return false;
        		}
        		if(regex.test(fileName)){
        			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
        			return false;
        		}
        		return true;
        	}
        	
        	function showUploadResult(uploadResultArr) {
        		if(!uploadResultArr || uploadResultArr.length == 0) {return;}
        		
        		var uploadUL = $(".uploadResult ul");
        		
        		var str="";
        		
        		$(uploadResultArr).each(function(i, obj){
        			str += "<li data-imagepath='"+obj.imagePath+"'";
    				str += " data-imagename='"+obj.imageName+"' ><div>";
    				str += "<span>"+obj.imageName+"</span>";
    				str += "<button class='imgDeleteBtn' type='button' data-imagename='"+obj.imageName+"'>X</button><br>";
    				str += "<img src='" + obj.imagePath + "'>";
    				str += "</div>";
    				str += "</li>";
        		}); 
        		
        		uploadUL.append(str);
        	}
        	
        	$("input[type='file']").change(function(e){
        		var token = $("meta[name='_csrf']").attr("content");
        		var header = $("meta[name='_csrf_header']").attr("content");
        		
        		var formData = new FormData();
        		var inputFile = $("input[name='uploadFile']");
        		var files = inputFile[0].files;
        		console.log(files);
        		
        		for(var i = 0; i < files.length ; i++){
        			if(!checkExtension(files[i].imageName, files[i].size)){
        				return false;
        			}
        			formData.append("uploadFile", files[i]);
        		}
        	
        		$.ajax({
        			url: '${path}/category/1/uploadAjaxAction',
        			processData: false,
        			contentType: false,
        			data: formData,
        			beforeSend : function(xhr) {
        				xhr.setRequestHeader(header, token);
        			},
        			type: 'POST',
        			dataType: 'json',
       				success: function(result){
       					console.log(result);
        				
       					attachList = result;
       					
        				showUploadResult(result);
        			}, error : function(xhr, status, error) {
        				var errorResponse = JSON.parse(xhr.responseText);
        				var errorCode = errorResponse.code;
        				var message = errorResponse.message;
        				alert(message);
        			}
        		});
        	});
		});
	</script>
</head>
<body>
	<%@ include file="../planning/header.jsp" %>
	<div class="container mt-5" style="min-width: 1200px">
		<div class="row">
			<%@ include file="mypageMenu.jsp" %>
            <div class="col" style="width: 900px;">
                <%@ include file="quickMenu.jsp" %>
                <div class="col mt-3">
                    <h5><b>내가 작성한 상품평</b></h5>
                </div>
                <div class="d-flex flex-column">
                	<c:if test='${reviewList.size() < 1}'>
   						<div style="text-align: center;">
	   						<img class="no-review-img" src="https://image.hmall.com/p/img/co/icon/ico-nodata-type12-1x.svg" />
	   						<h5 class="no_result">작성한 상품평이 없습니다.</h5>
   						</div>
					</c:if>
					
                    <c:forEach items="${reviewList}" var="review">
                    <div class="myReview">
	                    <div style="width: 100%; margin-bottom: 10px;">
               		 		<div class="myReviewTop">
	               		 		<a class="productlink" href="${contextPath}/category/1/${review.categoryID}/detail/${review.productID}">
	               		 			<input type="hidden" id="reviewID" name="${review.reviewID}" value="${review.reviewID}">
									<img class="myReviewImg" src="${review.prodThumbNail}" alt="${review.prodThumbNail}">
		                            <span class="myReviewProduct" style="font-size: 14pt; font-weight: bold;">${review.productName}</span><br>
		                            <span class="myReviewProduct">${review.optionName}</span>
	               		 		</a>
               		 		</div>
	             		 	<hr>
             		 		<div class="myReviewBottom">
	                            <h6 class="review-create-date">
	                            	<fmt:formatDate value="${review.createDate}" pattern="yyyy-MM-dd" />
               		 				<button type="button" class="editBtn" id="editBtn" data-reviewid="${review.reviewID}" data-content="${review.content}"><i class="fa-solid fa-pen"></i></button>
               		 				<button type="button" class="deleteBtn" id="deleteBtn"><i class="fa-solid fa-trash-can"></i></button>
	                            	<br>
                            		<p class="review-content" data-content="${review.content}">${review.content}</p>
                            	</h6>
	                            <c:forEach items="${review.attachList}" var="attach" varStatus="i">
	                                <c:if test="${i.first}"><img class="myReviewMemeberImg" src="${attach.imagePath}" alt="${attach.imagePath}"></c:if>
	                            </c:forEach>
                            </div>
                    	</div>
                   	</div>
                    </c:forEach>
                    <div class="modal-background">
						<div class="modal-window">
							<div class="popup">
		                        <h4 class="membername"><i class="fa-solid fa-heart" style="margin-right: 2px; margin-left: 10px; color: #FF493C"></i>
		                        	<b>${memberDTO.name}</b>님, 수정할 후기를 다시 입력해주세요.
		                        	<input type="hidden" id="content" value="">
		                        	<input type="hidden" id="reviewID" value="">
		                       	</h4>
		                       	<textarea cols="34" rows="5" type="text" class="write-review-content" value=""></textarea>
		                       	<input type="file" class="form-control form-control-sm" id="file" name='uploadFile' style="margin-left: 30px; width: 20%;" multiple>
		                       	<div class='uploadResult'>
									<ul>
									</ul>
								</div>	
	                       		<div class="review-buttons">
		                            <button type="button" class="cancelBtn" id="cancelBtn">취소</button>
		                            <button type="button" class="finishBtn" id="finishBtn">수정 완료</button>
	                           </div>
							</div>
						</div>
					</div>
                </div>
            </div>
		</div>
	</div>
     <%@ include file="../planning/footer.jsp" %>
</body>
</html>