<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container flex justify-ctr">
	<div class="cart-box">
		<h3>장바구니</h3>
		<button type="button" onclick="location.href='/cart/removeItems'">선택삭제</button>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" onclick="checkAll(this)" /></th>
					<th>주문상품</th>
					<th>수량</th>
					<th>금액</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cart}">
					<tr>
						<td><input type="checkbox" name="selectItem[]" value="${c.id}" /></td>
						<td>${c.pname}</td>
						<td>
							<input type="hidden" value="${c.id}" />
							<input type="number" name="qty" value="${c.qty}" min="1" max="1000" />
							<button class="change-qty-btn">변경</button>
						</td>
						<td>
							<input type="hidden" value="${c.price}" />
							<span>${c.qty * c.price} 원</span>
						</td>
						<td>
							<a href="#" onclick="removeItemInCart(${c.id})"><i class="fa-solid fa-trash-can"></i></a>
						</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>
		<div class="flex justify-sb align-items-ctr">
			<button type="button" onclick="location.href='/writeqna';">선택삭제</button>
			<div class="order-total">
				<strong>총 결제금액: <span>30,000</span> 원</strong>
			</div>
		</div>
		<div class="cart-order-btn">
			<button type="button" onclick="location.href='/order'">주문하기</button>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/cart/cart.js"></script>