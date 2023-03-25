<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>글 목록</h2>
	<table class="myboard-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty boards}">
					<tr>
						<td colspan="6">등록한 글 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="board" items="${boards}">
						<tr>
							<td>${board.id}</td>
							<td>
								<c:if test="${board.category == 'common'}">일반</c:if>
								<c:if test="${board.category == 'question'}">문의</c:if>
							</td>
							<td><a href="/board/view?id=${board.id}">${board.title}</a></td>
							<td>${board.writer}</td>
							<td>
								<c:catch var="catchException">
									<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:catch>
								<c:if test="${catchException != null }">
									<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:if>
							</td>
							<td>${board.hits}</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="bottom">
		<div>
			<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<!-- 
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/list.js"></script>
 -->