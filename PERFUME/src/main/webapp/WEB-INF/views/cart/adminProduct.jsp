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
<title>관리자페이지-상품등록</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style>
*{
   /* border: 1px solid red;  */
}
textarea{
    resize: none;
}

/* 관리자-상품등록 */
#optionbtn,#optiondeletebtn,.submitbtn,.resetbtn{
    background-color: rgb(255, 244, 164);
    font-weight: bolder;
    border: none;
}
table{
	text-align: center;

}
.buttonlist{
	text-align: center;
}
.tableback_color{
	background-color: rgb(118, 174, 135);
}
/* 관리자-상품등록 */

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

                    <h1>상품등록</h1>
                    	<form action="${path}/admin/insert" method="POST" id="form1" class="form-inline" enctype="multipart/form-data" onsubmit="return check();">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th colspan="6" class="tableback_color"><strong>1.</strong> 상품카테고리선택</th>
                                </tr>
                                    <tr>
                                        <th>상품향선택</th>
                                        <td colspan="5">
                                            <select name="ptNo" id="topcategory" required>
                                                <option selected>------선택------</option>
                                                <option value="1">1.시트러스</option>
                                                <option value="2">2.라이트플로랄</option>
                                                <option value="3">3.프루티</option>
                                                <option value="4">4.스파이시</option>
                                                <option value="5">5.우디</option>
                                                <option value="6">6.플로랄</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상품/사쉐선택</th>
                                        <td colspan="5">
                                            <select name="pmNo"  id="midcategory" required >
                                                <option selected>------선택------</option>
                                                <option value="1">1.상품</option>
                                                <option value="2">2.시향지</option>
                                            </select>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <th colspan="6" class="tableback_color"><strong>2.</strong> 상품정보등록</th>
                                    </tr>
                                    <tr>
                                        <th>브랜드</th>
                                        <td colspan="5">
                                            <input type="text" name="productBrand" placeholder="브랜드명을 입력해주세요." required class="form-control form-control-sm">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상품명</th>
                                        <td colspan="5">
                                            <input type="text" name="productName" placeholder="상품명을 입력해주세요." required class="form-control form-control-sm">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>영문이름</th>
                                        <td colspan="5">
                                            <input type="text" name="productEngName" placeholder="영문명을 입력해주세요." required class="form-control form-control-sm">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>추천성별</th>
                                        <td colspan="5">
                                            <select name="productGender" id="productGender" required>
                                                <option selected>------선택------</option>
                                                <option value="M">1.남성</option>
                                                <option value="F">2.여성</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상품기준가격</th>
                                        <td colspan="5">
                                            <input type="number" name="productPrice" placeholder="기준가격을 입력해주세요." maxlength="8" oninput="numberMaxLength(this);" required class="form-control form-control-sm">
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <th>상품제목</th>
                                        <td colspan="5">
                                            <input type="text" name="productTitle" placeholder="상품제목을 입력해주세요." required class="form-control form-control-sm">
                                        </td>
                                    </tr>
                                    <tr style="height: 250px;">
                                        <th style="height: 250px;" class="align-middle">상품설명</th>
                                        <td colspan="5" style="height: 250px;">
                                            <textarea name="productDetail" placeholder="상품소개 작성" required class="form-control" rows="5" style="height: 250px; width: 100%" ></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                             </table>
                           	 <table class="table">
                           		<tbody>   
	                                <tr>
	                                    <th colspan="6" class="tableback_color"><strong>3.</strong> 상품이미지첨부파일</th>
	                                </tr>
                                    <tr>
                                        <th class="align-middle">이미지등록</th>
                                        <td>
                                        	<br>*상품이미지는 3장만 등록가능합니다.*<br><br>
                                        	1.첫번째 사진은 썸네일사진입니다.<br><br>
                                        	2.두번째,세번째 사진은 설명 및 상세보기사진입니다.<br>
                                       	</td>
                                        <td colspan="4" class="align-middle">
                                            <input id="" class="upFile" type="file" name="originalFileName" multiple="multiple" onchange="fileUpload()" required style="color: orange;">
                                        </td>
                                    </tr>
                           		</tbody>
                       		 </table>
                       		 <table class="table" id="productTable">
                       		 	<thead>
                       		 		<tr>
                                        <th colspan="3" class="align-middle tableback_color"><strong>4.</strong> 상품옵션등록</th>
                                        <th colspan="3">
                                           *옵션을 추가하실려면 버튼을 클릭해주세요*
                                            <button type="button" id="optionbtn">추가</button>
                                            <button type="button" id="optiondeletebtn" >삭제</button>
                                        </th>
                                    </tr>
                       		 	</thead>
                         		<tbody>
                                </tbody>
                                
                       		 </table>
                       		
                       		<div class="container buttonlist">
	                        	<button type="submit" class="btn btn-warning" >등록하기</button>
	                        	<button type="reset" class="btn btn-warning" >취소하기</button>
                            </div>
                           	
                           	</form>

<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>
       
<script>
let count = 0;
$('#optionbtn').click(function() {
    let insertTr = ``;
    insertTr += '<tr id="optiontr'+count+'">';
    insertTr += '<th colspan="2">옵션명<input type="number" name="poList['+count+'].poName" maxlength="8" oninput="numberMaxLength(this);" placeholder="숫자만, [ml]단위입니다." required class="form-control form-control-sm"></th>';
    insertTr += '<th colspan="2">옵션가격<input type="number" name="poList['+count+'].poPrice" maxlength="8" oninput="numberMaxLength(this);" placeholder="해당옵션의 가격을 입력해주세요." required class="form-control form-control-sm"></th>';
    insertTr += '<th colspan="2">수량등록<input type="number" name="poList['+count+'].poAmount" maxlength="8" oninput="numberMaxLength(this);" placeholder="수량을 등록해주세요." required class="form-control form-control-sm"></th>';
    /* insertTr += '<th colspan="2"><button type="button" id="optiondeletebtn'+count+'" onclick="optiondeletebtn()">삭제</button></th>'; */
    insertTr += `</tr>`;
    $("#productTable").append(insertTr);
    count++
   
});

$('#optiondeletebtn').on('click',function(){
	count--
	$('#productTable>tbody:last>tr:last').remove();
})

function fileUpload(){
	let fileInput = document.getElementsByClassName("upFile");
	
	console.log(fileInput)

	for( var i=0; i<fileInput.length; i++ ){
		if( fileInput[i].files.length > 0 ){
			for( var j = 0; j < fileInput[i].files.length; j++ ){
				console.log(fileInput[i].files[j].name); // 파일명 출력
			}
		}
	}
}

function check(){
	
	/* alert('hihi') */
	let topcategory = $('#topcategory').val();
	console.log(topcategory)
	let midcategory = $('#midcategory').val();
	console.log(midcategory)
	let productGender = $('#productGender').val();
	console.log(productGender)
	
	if (!$.isNumeric(topcategory)) {
		alert('향 카테고리를 선택해주세요!')
		return false;
	}else if (!$.isNumeric(midcategory)) {
		alert('상품구분을 선택해주세요!')
		return false;
	}else if (!(productGender === 'M'|| productGender === 'F')) {
		alert('추천성별을 선택해주세요!')
		return false;
	}
	
}
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
        alert('더 이상 값을 입력할 수 없습니다.')
    }
}

</script>
</body>
</html>