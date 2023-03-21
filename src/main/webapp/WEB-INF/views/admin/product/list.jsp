<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="main-content">
	<h2>상품목록</h2>
	<table class="product-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>상품명</th>
				<th>가격</th>
				<th>용량 (g)</th>
				<th>칼로리 (kcal)</th>
				<th>원산지</th>
				<th>가입일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty products}">
					<tr>
						<td colspan="9">등록된 상품이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="product" items="${products}">
						<tr>
							<td>${product.id}</td>
							<td>${product.category}</td>
							<td><a href="/product/view?id=${product.id}">${product.pname}</a></td>
							<td>${product.price}</td>
							<td>${product.gram}</td>
							<td>${product.kcal}</td>
							<td>${(product.origin == "KR") ? "국내산" : (product.origin == "US") ? "미국산" : "호주산"}</td>
							<td>
								<!-- 00초 에러 처리해야 됨 -->							
								<fmt:parseDate value="${product.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
								<a href="/product/view?id=${product.id}"><i class="fa-solid fa-pen-to-square"></i></a>
							</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="bottom">
		<button type="button" value="insert">등록</button>
		<div>
			<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/product/list.js"></script>