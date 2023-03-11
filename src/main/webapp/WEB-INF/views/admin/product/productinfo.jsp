<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="main-content">
	<h2>상품정보</h2>
	<div class="infomation-box">
		<form method="post" id="form">
			<!--  <input type="hidden" name="id" value="${product.id}" /> -->
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">구분</div>
					<div class="content">
						<select name="category">
							<option value="STEAK" <c:if test="${product.category=='STEAK'}">selected</c:if>>STEAK</option>
							<option value="PASTA" <c:if test="${product.category=='PASTA'}">selected</c:if>>PASTA</option>
							<option value="BEVERAGE" <c:if test="${product.category=='BEVERAGE'}">selected</c:if>>BEVERAGE</option>
						</select>
					</div>
				</div>
				<div class="item-right">
					<div class="title">상품명</div>
					<div class="content"><input type="text" name="pname" value="${product.pname}" /></div>
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">원산지</div>
					<div class="content"><input type="text" name="origin" value="${product.origin}" /></div>
				</div>
				<div class="item-right">
					<div class="title">가격</div>
					<div class="content"><input type="number" name="price" value="${product.price}" min="1" /></div>
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">용량<small> (g)</small></div>
					<div class="content"><input type="number" name="gram" value="${product.gram}" min="1" /></div>
				</div>
				<div class="item-right">
					<div class="title">칼로리<small> (kcal)</small></div>
					<div class="content"><input type="number" name="kcal" value="${product.kcal}" min="1" /></div>
				</div>
			</div>
			<div class="infomation-btn">
				<c:choose>
					<c:when test="${id == 0}">
						<button name="submit-btn" value="insert">등록</button>
					</c:when>
					<c:otherwise>
						<button name="submit-btn" value="update">수정</button>
					</c:otherwise>
				</c:choose>
				<button type="button" onclick="location.href='/product/list'">목록</button>
			</div>
		</form>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script>const id = ${id};</script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/productinfo.js"></script>
