<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<!-- TITLE -->
	<title>Home</title>
	<!-- FONTAWESOME -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<!-- JQUERY -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/modal.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/layouts/header.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/layouts/footer.css" />
	
	<!-- CSS: customer -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/aside.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/pagenation.css" />
	<!-- CSS: customer > notice -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/notice/notices.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/notice/notice.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/notice/write.css" />
	<!-- CSS: customer > qna -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/qna/qnas.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/qna/write.css" />	
	
	
	<!-- -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/index.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/login.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/agree.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/register.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/products.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/cart.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/userinfo.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/userorders.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/userqnas.css" />
</head>
<body>
	<div class="container">	
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<main class="flex justify-ctr align-items-ctr">
			<tiles:insertAttribute name="main" />
		</main>
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	
	<!-- Javascript -->
	<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
	
	
	<!-- Javascript: customer > notice -->
	<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/write.js"></script>
</body>
</html>