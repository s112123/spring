<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="main-content">
	<h2>글 내용</h2>
	<div class="content-box ">	
		<form method="post" id="board-form">
			<input type="hidden" name="id" value="${board.id}" />
			<div class="content-item">		
				<select name="category" <c:if test="${login.email != board.email}">disabled</c:if>>
					<option value="common" <c:if test="${board.category == 'common'}">selected</c:if>>일반</option>
					<option value="question" <c:if test="${board.category == 'question'}">selected</c:if>>문의</option>
				</select>
				<input type="text" name="title" value="${board.title}" placeholder="제목을 입력해주세요" ${login.email == board.email ? "" : "readonly"} />
				<textarea name="content" ${login.email == board.email ? "" : "readonly"}>${board.content}</textarea>
			</div>
			<div class="content-btn">
				<div>
					<button type="button" value="list">목록</button>
				</div>			
				<div>
					<c:if test="${!empty login && (login.email == board.email)}">
						<button type="submit" value="update">수정</button>
						<button type="submit" value="delete">삭제</button>
					</c:if>
				</div>
			</div>
		</form>	
		<div class="reply-container">
			<h3>댓글쓰기</h3>
			<div class="reply-box">
				<form action="/reply/insert" method="post" autocomplete="off">
					<input type="hidden" name="bid" value="${board.id}" />
					<input type="text" name="writer" value="${login.email}" placeholder="로그인 하십시오" readonly />
					<textarea name="content" id="reply-write" rows="2" maxlength="100" ${empty login ? "readonly" : ""}></textarea>
					<div class="bottom">
						<div><span id="reply-length">0 / 100</span></div>
						<div><button>등록</button></div>
					</div>
				</form>
			</div>
			<h3>댓글 <span>(${totalReplies})</span></h3>
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
										<c:if test="${login.email == reply.writer}">
											<button type="button" onclick="location.href='/reply/delete?id=${reply.id}&bid=${board.id}'"><i class="fa-solid fa-xmark"></i></button>
										</c:if>
									</div>
								</div>
								<div class="reply-item-content">${reply.content}</div>
							</div>
						</c:forEach>
						<div class="reply-pagenation">
							<ul>
								<%-- 이전 버튼 --%>
								<c:if test="${pagenation.prev}">
									<li>
										<a href="?page=${pagenation.startPN - 1}"><i class="fa-solid fa-angle-left"></i></a>
									</li>
								</c:if>
								<%-- 페이지 번호 --%>
								<c:forEach var="pageNum" begin="${pagenation.startPN}" end="${pagenation.endPN}">
									<li>
										<a href="?id=${board.id}&page=${pageNum}">${pageNum}</a>
									</li>
								</c:forEach>
								<%-- 다음 버튼 --%>
								<c:if test="${next}">
									<li>
										<a href="?page=${pagenation.endPN + 1}"><i class="fa-solid fa-angle-right"></i></a>
									</li>
								</c:if>
							</ul>
						</div>				
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/board/view.js"></script>