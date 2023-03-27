<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="container flex-ctr">
	<div class="form-box">
		<h2>로그인</h2>
		<form action="/login" method="post" id="login-form" autocomplete="off">
			<div class="form-item">
				<label for="email">이메일</label>
				<input type="text" name="email" id="email" value="${remember}" />
				<small></small>
			</div>
			<div class="form-item">
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" />
				<small></small>
			</div>
			<div class="form-chk">
				<input type="checkbox" id="isSaved" <c:if test="${!empty remember}">checked</c:if> />
				<span>아이디 저장</span>
			</div>
			<div class="form-btn">
				<button>로그인</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="/resources/js/home/login/login.js"></script>
