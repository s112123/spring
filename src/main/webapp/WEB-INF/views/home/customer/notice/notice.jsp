<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="container flex justify-ctr">
	<jsp:include page="${contextPath}/WEB-INF/views/home/customer/aside.jsp" flush="false" />
	<div id="notice-content">
		<h3>글 내용</h3>
		<div class="write-box">	
			<form action="/customer/notice/modify" method="post">
				<input type="hidden" name="id" value="${notice.id}" />
				<div class="write-title flex justify-sb">
					<div>
						<select name="category">
							<option value="일반정보" <c:if test="${notice.category == '일반정보'}">selected</c:if>>일반정보</option>
							<option value="상품관련" <c:if test="${notice.category == '상품관련'}">selected</c:if>>상품관련</option>
						</select>
					</div>
					<div>
						<input type="text" name="title" value="${notice.title}" placeholder="제목을 입력해주세요" />
					</div>
				</div>
				<div class="write-content">
					<textarea name="content">${notice.content}</textarea>
				</div>
				<div class="write-btn">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='/customer/notice/remove?id=${notice.id}';">삭제</button>
					<button type="button" onclick="location.href='/customer/notices';">목록</button>
				</div>
			</form>	
		</div>
	</div>
</div>