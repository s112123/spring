<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<div class="container">
	<div class="store-box">
		<div class="store-list-box">
			<ul class="store-navbar">
				<li><a href="javascript:void(0);" class="active">서울</a></li>
				<li><a href="javascript:void(0);">부산</a></li>
				<li><a href="javascript:void(0);">경기</a></li>
				<li><a href="javascript:void(0);">대전</a></li>
				<li><a href="javascript:void(0);">광주</a></li>
				<li><a href="javascript:void(0);">울산</a></li>
			</ul>
			<div class="store-list" id="store-list"></div>
			<!-- PAGENATION -->
			<div class="pagenation store-pagenation" id="store-pagenation"></div>
		</div>
		<div id="map"></div>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="flase" />
<script type="text/javascript" src="${contextPath}/resources/js/home/store/list.js"></script>