<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="container">
	<h1><a href="/">STEAKHOUSE</a></h1>
	<nav>	
		<ul class="navbar" id="main-nav">
			<li><a href="/product">PRODUCT</a></li>
			<li><a href="/store">STORE</a></li>
			<li><a href="/customer/notice/list">CUSTOMER</a></li>			
		</ul>
	</nav>
	<ul class="navbar">
		<c:choose>
			<c:when test="${empty login}">
				<li><a href="/login"><i class="fa-solid fa-right-to-bracket"></i> Login</a></li>
				<li><a href="/member/agree"><i class="fa-solid fa-user-plus"></i> Join</a></li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${login.grade == 'ADMIN'}">
						<li><a href="/admin"><i class="fa-solid fa-gear"></i> Admin</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/mypage/myinfo/view"><i class="fa-solid fa-user"></i> MyPage</a></li>
						<li><a href="/cart"><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
