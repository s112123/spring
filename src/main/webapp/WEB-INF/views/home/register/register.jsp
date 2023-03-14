<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container flex-ctr">
	<div class="form-box">
		<h2>회원가입</h2>
		<form action="/member/insert" method="post" id="register-form" autocomplete="off">
			<input type="hidden" name=agree value="${agree}" />
			<div class="form-item">
				<label>이메일</label>
				<input type="text" class="item-info" name="email" id="email" maxlength="40" />
				<small></small>
			</div>
			<div class="form-item">
				<label>비밀번호</label>
				<input type="text" class="item-info" name="passwd" id="passwd" maxlength="12" />
				<small></small>
			</div>
			<div class="form-item">
				<label>비밀번호 확인</label>
				<input type="text" class="item-info" id="repasswd" maxlength="12" />
				<small></small>
			</div>
			<div class="form-item">
				<label>이름</label>
				<input type="text" class="item-info" name="username" id="username" maxlength="20" />
				<small></small>
			</div>
			<div class="form-item">
				<label>전화번호</label>
				<input type="text" class="item-info" name="phone" id="phone" maxlength="11" />
				<small></small>
			</div>
			<div class="form-item">
				<label>주소</label>
				<input type="text" class="item-info" name="addr1" id="addr1" placeholder="주소검색" readonly maxlength="100" />
				<input type="text" name="addr2" id="addr2" placeholder="상세주소" maxlength="100"/>
				<small></small>
			</div>
			<div class="form-btn">
				<button type="submit">회원가입</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/register/register.js"></script>