<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="main-content">
	<h2>매장목록</h2>
	<table class="store-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>매장명</th>
				<th>주소</th>
				<th>연락처</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>	
			<c:choose>
				<c:when test="${empty stores}">
					<tr>
						<td colspan="6">등록된 매장이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="store" items="${stores}">
						<tr>
							<td>${store.id}</td>
							<td><a href="/store/view?id=${store.id}">${store.storename}</a></td>
							<td>${store.addr1}</td>
							<td>${store.tel}</td>
							<td>
								<c:catch var="catchException">
									<fmt:parseDate value="${store.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:catch>
								<c:if test="${catchException != null }">
									<fmt:parseDate value="${store.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:if>
							</td>
							<td>
								<a href="/store/view?id=${store.id}"><i class="fa-solid fa-pen-to-square"></i></a>
								<a href="javascript:void(0);" data-set='{"id": ${store.id}, "page": ${pagenation.page}}' onclick="deleteStore(this)"><i class="fa-solid fa-trash-can"></i></a>
							</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="bottom">
		<button type="button" onclick="writeStoreForm()">등록</button>
		<div>
			<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/admin/store/list.js"></script>