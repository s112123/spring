<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container cart-container">
	<div class="cart-box">
		<h2>장바구니</h2>
		<form method="post" id="cart-form">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" id="all-check" onclick="checkAll(this)" /></th>
						<th>상품명</th>
						<th>수량</th>
						<th>금액</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty cart}">
							<tr>
								<td colspan="5">추가된 상품이 없습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="c" items="${cart}">
								<tr>
									<td><input type="checkbox" name="selectedItem" class="selectedItem" value="${c.id}" /></td>
									<td>
										<div class="pname-box">
											<div class="pimg">
												<img src="${contextPath}/resources/images/products/thumbnails/thumb_${c.img}" />
											</div>
											<div>
												${c.pname}
											</div>
										</div>
									</td>
									<td>
										<input type="hidden" value="${c.id}" />
										<input type="number" name="qty" value="${c.qty}" min="1" max="1000" />
										<button type="button" onclick="updateItemForQty(this)">변경</button>
									</td>
									<td>
										<input type="hidden" value="${c.price}" />
										<span>${c.qty * c.price} 원</span> 
									</td>
									<td>
										<a href="#" onclick="deleteItemInCart(${c.id})"><i class="fa-solid fa-trash-can"></i></a>
									</td>
								</tr>	
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="cart-box-bottom">
				<button type="submit" value="delete">선택삭제</button>
 				<div class="order-total">
 					<span>총 주문금액 </span> 
 					<input type="text" name="total" id="total" value="0" readonly /> 
 					<span> 원</span>	
				</div>
			</div>
			<div class="cart-order-btn">
				<button type="submit" value="order">주문하기</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/cart/list.js"></script>