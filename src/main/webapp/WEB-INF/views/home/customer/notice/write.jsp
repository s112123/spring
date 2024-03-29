<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="main-content">
	<h2>글 등록</h2>
	<div class="content-box">	
		<form id="notice-form">
			<div class="content-item">		
				<select name="category">
					<option>선택</option>
					<option value="common">일반정보</option>
					<option value="product">상품관련</option>
				</select>
				<input type="text" name="title" placeholder="제목을 입력하세요" />
				<textarea name="content"></textarea>
			</div>
			<div class="content-btn">
				<div class="btn-left">
					<button type="button" onclick="listNotice()">목록</button>
				</div>			
				<div class="btn-right">
					<button type="button" onclick="insertNotice()">등록</button>
				</div>
			</div>
		</form>	
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/home/customer/notice/write.js"></script>