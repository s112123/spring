<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="main-content">
	<h2>글 등록</h2>
	<div class="content-box">	
		<form action="/board/insert" method="post" id="board-form">
			<div class="content-item">		
				<select name="category">
					<option>선택</option>
					<option value="common">일반</option>
					<option value="question">문의</option>
				</select>
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요" />
				<textarea name="content"></textarea>
			</div>
			<div class="content-btn">
				<div>
					<button type="button" value="list">목록</button>
				</div>			
				<div>
					<button type="submit" value="insert">등록</button>
				</div>
			</div>
		</form>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/board/write.js"></script>