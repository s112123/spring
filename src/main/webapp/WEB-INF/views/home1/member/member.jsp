<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container flex justify-ctr">
	<aside>
		<ul>
			<li>
				<a href="/userinfo">
					<span><i class="fa-solid fa-address-card"></i></span> 
					<span>개인정보</span>
				</a>
			</li>
			<li>
				<a href="/userorders">
					<span><i class="fa-solid fa-truck"></i></span> 
					<span>주문내역</span>
				</a>
			</li>
			<li>
				<a href="/userqnas">
					<span><i class="fa-solid fa-comments"></i></span> 
					<span>문의내역</span>
				</a>
			</li>
		</ul>	
	</aside>
	<div class="content">
		<h3>공지사항</h3>
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
							<a href="#" onclick="openModalForMemberInfo(${member.id});"><i class="fa-solid fa-pen-to-square"></i></a>
							<!-- 삭제버튼 -->
							<a href="#" onclick="openModalForMessage(${member.id}, '삭제하시겠습니까?');"><i class="fa-solid fa-trash-can"></i></a>
						</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>
	</div>
</div>