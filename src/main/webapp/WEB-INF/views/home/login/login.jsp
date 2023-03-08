<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="login-box">
	<h2>로그인</h2>
	<form action="/login" method="post" id="login-form">
		<div class="login-item">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" />
			<small></small>
		</div>
		<div class="login-item">
			<label for="passwd">비밀번호</label>
			<input type="text" name="passwd" id="passwd" />
			<small></small>
		</div>
		<div id="login-chk">
			<input type="checkbox" />
			<span>자동 로그인</span>
		</div>
		<div id="login-btn">
			<button>로그인</button>
		</div>
	</form>
</div>
<script type="text/javascript" src="${contextPath}/resources/js/home/login/login.js"></script>
