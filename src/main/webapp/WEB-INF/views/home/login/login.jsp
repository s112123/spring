<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container flex justify-ctr align-items-ctr">
	<div class="form-box">
		<h2>로그인</h2>
		<form action="/login" method="post" id="login-form">
			<div class="form-item">
				<label for="email">이메일</label>
				<input type="text" name="email" id="email" />
				<small></small>
			</div>
			<div class="form-item">
				<label for="passwd">비밀번호</label>
				<input type="text" name="passwd" id="passwd" />
				<small></small>
			</div>
			<div class="form-chk">
				<input type="checkbox" id="isSave" />
				<span>자동 로그인</span>
			</div>
			<div class="form-btn">
				<button>로그인</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${contextPath}/resources/js/home/login/login.js"></script>
