<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="container header flex justify-sb align-items-ctr">
	<h1><a href="/">STEAKHOUSE</a></h1>
	<div class="navbar navbar-header">	
		<ul class="flex">
			<li><a href="/products">PRODUCT</a></li>
			<li><a href="#">STORE</a></li>
			<li><a href="/customer/notices">CUSTOMER</a></li>			
		</ul>
	</div>
	<div class="navbar">
		<ul class="flex">
			<c:choose>
				<c:when test="${empty login}">
					<li><a href="/login"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
					<li><a href="/agree"><i class="fa-solid fa-user-plus"></i> Join</a></li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${login.grade == 'admin'}">
							<li><a href="/members"><i class="fa-solid fa-gear"></i> Admin</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/member"><i class="fa-solid fa-user"></i> MyPage</a></li>
							<li><a href="/cart"><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
