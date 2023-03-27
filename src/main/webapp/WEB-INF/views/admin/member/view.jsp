<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-content">
	<h2>회원정보</h2>
	<div class="infomation-box">
		<form action="/member/update" method="post" id="member-form" autocomplete="off">
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
						<c:catch var="catchException">
							<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
							<input type="text" value="<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly />
						</c:catch>
						<c:if test="${catchException != null }">
							<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
							<input type="text" value="<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly />
						</c:if>
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
					<div class="content">
						<input type="text" name="phone" value="${member.phone}" readonly />
					</div>
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">기본주소</div>
					<div class="content">
						<input type="text" name="addr1" value="${member.addr1}" readonly />
					</div>
				</div>
				<div class="item-right">
					<div class="title">상세주소</div>
					<div class="content">
						<input type="text" name="addr2" value="${member.addr2}" readonly />
					</div>
				</div>
			</div>
			<div class="infomation-item member-item">
				<div class="item-left">
					<div class="title">회원등급</div>
					<div class="content">
						<select name="grade">
							<option value="COMMON" <c:if test="${member.grade=='COMMON'}">selected</c:if>>COMMON</option>
							<option value="ADMIN" <c:if test="${member.grade=='ADMIN'}">selected</c:if>>ADMIN</option>
						</select>					
					</div>
				</div>
				<div class="item-right">
					<div class="title">비밀번호</div>
					<div class="content">
						<input type="password" name="passwd" id="passwd" value="${member.passwd}" maxlength="12" readonly />
						<button type="button" onclick="editPassword();">
							<i class="fa-solid fa-pen-to-square"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="infomation-item" id="agree-chk">
				<div class="item-left">
					<input type="checkbox" name="agree" <c:if test="${member.agree=='Y'}">checked</c:if> />
					<span>마케팅 정보수신 동의함</span>				
				</div>
			</div>
			<div class="infomation-btn">
				<div>
					<button type="button" onclick="location.href='/member/list'">목록</button>
				</div>
				<div>
					<button type="submit" value="update">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/admin/member/view.js"></script>