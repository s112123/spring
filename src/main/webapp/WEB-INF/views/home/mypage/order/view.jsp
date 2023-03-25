<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    

<div class="main-content">
	<div class="myorder-box">
		<h2>주문상세내역</h2>
		<table class="myorder-list">
			<thead>
				<tr>	
					<th>번호</th>
					<th>주문상품</th>
					<th>상품가격</th>
					<th>주문수량</th>
					<th>주문금액</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty orderProducts}">
						<tr>
							<td colspan="5">주문상품이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set var="orderProducts" value="${orderProducts}" />
						<c:set var="end" value="${orderProducts.size()-1}" />
						<c:forEach var="i" begin="0" end="${end}" step="1">
							<tr>	
								<td>${end-i+1}</td>
								<td>
									<div class="pname-box">
										<div class="pimg">
											<img src="${contextPath}/resources/images/products/thumbnails/thumb_${orderProducts[i].img}" />
										</div>
										<div>
											${orderProducts[i].pname}
										</div>
									</div>
								</td>
								<td><fmt:formatNumber value="${orderProducts[i].price}" /> 원</td>
								<td><fmt:formatNumber value="${orderProducts[i].qty}" /></td>
								<td>
									<span class="orderedItem"><fmt:formatNumber value="${orderProducts[i].qty * orderProducts[i].price}" /> 원</span>
								</td>
							</tr>	
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="myorder-box-bottom">
			<div class="order-total">
					<span>총 주문금액 </span> 
					<input type="text" id="total" value="<fmt:formatNumber value="${order.total}" />" readonly /> 
					<span> 원</span>	
			</div>
		</div>
		<div class="myorder-btns">
			<input type="hidden" id="order-id" value="${order.id}" />
			<button type="button" value="delete">주문취소</button>
			<button type="button" value="list">목록</button>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/home/mypage/order/view.js"></script>