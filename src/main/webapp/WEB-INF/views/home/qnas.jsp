<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container flex justify-ctr">
	<aside>
		<ul>
			<li>
				<a href="/notices">
					<span><i class="fa-solid fa-bullhorn"></i></span> 
					<span>공지사항</span>
				</a>
			</li>
			<li>
				<a href="/qnas">
					<span><i class="fa-solid fa-comments"></i></span> 
					<span>QnA</span>
				</a>
			</li>
		</ul>	
	</aside>
	<div class="content">
		<h3>QnA</h3>
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
		<div class="content-bottom flex justify-sb align-items-ctr">
			<div class="write">
				<button type="button" onclick="location.href='/writeqna';">글쓰기</button>
			</div>
			<div class="search">
				<select>
					<option>선택</option>
					<option>작성자</option>
					<option>제목</option>
				</select>
				<input type="text" name="searchKeyword" placeholder="검색어 입력" />
				<button type="button">검색</button>
			</div>
		</div>
		<div class="paging flex justify-ctr align-items-ctr">
			<ul class="flex justify-ctr align-items-ctr">
				<li><i class="fa-solid fa-angle-left"></i></li>
				<li>1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li><i class="fa-solid fa-angle-right"></i></li>
			</ul>
		</div>
	</div>
</div>