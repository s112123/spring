<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main-content">
	<h2>회원정보</h2>
	<div class="infomation-box">
		<div class="infomation-item">
			<div class="item-left">
				<div class="title">Email</div>
				<div class="content"><input type="text" id="email" readonly /></div>
			</div>
			<div class="item-right">
				<div class="title">가입일</div>
				<div class="content"><input type="text" id="regdate" readonly /></div>
			</div>
		</div>
		<div class="infomation-item">
			<div class="item-left">
				<div class="title">이름</div>
				<div class="content"><input type="text" id="username" readonly /></div>
			</div>
			<div class="item-right">
				<div class="title">연락처</div>
				<div class="content"><input type="text" id="phone" readonly /></div>
			</div>
		</div>
		<div class="infomation-item">
			<div class="item-left">
				<div class="title">기본주소</div>
				<div class="content"><input type="text" id="addr1" readonly /></div>
			</div>
			<div class="item-right">
				<div class="title">상세주소</div>
				<div class="content"><input type="text" id="addr2" readonly /></div>
			</div>
		</div>
		<div class="infomation-item">
			<div class="item-left">
				<div class="title">회원등급</div>
				<div class="content">
					<select id="grade">
						<option value="common">common</option>
						<option value="admin">admin</option>
					</select>					
				</div>
			</div>
			<div class="item-right">
				<div class="title">비밀번호</div>
				<div class="content"><input type="password" id="passwd" /></div>
			</div>
		</div>
		<div class="infomation-item" id="agree-chk">
			<div class="item-left">
				<input type="checkbox" id="is-agree" />
				<span>개인정보 마케팅 활용 동의함</span>				
			</div>
		</div>
		<div class="infomation-btn">
			<button type="button" onclick="modifyMember();">수정</button>
			<button type="button" onclick="modifyMember();">닫기</button>
		</div>
	</div>
</div>