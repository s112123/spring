<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container order-container">
	<div class="order-box">
		<h2>주문내역</h2>
		<form method="post" id="cart-form">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>수량</th>
						<th>주문금액</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty orderProducts}">
							<tr>
								<td colspan="5">주문내역이 없습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="orderProduct" items="${orderProducts}">
								<tr>
									<td><input type="checkbox" name="selectedItem" class="selectedItem" value="${orderProduct.id}" /></td>
									<td>
										<div class="pname-box">
											<div class="pimg">
												<img src="${contextPath}/resources/images/products/thumbnails/thumb_${orderProduct.img}" />
											</div>
											<div>
												${orderProduct.pname}
											</div>
										</div>
									</td>
									<td>
										<input type="hidden" value="${orderProduct.id}" />
										<input type="number" name="qty" value="${orderProduct.qty}" min="1" max="1000" />
										<button type="button" onclick="updateItemForQty(this)">변경</button>
									</td>
									<td>
										<input type="hidden" value="${orderProduct.price}" />
										<span>${orderProduct.qty * orderProduct.price} 원</span>
									</td>
									<td>
										<a href="#" onclick="deleteItemInCart(${orderProduct.id})"><i class="fa-solid fa-trash-can"></i></a>
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
					총 주문금액: <span><input type="text" name="total" value="${total}" /></span> 원
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