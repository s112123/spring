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
							<td>
								<c:if test="${notice.category == 'common'}">일반정보</c:if>
								<c:if test="${notice.category == 'product'}">상품관련</c:if>
							</td>
							<td><a href="/customer/notice/view?id=${notice.id}">${notice.title}</a></td>
							<td>${notice.writer}</td>
							<td>
								<c:catch var="catchException">
									<fmt:parseDate value="${notice.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:catch>
								<c:if test="${catchException != null }">
									<fmt:parseDate value="${notice.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:if>
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
			<button type="button" onclick="writeNoticeForm()">글쓰기</button>
		</c:if>
		<div>
			<jsp:include page="/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/home/customer/notice/list.js"></script>