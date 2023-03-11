<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pagenation flex justify-ctr align-items-ctr">
	<ul class="flex justify-ctr align-items-ctr">
		<%-- 이전 버튼 --%>
		<c:if test="${pagenation.prev}">
			<li>
				<a href="?page=${pagenation.startPN - 1}"><i class="fa-solid fa-angle-left"></i></a>
			</li>
		</c:if>
		<%-- 페이지 번호 --%>
		<c:forEach var="pageNum" begin="${pagenation.startPN}" end="${pagenation.endPN}">
			<li>
				<a href="?page=${pageNum}">${pageNum}</a>
			</li>
		</c:forEach>
		<%-- 다음 버튼 --%>
		<c:if test="${pagenation.next}">
			<li>
				<a href="?page=${pagenation.endPN + 1}"><i class="fa-solid fa-angle-right"></i></a>
			</li>
		</c:if>
	</ul>
</div>