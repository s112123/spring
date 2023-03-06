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
	<!-- CSS -->
	<link rel="stylesheet" href="${contextPath}/resources/css/reset.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/common/modal.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/admin/layouts/header.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/admin/members.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/admin/member.css" />
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
	
	<!-- Javascript -->
	<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
</body>
</html>