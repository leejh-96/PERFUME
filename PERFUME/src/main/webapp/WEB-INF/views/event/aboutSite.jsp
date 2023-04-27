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
  <title>aboutSite</title>

  <style>
  	body{ background-color: #f6f6f2; }
  	header { background-color: #ffffff; }
	footer { background-color: #ffffff; }
    section{ width: 1200px; text-align: center; margin-left: auto; margin-right: auto; }
    .img{ width: 80%; margin-left: auto; margin-right: auto; }
  </style>
<script src="js/jquery-3.6.3.js"></script>
<script src="${ path }/js/jquery.fade-in.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/planning/header.jsp"/>
		<section>
				<img class="img fade-in" src="${ path }/images/aboutSite/001.png">
				<img class="img fade-in" src="${ path }/images/aboutSite/002.png">
				<img class="img fade-in" src="${ path }/images/aboutSite/003.png">
		</section>
 	<jsp:include page="/WEB-INF/views/planning/footer.jsp"/>