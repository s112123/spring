<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="main-content">
	<h2>회원목록</h2>
	<table class="member-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>이메일</th>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>등급</th>
				<th>가입일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${members}">
				<tr>
					<td>${member.id}</td>
					<td><a href="/member/view?id=${member.id}">${member.email}</a></td>
					<td>${member.username}</td>
					<td>${member.phone}</td>
					<td>${member.addr1} ${member.addr2}</td>
					<td>${member.grade}</td>
					<td>
						<!--  00 에러 -->
						<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<%-- 수정버튼 --%>
						<a href="/member/view?id=${member.id}"><i class="fa-solid fa-pen-to-square"></i></a>
						<%-- 삭제버튼 --%>
						<a href="#" onclick="deleteMember(${member.id});"><i class="fa-solid fa-trash-can"></i></a>
					</td>
				</tr>	
			</c:forEach>	
		</tbody>
	</table>
	<div class="bottom">
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
<script type="text/javascript" src="${contextPath}/resources/js/admin/memberlist.js"></script>