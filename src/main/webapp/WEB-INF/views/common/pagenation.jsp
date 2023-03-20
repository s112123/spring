<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pagenation">
	<ul>
		<%-- 이전 버튼 --%>
		<c:if test="${pagenation.prev}">
			<li>
				<a href="?page=${pagenation.startPN - 1}" data-num="${pagenation.startPN - 1}">
					<i class="fa-solid fa-angle-left" data-num="${pagenation.startPN - 1}"></i>
				</a>
			</li>
		</c:if>
		<%-- 페이지 번호 --%>
		<c:forEach var="pageNum" begin="${pagenation.startPN}" end="${pagenation.endPN}">
			<li>
				<a href="?page=${pageNum}" data-num="${pageNum}" class="${pagenation.page == pageNum ? 'active' : ''}">${pageNum}</a>
			</li>
		</c:forEach>
		<%-- 다음 버튼 --%>
		<c:if test="${pagenation.next}">
			<li>	
				<a href="?page=${pagenation.endPN + 1}" data-num="${pagenation.endPN + 1}">
					<i class="fa-solid fa-angle-right" data-num="${pagenation.endPN + 1}"></i>
				</a>
			</li>
		</c:if>
	</ul>
</div>