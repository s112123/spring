<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="register-box">
	<h2>회원가입</h2>
	<form action="/member/add" method="post" id="registerForm">
		<input type="hidden" value="${agree}" />
		<div class="register-item">
			<label for="email">이메일</label>
			<input type="text" class="item-info" name="email" />
			<small>이메일을 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="passwd">비밀번호</label>
			<input type="text" class="item-info" name="passwd" />
			<small>비밀번호를 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="repasswd">비밀번호 확인</label>
			<input type="text" class="item-info" />
			<small>비밀번호를 재입력하세요</small>
		</div>
		<div class="register-item">
			<label for="username">이름</label>
			<input type="text" class="item-info" name="username" />
			<small>이름을 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="phone">전화번호</label>
			<input type="text" class="item-info" name="phone" />
			<small>전화번호를 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="addr2">주소</label>
			<input type="text" class="item-info" id="addr1" name="addr1" placeholder="주소검색" readonly />
			<input type="text" id="addr2" name="addr2" placeholder="상세주소" />
			<small>주소를 입력하세요</small>
		</div>
		<div class="register-btn">
			<button type="button" onclick="validateRegister();">회원가입</button>
		</div>
	</form>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/register/register.js"></script>