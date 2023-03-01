<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="container flex justify-ctr">
	<nav class="admin-nav">
		<ul>
			<li>
				<span><i class="fa-solid fa-user-gear"></i></span> 
				<span>회원관리</span>
			</li>
			<li>
				<span><i class="fa-solid fa-boxes-stacked"></i></span>
				<span>상품관리</span> 
			</li>
			<li>
				<span><i class="fa-solid fa-truck"></i></span>
				<span>주문관리</span>
			</li>
			<li>
				<span><i class="fa-solid fa-map-location-dot"></i></span> 
				<span>매장관리</span>
			</li>
			<li>
				<span><i class="fa-solid fa-bullhorn"></i></span> 
				<span>공지사항</span>
			</li>
			<li>
				<span><i class="fa-solid fa-comments"></i></span> 
				<span>QnA</span>
			</li>
		</ul>
	</nav>		
	<div class="admin-main">
		<h3>회원목록</h3>
		<table class="admin-memberlist">
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
				<!-- 전체회원목록 -->
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
							<!-- 수정버튼 -->
							<a href="#" onclick="openModalForMemberInfo(${member.id});"><i class="fa-solid fa-pen-to-square"></i></a>
							<!-- 삭제버튼 -->
							<a href="#" onclick="openModalForMessage(${member.id}, '삭제하시겠습니까?');"><i class="fa-solid fa-trash-can"></i></a>
						</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>
	</div>
	<%-- Modal(0): Info --%>
	<div class="modal">
		<div class="modal-content" id="modal-member-info">
			<div class="flex justify-sb align-items-ctr">
				<h3>회원정보</h3>
				<div><a href="#" onclick="closeModal();"><i class="fa-regular fa-circle-xmark"></i></a></div>
			</div>
			<form>
				<input type="text" id="id" />
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
							<input type="text" id="addr" readonly />
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
						<td><input type="text" id="passwd" /></td>
					</tr>									
				</table>
				<div class="modal-info-btn">
					<button type="submit">수정</button>
					<button type="button" onclick="openModalForMessage(null, '삭제하시겠습니까?');">삭제</button>
				</div>
			</form>
		</div>
	</div>
	<%-- Modal(1): Message --%>
	<div class="modal">
		<div class="modal-content" id="modal-message">
			<input type="hidden" id="id" />
			<h4 id="msg"></h4>
			<div class="flex justify-fe">
				<button type="button" onclick="deleteMember();">확인</button>
				<button type="button" onclick="closeModal();">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- JAVASCRIPT -->
<script>
	//모달 닫기
	function closeModal() {
		//본문 스크롤 활성화
		document.body.style.overflow = "unset";
		
		const modals = document.getElementsByClassName('modal');
		for(let i = 0; i < modals.length; i++) {
			modals[i].style.display = 'none';
		}
	}

	//메세지 모달 열기
	function openModalForMessage(id, msg) {
		//본문 스크롤 방지
		document.body.style.overflow = "hidden";
		
		//Modal 열기
		const modal = document.getElementsByClassName('modal')[1];
		modal.style.display = 'block';
		
		//Modal 크기
		const modalContent = document.getElementsByClassName('modal-content')[1];
		modalContent.style.width = '400px';		
		
		document.getElementById('id').value = id;
		document.getElementById('msg').innerText = msg;
	}

	//회원정보 모달 열기
	function openModalForMemberInfo(id) {
		//본문 스크롤 방지
		document.body.style.overflow = "hidden";
		
		//MemberInfo Modal
		const modal = document.getElementsByClassName('modal')[0];
		modal.style.display = 'block';
		
		const modalContent = document.getElementsByClassName('modal-content')[0];
		modalContent.style.width = '650px';
		
		document.getElementById('id').value = id;
		
		//Ajax
		const json = {id: id};
		$.ajax({
			url: 'info',
			type: 'POST',
			contentType: 'application/json; charset=UTF-8',
			dataType: 'JSON',
			data: JSON.stringify(json),
			success: function(data) {
				console.log(data.member.regdate);
				document.getElementById('email').value = data.member.email;
				document.getElementById('passwd').value = data.member.passwd;
				document.getElementById('username').value = data.member.username;
				document.getElementById('phone').value = data.member.phone;
				document.getElementById('addr').value = data.member.addr1 + (data.member.addr2 == null ? '': ' ' + data.member.addr2);
				document.getElementById('grade').value = data.member.grade;
				document.getElementById('regdate').value = data.member.regdate;
			}
		});
	}
	
	//회원삭제
	function deleteMember() {
		const id = document.getElementById("id").value;
		location.href = "delete?id=" + id;
	}
</script>