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
	<title>Administrate</title>
	<!-- FONTAWESOME -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<!-- JQUERY -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<!-- CSS: common -->
	<link rel="stylesheet" href="${contextPath}/resources/css/common/reset.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/common.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/modal.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/aside.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/pagenation.css" />
	<!-- CSS: layout -->
	<link rel="stylesheet" href="${contextPath}/resources/css/admin/layout/header.css" />
	<!-- CSS: member -->
	<link rel="stylesheet" href="${contextPath}/resources/css/admin/member/members.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/admin/member/member.css" />
</head>
<body>
	<div class="container">	
		<header>
			<tiles:insertAttribute name="header" />
		</header>
		<main class="flex justify-ctr align-items-ctr">
			<tiles:insertAttribute name="main" />
		</main>
	</div>
</body>
</html>