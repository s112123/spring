<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="banner">
		Banner
	</div>
	<div class="product-box">
		<div class="product-category">STEAK</div>
		<div class="product-items">
			<div class="product-item">
				<div class="product-image">
					<img src="${contextPath}/resources/images/products/steak1.jpg" />
					<div class="product-info">
						<div class="product-info-title">STEAK 1</div>
						<div class="product-info-desc">
							ABCDEFGABCD
						</div>
						<div class="product-detail">
							<small>용량 <strong>(100g)</strong></small><br /> 
							<small>칼로리 <strong>(1,400kcal)</strong></small><br /> 
							<small>원산지 <strong>(국내산)</strong></small> 
						</div>
						<div class="flex justify-fe">
							<button class="cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="product-title">STEAK 1</div>
				<div class="product-price">20,000 원</div>
			</div>
		</div>
	</div>
	<div class="product-box">
		<div class="product-category">PASTA</div>
		<div class="flex justify-sb align-items-ctr">
			<div class="product-item">
				<div class="product-image"></div>
				<div class="product-info">
					<div class="product-title">BEVERAGE 1</div>
					<div class="product-price">20000 원</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product-box">
		<div class="product-category">BEVERAGE</div>
		<div class="flex justify-sb align-items-ctr">
			<div class="product-item">
				<div class="product-image"></div>
				<div class="product-info">
					<div class="product-title">BEVERAGE 1</div>
					<div class="product-price">20000 원</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/product/product.js"></script>