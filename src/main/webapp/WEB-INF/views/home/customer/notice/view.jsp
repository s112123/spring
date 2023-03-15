<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="main-content">
	<h2>글 내용</h2>
	<div class="content-box">	
		<form method="post" id="notice-form">
			<input type="hidden" name="id" value="${notice.id}" />
			<div class="content-item">		
				<select name="category">
					<option value="common" <c:if test="${notice.category == 'common'}">selected</c:if>>일반정보</option>
					<option value="product" <c:if test="${notice.category == 'product'}">selected</c:if>>상품관련</option>
				</select>
				<input type="text" name="title" value="${notice.title}" placeholder="제목을 입력해주세요" />
				<textarea name="content">${notice.content}</textarea>
			</div>
			<div class="content-btn">
				<div>
					<button type="button" value="list">목록</button>
				</div>			
				<div>
					<c:if test="${!empty login && login.grade == 'ADMIN'}">
						<button type="submit" value="update">수정</button>
						<button type="submit" value="delete">삭제</button>
					</c:if>
				</div>
			</div>
		</form>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/view.js"></script>
