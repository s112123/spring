<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="main-content">
	<h2>글 내용</h2>
	<div class="content-box">	
		<form action="/customer/notice/modify" method="post" id="noticeModifyForm">
			<input type="hidden" name="id" value="${notice.id}" />
			<div class="content-item">		
				<select name="category">
					<option value="일반정보" <c:if test="${notice.category == '일반정보'}">selected</c:if>>일반정보</option>
					<option value="상품관련" <c:if test="${notice.category == '상품관련'}">selected</c:if>>상품관련</option>
				</select>
				<input type="text" name="title" value="${notice.title}" placeholder="제목을 입력해주세요" />
				<textarea name="content">${notice.content}</textarea>
			</div>
			<div class="content-btn">
				<button type="submit" value="update">수정</button>
				<button type="button" onclick="location.href='/notice/list'">목록</button>
			</div>
		</form>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<!-- 
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/view.js"></script>
 -->