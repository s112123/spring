<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>회원정보</h2>
	<div class="infomation-box">
		<form action="/member/update" method="post" id="member-form">
			<input type="hidden" name="id" value="${member.id}" />
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">Email</div>
					<div class="content">
						<input type="text" name="email" value="${member.email}" readonly />
					</div>
				</div>
				<div class="item-right">
					<div class="title">가입일</div>
					<div class="content">
						<!--  00 에러 -->
						<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
						<input type="text" value="<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly />
					</div>
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">이름</div>
					<div class="content">
						<input type="text" name="username" value="${member.username}" readonly />
					</div>
				</div>
				<div class="item-right">
					<div class="title">연락처</div>
					<div class="content"><input type="text" name="phone" value="${member.phone}" readonly /></div>
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">기본주소</div>
					<div class="content"><input type="text" name="addr1" value="${member.addr1}" readonly /></div>
				</div>
				<div class="item-right">
					<div class="title">상세주소</div>
					<div class="content"><input type="text" name="addr2" value="${member.addr2}" readonly /></div>
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">회원등급</div>
					<div class="content">
						<select id="grade" name="email">
							<option value="common" <c:if test="${member.grade=='common'}">selected</c:if>>common</option>
							<option value="admin" <c:if test="${member.grade=='admin'}">selected</c:if>>admin</option>
						</select>					
					</div>
				</div>
				<div class="item-right">
					<div class="title">비밀번호</div>
					<div class="content"><input type="password" name="passwd" value="${member.passwd}" /></div>
				</div>
			</div>
			<div class="infomation-item" id="agree-chk">
				<div class="item-left">
					<input type="checkbox" name="agree" <c:if test="${member.agree=='Y'}">checked</c:if> />
					<span>개인정보 마케팅 활용 동의함</span>				
				</div>
			</div>
			<div class="infomation-btn">
				<button type="submit">수정</button>
				<button type="button" onclick="location.href='/member/list'">목록</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/memberinfo.js"></script>