<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- TITLE -->
	<title>Home</title>
	<!-- FONTAWESOME -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<!-- JQUERY -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/common/common.css" />	
	<link rel="stylesheet" href="${contextPath}/resources/css/home/layout/header.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/layout/footer.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/register/agree.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/product/products.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/cart/cart.css" />
	

	<link rel="stylesheet" href="${contextPath}/resources/css/common/aside.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/pagenation.css" />

	
	<!-- CSS: notice -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/notice/notices.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/notice/notice.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/notice/write.css" />
	<!-- CSS: qna -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/qna/qnas.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/customer/qna/write.css" />	
	
	<!-- -->
	<link rel="stylesheet" href="${contextPath}/resources/css/home/userinfo.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/userorders.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/home/userqnas.css" />
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<main>
		<tiles:insertAttribute name="main" />
	</main>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>