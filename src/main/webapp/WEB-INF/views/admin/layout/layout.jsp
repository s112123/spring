<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- FONTAWESOME -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	<!-- JQUERY -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- ADDRESS API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- CSS -->	
	<link rel="stylesheet" href="/resources/css/reset.css" />	
	<link rel="stylesheet" href="/resources/css/common.css" />
	<link rel="stylesheet" href="/resources/css/exception.css" />		
	<link rel="stylesheet" href="/resources/css/admin.css" />	
	<!-- TITLE -->
	<title>ADIMNISTRATE</title>
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<main>
		<div class="main-wrap">
			<tiles:insertAttribute name="aside" />
			<tiles:insertAttribute name="main" />
		</div>
	</main>
	<!-- Javascript -->
	<script type="text/javascript" src="/resources/js/common/common.js"></script>
</body>
</html>