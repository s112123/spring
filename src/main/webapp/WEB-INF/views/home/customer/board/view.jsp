<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="main-content">
	<h2>글 내용</h2>
	<div class="content-box ">	
		<form method="post" id="board-form">
			<input type="hidden" name="id" value="${board.id}" />
			<div class="content-item">		
				<select name="category">
					<option value="common" <c:if test="${board.category == 'common'}">selected</c:if>>일반</option>
					<option value="question" <c:if test="${board.category == 'question'}">selected</c:if>>문의</option>
				</select>
				<input type="text" name="title" value="${board.title}" placeholder="제목을 입력해주세요" />
				<textarea name="content">${board.content}</textarea>
			</div>
			<div class="content-btn">
				<div>
					<button type="button" value="list">목록</button>
				</div>			
				<div>
					<c:if test="${!empty login}">
						<button type="submit" value="update">수정</button>
						<button type="submit" value="delete">삭제</button>
					</c:if>
				</div>
			</div>
		</form>	
		<div class="reply-container">
			<h3>댓글쓰기</h3>
			<div class="reply-box">
				<input type="text" />
				<textarea rows="2" maxlength="100"></textarea>
				<div class="bottom">
					<div><span>0 / 100</span></div>
					<div><button>등록</button></div>
				</div>
			</div>
			<h3>댓글 <span>(5)</span></h3>
			<div class="reply-list-box">
				<!-- 순환문 -->
				<div class="reply-item">
					<div class="reply-item-header">
						<div>
							<span>가나다라마다사</span>
						</div>
						<div>
							<button><i class="fa-solid fa-xmark"></i></button>
						</div>
					</div>
					<div class="reply-item-content">가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가가</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/board/view.js"></script>