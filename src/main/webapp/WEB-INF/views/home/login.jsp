<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="login-box">
	<h2>로그인</h2>
	<form action="login" method="post">
		<div class="login-info">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" />
		</div>
		<div class="login-info">
			<label for="passwd">비밀번호</label>
			<input type="text" name="passwd" id="passwd" />
		</div>
		<div class="login-chk">
			<input type="checkbox" />
			<span>자동 로그인</span>
		</div>
		<div class="login-btn">
			<button type="submit">로그인</button>
		</div>
	</form>
</div>