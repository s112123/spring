<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>주문내역</h2>
	<table class="order-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>주문금액</th>
				<th>주문일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty orders}">
					<tr>
						<td colspan="6">주문내역이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td>${order.id}</td>
							<td>${order.code}</td>
							<td><a href="/mypage/order/view?code=${order.code}">${order.title}</a></td>
							<td><fmt:formatNumber value="${order.total}" /> 원</td>
							<td>
								<c:catch var="catchException">
									<fmt:parseDate value="${order.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:catch>
								<c:if test="${catchException != null }">
									<fmt:parseDate value="${order.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</c:if>
							</td>
						</tr>	
					</c:forEach>					
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="bottom">
		<div>
			<jsp:include page="/WEB-INF/views/common/pagenation.jsp" flush="false" />
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />