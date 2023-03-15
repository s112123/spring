<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>공지사항</h2>
	<table class="notice-list">
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
				<c:when test="${empty notices}">
					<tr>
						<td colspan="6">등록된 글이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="notice" items="${notices}">
						<tr>
							<td>${notice.id}</td>
							<td>${notice.category}</td>
							<td><a href="/notice/view?id=${notice.id}">${notice.title}</a></td>
							<td>${notice.writer}</td>
							<td>
								<fmt:parseDate value="${notice.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>${notice.hits}</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="bottom">
		<c:if test="${!empty login && login.grade == 'ADMIN'}">
			<button type="button" value="write">글쓰기</button>
		</c:if>
		<div class="search">
			<select name="search-option">
				<option>선택</option>
				<option value="email">이메일</option>
				<option value="username">이름</option>
			</select>
			<input type="text" name="search-keyword" placeholder="검색어 입력" />
			<button type="button">검색</button>
		</div>
		<div>
			<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/list.js"></script>