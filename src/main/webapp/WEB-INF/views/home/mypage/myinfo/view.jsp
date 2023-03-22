<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>회원정보</h2>
	<div class="myinfo-box">
		<form action="/mypage/myinfo/update" method="post" id="myinfo-form" autocomplete="off">
			<input type="hidden" name="id" value="${member.id}" />
			<div class="myinfo-item">
				<div class="item-left">
					<div class="title">Email</div>
					<div class="content">
						<input type="text" name="email" value="${member.email}" readonly />
					</div>
				</div>
				<div class="item-right">
					<div class="title">가입일</div>
					<div class="content">
						<!-- 00 에러 -->
						<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
						<input type="text" value="<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly />
					</div>
				</div>
			</div>
			<div class="myinfo-item">
				<div class="item-left">
					<div class="title">이름</div>
					<div class="content">
						<input type="text" name="username" id="username" value="${member.username}" />
					</div>
				</div>
				<div class="item-right">
					<div class="title">연락처</div>
					<div class="content">
						<input type="text" name="phone" id="phone" value="${member.phone}" placeholder="ex) 01012344567" />
					</div>
				</div>
			</div>
			<div class="myinfo-item">
				<div class="item-left">
					<div class="title">기본주소</div>
					<div class="content">
						<input type="text" name="addr1" id="addr1" value="${member.addr1}" />
					</div>
				</div>
				<div class="item-right">
					<div class="title">상세주소</div>
					<div class="content">
						<input type="text" name="addr2" value="${member.addr2}" />
					</div>
				</div>
			</div>
			<div class="myinfo-item" id="myinfo-item">
				<div class="item-left">
					<div class="title">회원등급</div>
					<div class="content">
						<input type="text" name="grade" value="${member.grade}" readonly />				
					</div>
				</div>
				<div class="item-right">
					<div class="title">비밀번호</div>
					<div class="content">
						<input type="text" name="passwd" id="passwd" value="${member.passwd}" maxlength="12" readonly />
						<button type="button" onclick="editPassword();">
							<i class="fa-solid fa-pen-to-square"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="myinfo-item" id="agree-chk">
				<div class="item-left">
					<input type="checkbox" name="agree" <c:if test="${member.agree=='Y'}">checked</c:if> />
					<span>개인정보 마케팅 활용 동의함</span>				
				</div>
			</div>
			<div class="myinfo-btn">
				<button type="submit" value="update">수정</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/home/mypage/myinfo/view.js"></script>