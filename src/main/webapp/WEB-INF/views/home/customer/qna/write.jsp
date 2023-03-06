<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container flex justify-ctr">
	<jsp:include page="${contextPath}/WEB-INF/views/home/customer/aside.jsp" flush="false" />
	<div class="content">
		<h3>문의 등록</h3>
		<div class="write-box">	
			<form action="/notice/add" method="post">
				<div class="write-title">
					<input type="text" placeholder="제목을 입력해주세요" />
				</div>
				<div class="write-content">
					<textarea></textarea>
				</div>
				<div class="write-btn">
					<button>등록</button>
					<button>취소</button>
				</div>
			</form>	
		</div>
	</div>
</div>