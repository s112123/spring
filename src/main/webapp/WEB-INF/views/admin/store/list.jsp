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
				<th>대표자</th>
				<th>연락처</th>
				<th>주소</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="tbody">	
		
			
<%-- 			<c:choose>
				<c:when test="${empty stores}">
					<tr>
						<td colspan="7">등록된 매장이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="store" items="${stores}">
						<tr>
							<td>${store.id}</td>
							<td>${store.category}</td>
							<td><a href="/store/view?id=${store.id}">${store.pname}</a></td>
							<td>${store.price}</td>
							<td>${store.gram}</td>
							<td>${store.kcal}</td>
							<td>${store.origin}</td>
							<td>
								<!-- 00초 에러 처리해야 됨 -->							
								<fmt:parseDate value="${store.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
								수정버튼
								<a href="/product/view?id=${store.id}"><i class="fa-solid fa-pen-to-square"></i></a>
								삭제버튼
								<a href="#" onclick="deleteProduct(${store.id});"><i class="fa-solid fa-trash-can"></i></a>
							</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose> --%>
		</tbody>
	</table>
	<div class="bottom">
		<button type="button" value="insert">등록</button>
		<div class="search">
			<select name="search-option">
				<option>선택</option>
				<option value="email">이메일</option>
				<option value="username">이름</option>
			</select>
			<input type="text" name="search-keyword" placeholder="검색어 입력" />
			<button type="button" value="search">검색</button>
		</div>
		<div>
			<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/store/list.js"></script>