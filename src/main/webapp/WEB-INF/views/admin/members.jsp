<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="container flex justify-ctr">
	<aside>
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
		</ul>	
	</aside>	
	<div class="content">
		<h3>회원목록</h3>
		<table>
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
							<a href="#" onclick="openModal(900, 700, content);"><i class="fa-solid fa-pen-to-square"></i></a>
							<!-- 삭제버튼 -->
							<a href="#"><i class="fa-solid fa-trash-can"></i></a>
						</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="member.jsp" flush="false" />
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />

<!-- JAVASCRIPT -->
<script>
	let target = null;
	let content = null;
	content = document.getElementById('member-infomation');

	/*메세지 모달 열기
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
	*/

	/*회원정보 모달 열기
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
	*/
	
	/*회원삭제
	function deleteMember() {
		const id = document.getElementById("id").value;
		location.href = "delete?id=" + id;
	}
	*/
</script>