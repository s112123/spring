<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container flex justify-ctr">
	<jsp:include page="${contextPath}/WEB-INF/views/home/customer/aside.jsp" flush="false" />
	<div id="notices-content">
		<h3>공지사항</h3>
		<table>
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
				<c:forEach var="notice" items="${notices}">
					<tr>
						<td>${notice.id}</td>
						<td>${notice.category}</td>
						<td><a href="/customer/notice?id=${notice.id}">${notice.title}</a></td>
						<td>${notice.writer}</td>
						<td>
							<fmt:parseDate value="${notice.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" />
						</td>
						<td>${notice.hits}</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>
		<div class="content-bottom flex justify-sb align-items-ctr">
			<div class="write">
				<button type="button" onclick="location.href='/customer/notice/write';">글쓰기</button>
			</div>
			<div class="search">
				<select name="searchOption">
					<option>선택</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
				</select>
				<input type="text" name="searchKeyword" placeholder="검색어 입력" />
				<button type="button">검색</button>
			</div>
		</div>
		<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
	</div>
</div>