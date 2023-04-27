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
<title>관리자 페이지-혜택등록</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<style type="text/css">
/* 관리자-혜택등록 */
*{
   /*  border: 1px solid red; */
}
textarea{
    resize: none;
}
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
.tabledetail{
	margin-top :50px;
}
.tableback_color{
	background-color: rgb(118, 174, 135);
}
/* 관리자-혜택등록 */
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/cart/common/adminSidebar.jsp"/>

						<h1>혜택등록</h1>
                    	<form action="${path}/admin/benefitInsert" method="POST" id="form1" class="form-inline" enctype="multipart/form-data" onsubmit="return check();">
                        <table class="table table-hover tabledetail">
                            <tbody>
                                <tr>
                                    <th class="tableback_color">혜택구분선택</th>
                                    <td colspan="5">
                                        <select name="benefitName" id="benefitName" required>
                                            <option selected>------선택------</option>
                                            <option value="기획전할인">1.기획전할인</option>
                                            <option value="쿠폰">2.쿠폰</option>
                                            <option value="이벤트">3.이벤트</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tableback_color">혜택제목</th>
                                    <td colspan="5">
                                        <input type="text" name="benefitTitle" placeholder="제목을 입력해주세요." required class="form-control form-control-sm">
                                    </td>
                                </tr>
                                <tr style="height: 250px;">
                                    <th style="height: 250px;" class="align-middle tableback_color">혜택내용</th>
                                    <td colspan="5" style="height: 250px;">
                                        <textarea name="benefitContent" placeholder="혜택소개글 작성" required class="form-control" rows="5" style="height: 250px; width: 100%" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tableback_color">등록날짜 : </th>
                                    <th>*등록날짜는 등록한날로 자동으로 입력됩니다.*</th>
                                    <th class="tableback_color">종료날짜 : </th>
                                    <td colspan="3">
                                        <input type="date" name="benefitEndDate" placeholder="형식 : 2023-04-18" required class="form-control form-control-sm">
                                    </td>
                                </tr>
                                <tr>
                                	<th class="tableback_color">혜택비율 : </th>
                                    <th colspan="5">
                                    	*모든 혜택은 5%가 적용됩니다.*
                                    	<input type="hidden" name="benefitRatio" value="5">	
                                  	</th>
                                </tr>
                                <tr>
                                    <th class="tableback_color">이미지등록</th>
                                    <td colspan="5">
                                        <input id="" class="upFile" type="file" name="originalFileName" required style="color: orange;">
                                        *이미지는 한개만 등록 가능합니다.*
                                    </td>
                                </tr>
                                </tbody>
                             </table>
                           	 
                       		<div class="container buttonlist">
		                        <button type="submit" class="btn btn-warning" >등록하기</button>
		                        <button class="btn btn-warning" >취소하기</button>
                            </div>
                            
                           	</form>
<jsp:include page="/WEB-INF/views/cart/common/adminFootDiv.jsp"/>
</body>
</html>