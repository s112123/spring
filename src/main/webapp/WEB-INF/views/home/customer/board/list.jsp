<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>커뮤니티</h2>
	<table class="board-list">
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
						<td colspan="6">등록된 글이 없습니다</td>
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
							<td>
								<a href="javascript:void(0);" data-id="${board.id}" data-page="${pagenation.page}" onclick="view(this)">${board.title}</a>
								<c:if test="${board.cnt != 0}">
									<span> [${board.cnt}]</span>
								</c:if>
							</td>
							<td>${board.writer}</td>
							<td>
								<%-- 
								<fmt:parseDate value="${board.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
								 --%>
							</td>
							<td>${board.hits}</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="bottom">
		<c:if test="${!empty login}">
			<button type="button" onclick="writeBoardForm()">글쓰기</button>
		</c:if>
		<div class="search">
			<select name="search-option" id="search-option">
				<option value="select">선택</option>
				<option value="writer" ${linkParam.searchOption == "writer" ? "selected" : ""}>작성자</option>
				<option value="title" ${linkParam.searchOption == "title" ? "selected" : ""}>제목</option>
			</select>
			<input type="text" name="search-keyword" id="search-keyword" value="${linkParam.searchKeyword}" placeholder="검색어 입력" onkeypress="if(event.keyCode == 13 ){search();}" />
			<button type="button" onclick="search()">검색</button>
		</div>
		<div>
			<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/board/list.js"></script>