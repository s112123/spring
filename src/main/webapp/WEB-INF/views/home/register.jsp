<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="register-box">
	<h2>회원가입</h2>
	<form action="register" method="post">
		<div class="register-info">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" />
		</div>
		<div class="register-info">
			<label for="passwd">비밀번호</label>
			<input type="text" name="passwd" id="passwd" />
		</div>
		<div class="register-info">
			<label for="repasswd">비밀번호 확인</label>
			<input type="text" id="repasswd" />
		</div>
		<div class="register-info">
			<label for="username">이름</label>
			<input type="text" name="username" id="username" />
		</div>
		<div class="register-info">
			<label for="phone">전화번호</label>
			<input type="text" name="phone" id="phone" placeholder="예) 01012341234" />
			<small>냠냠냠냠</small>
		</div>
		<div class="register-info">
			<label for="addr2">주소</label>
			<input type="text" name="addr1" placeholder="주소검색" readonly />
			<input type="text" name="addr2" id="addr2" placeholder="상세주소" />
		</div>
		<div class="register-btn">
			<button type="submit">회원가입</button>
		</div>
	</form>
</div>
