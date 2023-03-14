<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="main-content">
	<h2>글 등록</h2>
	<div class="content-box">	
		<form action="/customer/notice/add" method="post" id="noticeWriteForm">
			<div class="content-item">		
				<select name="category">
					<option value="일반정보">일반정보</option>
					<option value="상품관련">상품관련</option>
				</select>
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요" />
				<textarea name="content"></textarea>
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
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/write.js"></script>