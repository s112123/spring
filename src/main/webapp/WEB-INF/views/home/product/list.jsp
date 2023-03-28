<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="container">
	<div class="product-banner">
		<img src="/resources/images/banners/banner2.jpg" />
		<div class="product-banner-content">
			PRODUCT
		</div>
	</div>
	<div class="product-box">
		<h2 class="product-category">STEAK</h2>
		<div class="product-item-box">
			<c:forEach var="steak" items="${products.steak}">
				<div class="product-item">
					<div class="product-info">
						<img src="/resources/images/products/${steak.img}" />
						<div class="product-detail">
							<div class="product-detail-title">${steak.pname}</div>
							<div class="product-detail-desc">${steak.description}</div>
							<div class="product-detail-info">
								<small>용량 <strong><fmt:formatNumber value="${steak.gram}" />g</strong></small><br /> 
								<small>칼로리 <strong><fmt:formatNumber value="${steak.kcal}" />kcal</strong></small><br /> 
								<small>원산지 <strong>${(steak.origin == "KR") ? "국내산" : (steak.origin == "US") ? "미국산" : "호주산"}</strong></small> 
							</div>
							<button type="button" name="add-cart" value="${steak.id}" class="add-cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>							
						</div>
					</div>
					<div class="product-title">${steak.pname}</div>
					<div class="product-price"><fmt:formatNumber value="${steak.price}" /> 원</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="product-box">
		<h2 class="product-category">PASTA</h2>
		<div class="product-item-box">
			<c:forEach var="pasta" items="${products.pasta}">
				<div class="product-item">
					<div class="product-info">
						<img src="/resources/images/products/${pasta.img}" />
						<div class="product-detail">
							<div class="product-detail-title">${pasta.pname}</div>
							<div class="product-detail-desc">${pasta.description}</div>
							<div class="product-detail-info">
								<small>용량 <strong><fmt:formatNumber value="${pasta.gram}" />g</strong></small><br /> 
								<small>칼로리 <strong><fmt:formatNumber value="${pasta.kcal}" />kcal</strong></small><br /> 
								<small>원산지 <strong>${(pasta.origin == "KR") ? "국내산" : (pasta.origin == "US") ? "미국산" : "호주산"}</strong></small>
							</div>
							<button type="button" name="add-cart" value="${pasta.id}" class="add-cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>							
						</div>
					</div>
					<div class="product-title">${pasta.pname}</div>
					<div class="product-price"><fmt:formatNumber value="${pasta.price}" /> 원</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="product-box">
		<h2 class="product-category">BEVERAGE</h2>
		<div class="product-item-box">
			<c:forEach var="beverage" items="${products.beverage}">
				<div class="product-item">
					<div class="product-info">
						<img src="/resources/images/products/${beverage.img}" />
						<div class="product-detail">
							<div class="product-detail-title">${beverage.pname}</div>
							<div class="product-detail-desc">${beverage.description}</div>
							<div class="product-detail-info">
								<small>용량 <strong><fmt:formatNumber value="${beverage.gram}" />ml</strong></small><br /> 
								<small>칼로리 <strong><fmt:formatNumber value="${beverage.kcal}" />kcal</strong></small><br /> 
								<small>원산지 <strong>${(beverage.origin == "KR") ? "국내산" : (beverage.origin == "US") ? "미국산" : "호주산"}</strong></small>
							</div>
							<button type="button" name="add-cart" value="${beverage.id}" class="add-cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>							
						</div>
					</div>
					<div class="product-title">${beverage.pname}</div>
					<div class="product-price"><fmt:formatNumber value="${beverage.price}" /> 원</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- <a href="#" id="back-to-top">TOP</a> -->
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="flase" />
<script type="text/javascript" src="/resources/js/home/product/list.js"></script>