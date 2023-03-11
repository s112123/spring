<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="main-content">
	<h2>회원목록</h2>
	<table class="member-list">
		<thead>
			<tr>
				<th>번호</th>
				<th>이메일</th>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>등급</th>
				<th>가입일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${members}">
				<tr>
					<td>${member.id}</td>
					<td>${member.email}</td>
					<td>${member.username}</td>
					<td>${member.phone}</td>
					<td>${member.addr1} ${member.addr2}</td>
					<td>${member.grade}</td>
					<td>
						<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<a href="#" onclick="openInfoModal(800, 520, ${member.id});"><i class="fa-solid fa-pen-to-square"></i></a>
						<a href="#" onclick="removeMember(${member.id});"><i class="fa-solid fa-trash-can"></i></a>
					</td>
				</tr>	
			</c:forEach>	
		</tbody>
	</table>
	<div class="bottom">
		<div class="search">
			<select name="search-option">
				<option>선택</option>
				<option value="email">이메일</option>
				<option value="username">이름</option>
			</select>
			<input type="text" name="search-keyword" placeholder="검색어 입력" />
			<button type="button">검색</button>
		</div>
	</div>
	<%--
	<jsp:include page="${contextPath}/WEB-INF/views/common/pagenation.jsp" flush="false" />
	 --%>
</div>

<!-- 
<div id="info-modal">
	<div id="info-modal-box">
		<div id="info-modal-header">
			<button id="modal-close-btn" onclick="closeInfoModal();">
				<i class="fa-solid fa-xmark"></i>
			</button>
		</div>
		<div id="info-modal-content">
			<div id="member-infomation">
				<h3>회원정보</h3>
				<form action="/member/modify" method="post" id="memberInfoForm">
					<input type="hidden" id="id" />
					<table>
						<tr>
							<td>E-Mail</td>
							<td><input type="text" id="email" readonly /></td>
							<td>가입일</td>
							<td><input type="text" id="regdate" readonly /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" id="username" readonly /></td>
							<td>연락처</td>
							<td><input type="text" id="phone" readonly /></td>
						</tr>					
						<tr>
							<td>주소</td>
							<td colspan="3">
								<input type="text" id="addr1" readonly />
								<input type="text" id="addr2" readonly />
							</td>
						</tr>	
						<tr>
							<td>회원등급</td>
							<td>
								<select id="grade">
									<option value="common">common</option>
									<option value="admin">admin</option>
								</select>
							</td>
							<td>비밀번호</td>
							<td><input type="password" id="passwd" /></td>
						</tr>									
					</table>
					<div id="agree-chk">
						<input type="checkbox" id="agree" />
						<span>개인정보 마케팅 활용 동의함</span>
					</div>
					<div id="member-infomation-btn">
						<button type="button" onclick="modifyMember();">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
 -->








<%--
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>

<!-- JAVASCRIPT -->
<script>	
	//회원정보수정
	function modifyMember() {
		openModal(350, 115, '수정하시겠습니까?', true, 'hidden');
		document.getElementById('modal-confirm-btn').addEventListener('click', function() {
			const form = document.getElementById('memberInfoForm');
			form.submit();
		});
	}
	
	//회원삭제
	function removeMember(id) {
		openModal(350, 115, '삭제하시겠습니까?', true);
		document.getElementById('modal-confirm-btn').addEventListener('click', function() {
			location.href = '/member/remove?id=' + id;
		});
	}	
	
	const infoModal = document.getElementById('info-modal');
	const infoModalBox = document.getElementById('info-modal-box');
	const infoModalHeader = document.getElementById('info-modal-header');
	const infoModalContent = document.getElementById('info-modal-content');
		
	//회원정보 모달 열기 + AJAX
	function openInfoModal(width, height, memId) {
		//모달 열기
		document.body.style.overflow = 'hidden';
		infoModal.style.display = 'block';
		infoModalBox.style.width = width + 'px';
		infoModalBox.style.height = height + 'px';

		//AJAX
		const json = {id: memId};
		$.ajax({
			url: 'member',
			type: 'POST',
			contentType: 'application/json; charset=UTF-8',
			dataType: 'JSON',
			data: JSON.stringify(json),
			success: function(data) {
				//id
				document.getElementById('id').value = data.member.id;
				//email
				document.getElementById('email').value = data.member.email;
				//가입일
				let year = data.member.regdate.year;
				let month = data.member.regdate.monthValue;
				let day = data.member.regdate.dayOfMonth;
				let hour = data.member.regdate.hour;
				let minute = data.member.regdate.minute;
				let second = data.member.regdate.second;
				let regdate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
				document.getElementById('regdate').value = moment(regdate).format('YYYY-MM-DD HH:mm:ss');
				//비밀번호
				document.getElementById('passwd').value = data.member.passwd;
				//이름
				document.getElementById('username').value = data.member.username;
				//연락처
				document.getElementById('phone').value = data.member.phone;
				//기본주소
				document.getElementById('addr1').value = data.member.addr1;
				//상세주소
				document.getElementById('addr2').value = data.member.addr2;
				//등급
				document.getElementById('grade').value = data.member.grade;
				//개인정보 마케팅 활용
				let isAgree = data.member.agree === 'Y' ? true : false;
				document.getElementById('agree').checked = isAgree;
			}
		});
	}
	
	//회원정보 모달 닫기
	function closeInfoModal() {
		//모달 닫기
		infoModal.style.display = 'none';
		//모달이 닫혔을 때, body 부분 스크롤 복구
		document.body.style.overflow = 'auto';		
	}
</script>
 --%>