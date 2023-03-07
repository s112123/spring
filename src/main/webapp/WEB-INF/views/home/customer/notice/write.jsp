<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container flex justify-ctr">
	<jsp:include page="${contextPath}/WEB-INF/views/home/customer/aside.jsp" flush="false" />
	<div id="notice-write">
		<h3>글 등록</h3>
		<div class="write-box">	
			<form action="/customer/notice/add" method="post" id="noticeWriteForm">
				<div class="write-title flex justify-sb">
					<div>
						<select name="category">
							<option value="일반정보">일반정보</option>
							<option value="상품관련">상품관련</option>
						</select>
					</div>
					<div>
						<input type="text" id="title" name="title" placeholder="제목을 입력하세요" />
					</div>
				</div>
				<div class="write-content">
					<textarea name="content"></textarea>
				</div>
				<div class="write-btn">
					<button type="button" onclick="validateNoticeWrite();">등록</button>
					<button type="button" onclick="location.href='/customer/notices';">취소</button>
				</div>
			</form>	
		</div>
	</div>
</div>
<jsp:include page="${contextPath}/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="${contextPath}/resources/js/common/modal.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/home/customer/notice/write.js"></script>