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
				<th>용량</th>
				<th>칼로리</th>
				<th>원산지</th>
				<th>가입일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${products}">
				<tr>
					<td>${product.id}</td>
					<td>${product.category}</td>
					<td>${product.pname}</td>
					<td>${product.price}</td>
					<td>${product.gram}</td>
					<td>${product.kcal}</td>
					<td>${product.origin}</td>
					<td>
						<fmt:parseDate value="${product.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<%-- 수정버튼 --%>
						<a href="/product/info?id=${product.id}"><i class="fa-solid fa-pen-to-square"></i></a>
						<%-- 삭제버튼 --%>
						<a href="#" onclick="deleteProduct(${product.id});"><i class="fa-solid fa-trash-can"></i></a>
					</td>
				</tr>	
			</c:forEach>	
		</tbody>
	</table>
	<div class="bottom">
		<button type="button" onclick="location.href='/product/info'">등록</button>
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
<script type="text/javascript" src="${contextPath}/resources/js/admin/productlist.js"></script>