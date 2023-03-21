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
			<c:choose>
				<c:when test="${empty members}">
					<tr>
						<td colspan="8">등록된 회원이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
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
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/member/list.js"></script>