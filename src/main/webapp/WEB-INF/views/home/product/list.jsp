<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<div class="container">
	<div class="banner">
		Banner
	</div>
	<div class="product-box">
		<h2 class="product-category">STEAK</h2>
		<div class="product-item-box">
			<c:forEach var="steak" items="${products.steak}">
				<div class="product-item">
					<div class="product-info">
						<img src="${contextPath}/resources/images/products/${steak.img}" />
						<div class="product-detail">
							<div class="product-detail-title">${steak.pname}</div>
							<div class="product-detail-desc">${steak.description}</div>
							<div class="product-detail-info">
								<small>용량 <strong>(${steak.gram}g)</strong></small><br /> 
								<small>칼로리 <strong>(${steak.kcal}kcal)</strong></small><br /> 
								<small>원산지 <strong>(${steak.origin})</strong></small> 
							</div>
							<button type="button" name="add-cart" value="${steak.id}" class="add-cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>							
						</div>
					</div>
					<div class="product-title">${steak.pname}</div>
					<div class="product-price">${steak.price} 원</div>
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
						<img src="${contextPath}/resources/images/products/${pasta.img}" />
						<div class="product-detail">
							<div class="product-detail-title">${pasta.pname}</div>
							<div class="product-detail-desc">${pasta.description}</div>
							<div class="product-detail-info">
								<small>용량 <strong>(${pasta.gram}g)</strong></small><br /> 
								<small>칼로리 <strong>(${pasta.kcal}kcal)</strong></small><br /> 
								<small>원산지 <strong>(${pasta.origin})</strong></small> 
							</div>
							<button type="button" name="add-cart" value="${pasta.id}" class="add-cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>							
						</div>
					</div>
					<div class="product-title">${pasta.pname}</div>
					<div class="product-price">${pasta.price} 원</div>
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
						<img src="${contextPath}/resources/images/products/${beverage.img}" />
						<div class="product-detail">
							<div class="product-detail-title">${beverage.pname}</div>
							<div class="product-detail-desc">${beverage.description}</div>
							<div class="product-detail-info">
								<small>용량 <strong>(${beverage.gram}g)</strong></small><br /> 
								<small>칼로리 <strong>(${beverage.kcal}kcal)</strong></small><br /> 
								<small>원산지 <strong>(${beverage.origin})</strong></small> 
							</div>
							<button type="button" name="add-cart" value="${beverage.id}" class="add-cart-btn">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>							
						</div>
					</div>
					<div class="product-title">${beverage.pname}</div>
					<div class="product-price">${beverage.price} 원</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="flase" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/product/list.js"></script>