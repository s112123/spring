<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="container">
	<h1><a href="/">STEAKHOUSE</a></h1>
	<nav>	
		<ul class="navbar" id="main-nav">
			<li>
				<div><a href="/product">PRODUCT</a></div>
				<span></span>	
			</li>
			<li>
				<div><a href="#">STORE</a></div>
				<span></span>	
			</li>
			<li>
				<div><a href="/notice/list">CUSTOMER</a></div>
				<span></span>
			</li>			
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
						<li><a href="/mypage"><i class="fa-solid fa-user"></i> MyPage</a></li>
						<li><a href="/cart"><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<script>
	const lines = document.querySelectorAll('#main-nav li span');
	lines.forEach(function(line) {
		line.style.display = 'none';
		line.addEventListener('click', function(e) {
			e.preventDefault();
			this.style.display = 'block';
			lines.style.left = this.offsetLeft + 'px';
			lines.style.width = this.offsetWidth + 'px';
		});	
	});
</script>


