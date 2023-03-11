<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container">
	<div class="banner">
		Banner
	</div>
	<div class="product-box">
		<h2 class="product-category">STEAK</h2>
		<div class="product-item-box">
			<!-- 여기서부터 반복 -->
			<div class="product-item">
				<div class="product-info">
					<img src="${contextPath}/resources/images/products/steak1.jpg" />
					<div class="product-detail">
						<div class="product-detail-title">STEAK 1</div>
						<div class="product-detail-desc">
							ABCDEFGABCD
						</div>
						<div class="product-detail-info">
							<small>용량 <strong>(100g)</strong></small><br /> 
							<small>칼로리 <strong>(1,400kcal)</strong></small><br /> 
							<small>원산지 <strong>(국내산)</strong></small> 
						</div>
						<button class="add-cart-btn">
							<i class="fa-solid fa-cart-shopping"></i>
						</button>
					</div>
				</div>
				<div class="product-title">STEAK 1</div>
				<div class="product-price">20,000 원</div>
			</div>
			<!-- 여기서부터 반복 끝 -->
		</div>
	</div>
	<div class="product-box">
		<h2 class="product-category">PASTA</h2>
		<div class="product-item-box">
			<!-- 여기서부터 반복 -->
			<div class="product-item">
				<div class="product-info">
					<img src="${contextPath}/resources/images/products/steak1.jpg" />
					<div class="product-detail">
						<div class="product-detail-title">STEAK 1</div>
						<div class="product-detail-desc">
							ABCDEFGABCD
						</div>
						<div class="product-detail-info">
							<small>용량 <strong>(100g)</strong></small><br /> 
							<small>칼로리 <strong>(1,400kcal)</strong></small><br /> 
							<small>원산지 <strong>(국내산)</strong></small> 
						</div>
						<button class="add-cart-btn">
							<i class="fa-solid fa-cart-shopping"></i>
						</button>
					</div>
				</div>
				<div class="product-title">STEAK 1</div>
				<div class="product-price">20,000 원</div>
			</div>
			<!-- 여기서부터 반복 끝 -->
		</div>
	</div>
	<div class="product-box">
		<h2 class="product-category">BEVERAGE</h2>
		<div class="product-item-box">
			<!-- 여기서부터 반복 -->
			<div class="product-item">
				<div class="product-info">
					<img src="${contextPath}/resources/images/products/steak1.jpg" />
					<div class="product-detail">
						<div class="product-detail-title">STEAK 1</div>
						<div class="product-detail-desc">
							ABCDEFGABCD
						</div>
						<div class="product-detail-info">
							<small>용량 <strong>(100g)</strong></small><br /> 
							<small>칼로리 <strong>(1,400kcal)</strong></small><br /> 
							<small>원산지 <strong>(국내산)</strong></small> 
						</div>
						<button class="add-cart-btn">
							<i class="fa-solid fa-cart-shopping"></i>
						</button>
					</div>
				</div>
				<div class="product-title">STEAK 1</div>
				<div class="product-price">20,000 원</div>
			</div>
			<!-- 여기서부터 반복 끝 -->
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/productlist.js"></script>