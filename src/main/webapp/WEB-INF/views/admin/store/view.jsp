<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main-content">
	<h2>매장정보</h2>
	<div class="infomation-box">
		<form id="store-form" enctype="multipart/form-data" autocomplete="off">
			<div class="infomation-item store-item">
				<input type="hidden" name="id" id="store-id" value="${id}" />
				<div class="item-left"> 
					<div class="title">매장명</div>
					<div class="content">
						<input type="text" name="storename" id="storename" />
					</div>
				</div>
				<div class="item-right">
					<div class="title">매장 이미지</div>
					<div class="content">
						<input type="text" name="filename" id="filename" class="filename" placeholder="JPG 파일 첨부" readonly />
						<label for="attached">파일찾기</label>
						<input type="file" name="attached" id="attached" accept=".jpg" />					
					</div>		
				</div>
			</div>
			<div class="infomation-item">
				<div class="item-left">
					<div class="title">연락처</div>
					<div class="content">
						<input type="text" name="tel" id="tel" placeholder="ex) 01012344567" maxlength="11" />
					</div>
				</div>
				<div class="item-right">
					<div class="title">주소</div>
					<div class="content">
						<input type="text" name="addr1" id="addr1" readonly />
					</div>
				</div>
			</div>
			<div class="infomation-btn">
				<div class="btn-left">
					<button type="button" onclick="listStore()">목록</button>
				</div>
				<div class="btn-right">
					<button type="button" onclick="updateStore()">수정</button>
				</div>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/modal.jsp" flush="false" />
<script type="text/javascript" src="/resources/js/admin/store/view.js"></script>




