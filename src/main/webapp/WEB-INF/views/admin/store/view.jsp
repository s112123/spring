<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="main-content">
	<h2>매장정보</h2>
	<div class="infomation-box">
		<div class="infomation-item">
			<input type="hidden" id="store-id" value="${id}" />
			<div class="item-left">
				<div class="title">매장명</div>
				<div class="content">
					<input type="text" id="storename" />
				</div>
			</div>
			<div class="item-right">
				<div class="title">대표자</div>
				<div class="content">
					<input type="text" id="president" />
				</div>
			</div>
		</div>
		<div class="infomation-item">
			<div class="item-left">
				<div class="title">연락처</div>
				<div class="content">
					<input type="text" id="tel" placeholder="ex) 01012344567" maxlength="11" />
				</div>
			</div>
			<div class="item-right">
				<div class="title">주소</div>
				<div class="content">
					<input type="text" id="addr1" />
				</div>
			</div>
		</div>
		<div class="infomation-btn">
			<button type="button" value="update">수정</button>
			<button type="button" value="list">목록</button>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/store/view.js"></script>




