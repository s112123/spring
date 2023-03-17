<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    

<div class="container order-container">
	<div class="order-box">
		<h2>주문상세내역</h2>
		<form action="/order/delete" method="post" id="order-form">
			<input type="hidden" name="code" value="${code}" />
			<table>
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
									<td>${orderProducts[i].price} 원</td>
									<td>${orderProducts[i].qty}</td>
									<td>
										<input type="hidden" value="${orderProducts[i].price}" />
										<span>${orderProducts[i].qty * orderProducts[i].price} 원</span>
									</td>
								</tr>	
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="order-box-bottom">
				<div class="order-total">
					총 주문금액: <span>30,000</span> 원
				</div>
			</div>
			<div class="order-btns">
				<button type="submit" value="delete">주문취소</button>
				<button type="button" value="home">홈으로</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/order/view.js"></script>