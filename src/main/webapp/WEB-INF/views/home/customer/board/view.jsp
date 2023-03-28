<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="main-content">
	<h2>글 내용</h2>
	<div class="content-box ">	
		<form id="board-form">
			<%-- Link를 위한 데이터 --%>
			<input type="hidden" name="id" id="id" value="${board.id}" />
			<input type="hidden" name="page" value="${pagenation.page}" />
			<input type="hidden" name="searchOption" value="${linkParam.searchOption}" />
			<input type="hidden" name="searchKeyword" value="${linkParam.searchKeyword}" />		
			<div class="content-item">		
				<select name="category" ${((login.email == board.email) || (login.grade == 'ADMIN')) ? "" : "disabled"}>
					<option value="common" <c:if test="${board.category == 'common'}">selected</c:if>>일반</option>
					<option value="question" <c:if test="${board.category == 'question'}">selected</c:if>>문의</option>
				</select>
				<input type="text" name="title" value="${board.title}" placeholder="제목을 입력해주세요" ${((login.email == board.email) || (login.grade == 'ADMIN')) ? "" : "readonly"} />
				<textarea name="content" ${((login.email == board.email) || (login.grade == 'ADMIN')) ? "" : "readonly"}>${board.content}</textarea>
			</div>
			<div class="content-btn">
				<div class="btn-left">
					<button type="button" onclick="listBoard()">목록</button>
				</div>			
				<div class="btn-right">
					<c:if test="${!empty login && ((login.email == board.email) || (login.grade == 'ADMIN'))}">
						<button type="button" onclick="updateBoard()">수정</button>
						<button type="button" onclick="deleteBoard()">삭제</button>
					</c:if>
				</div>
			</div>
		</form>	
		<!-- REPLY -->
		<div class="reply-container">
			<h3>댓글쓰기</h3>
			<div class="reply-box">
				<input type="text" name="reply-writer" value="${login.email}" placeholder="로그인 하십시오" readonly />
				<textarea name="reply-content" id="reply-content" rows="2" maxlength="100" ${empty login ? "readonly" : ""}></textarea>			 
				<div class="bottom">
					<div>
						<span id="reply-length">0 / 100</span>
					</div>
					<div>
						<button type="button" data-set='{"bid": ${board.id}, "page": ${pagenation.page}}' onclick="insertReply(this)">등록</button>
					</div>
				</div>	 
			</div>
			<h3>댓글 <span id="reply-total">(${totalReplies})</span></h3>
			<div class="reply-list-box">
				<c:choose>
					<c:when test="${empty replies}">
						<div class="reply-item">
							<div class="reply-item-content">등록된 댓글이 없습니다</div>
						</div>					
					</c:when> 
					<c:otherwise>
						<c:forEach var="reply" items="${replies}">
							<div class="reply-item">
								<div class="reply-item-header">
									<div>
										<span>${reply.writer}</span>
									</div>
									<div>
										<c:if test="${(login.email == reply.writer) || (login.grade == 'ADMIN')}">
											<button type="button" data-set='{"id": ${reply.id}, "bid": ${board.id}}' onclick="deleteReply(this)">
												<i class="fa-solid fa-xmark"></i>
											</button>
										</c:if>
									</div>
								</div>
								<div class="reply-item-content">${reply.content}</div>
							</div>
						</c:forEach>			
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- <a href="#" id="back-to-top">TOP</a> -->
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/home/customer/board/view.js"></script>