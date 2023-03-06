<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="cart-box">
	<h3>장바구니</h3>
	<div class="delete-btn">
		<button type="button" onclick="location.href='/writeqna';">선택삭제</button>
	</div>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" /></th>
				<th>상품명</th>
				<th>수량</th>
				<th>금액</th>
				<th>삭제</th>
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
	<div class="flex justify-sb align-items-ctr">
		<div class="delete-btn">
			<button type="button" onclick="location.href='/writeqna';">선택삭제</button>
		</div>
		<div class="order-total">
			<strong>총 결제금액: 30,000원</strong>
		</div>
	</div>
	<div class="order-btn">
		<button type="button" onclick="location.href='/order'">주문하기</button>
		<button type="button" onclick="location.href='/order'">취소</button>
	</div>
</div>