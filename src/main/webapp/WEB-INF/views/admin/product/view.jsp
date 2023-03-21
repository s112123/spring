<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="main-content">
	<h2>상품정보</h2>
	<div class="infomation-box">
		<form method="post" id="product-form" enctype="multipart/form-data" autocomplete="off">
			<div class="infomation-item prod-item">
				<div class="item-left">
					<div class="title">구분</div>
					<div class="content">
						<select name="category">
							<option>선택</option>
							<option value="STEAK" <c:if test="${product.category=='STEAK'}">selected</c:if>>STEAK</option>
							<option value="PASTA" <c:if test="${product.category=='PASTA'}">selected</c:if>>PASTA</option>
							<option value="BEVERAGE" <c:if test="${product.category=='BEVERAGE'}">selected</c:if>>BEVERAGE</option>
						</select>
					</div>
				</div>
				<div class="item-right">
					<div class="title">상품명</div>
					<div class="content"><input type="text" name="pname" value="${product.pname}" maxlength="30" /></div>
				</div>
			</div>
			<div class="infomation-item prod-item">
				<div class="item-left">
					<div class="title">상세설명</div>
					<div class="content"><input type="text" name="description" value="${product.description}" maxlength="85" /></div>
				</div>
				<div class="item-right">
					<div class="title">상품 이미지</div>
					<div class="content">
						<input type="text" name="filename" class="filename" value="${product.img}" placeholder="JPG 파일 첨부" readonly />
						<label for="attached">파일찾기</label>
						<input type="file" name="attached" id="attached" accept=".jpg" />					
					</div>		
				</div>
			</div>	
			<div class="infomation-item prod-item">
				<div class="item-left">
					<div class="title">원산지</div>
					<div class="content">
						<select name="origin">
							<option>선택</option>
							<option value="KR" <c:if test="${product.origin=='KR'}">selected</c:if>>국내산</option>
							<option value="US" <c:if test="${product.origin=='US'}">selected</c:if>>미국산</option>
							<option value="AU" <c:if test="${product.origin=='AU'}">selected</c:if>>호주산</option>
						</select>
					</div>
				</div>
				<div class="item-right">
					<div class="title">금액</div>
					<div class="content"><input type="number" name="price" value="${product.price}" min="1" /></div>
				</div>
			</div>
			<div class="infomation-item prod-item">
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
				<div>
					<button type="button" onclick="location.href='/product/list'">목록</button>
				</div>
				<div>
					<c:choose>
						<c:when test="${id == 0}">
							<button type="submit" value="insert">등록</button>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="id" id="id" value="${product.id}" />
							<button type="submit" value="update">수정</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>	
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/common.js"></script>
<script>const id = ${id};</script>
<script type="text/javascript" src="${contextPath}/resources/js/admin/product/view.js"></script>
