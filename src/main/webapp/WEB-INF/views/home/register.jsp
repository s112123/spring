<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="register-box">
	<h2>회원가입</h2>
	<form action="#" method="post" id="registerForm">
		<div class="register-item">
			<label for="email">이메일</label>
			<input type="text" class="item-info" name="email" />
			<small>이메일을 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="passwd">비밀번호</label>
			<input type="text" class="item-info" name="passwd" />
			<small>비밀번호를 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="repasswd">비밀번호 확인</label>
			<input type="text" class="item-info" />
			<small>비밀번호를 재입력하세요</small>
		</div>
		<div class="register-item">
			<label for="username">이름</label>
			<input type="text" class="item-info" name="username" />
			<small>이름을 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="phone">전화번호</label>
			<input type="text" class="item-info" name="phone" />
			<small>전화번호를 입력하세요</small>
		</div>
		<div class="register-item">
			<label for="addr2">주소</label>
			<input type="text" class="item-info" id="addr1" name="addr1" placeholder="주소검색" readonly />
			<input type="text" id="addr2" name="addr2" placeholder="상세주소" />
			<small>주소를 입력하세요</small>
		</div>
		<div class="register-btn">
			<button type="button" onclick="validateRegister();">회원가입</button>
		</div>
	</form>
</div>

<%-- 모달: 주소검색 --%>
<div id="modal">
	<div id="modal-content">
		<button id="btnCloseModal" onclick="closeModal();">
			<i class="fa-solid fa-xmark"></i>
		</button>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//유효성 검사
	function validateRegister() {
		const form = document.getElementById('registerForm');
		const info = form.getElementsByClassName('register-item');
		
		for(let i=0; i<info.length; i++) {
			let target = info[i].getElementsByClassName('item-info')[0];
			
			if(target.value.trim().length === 0) {
				target.focus();
				info[i].getElementsByTagName('small')[0].style.display = 'block';	
				return false;
			} else {
				info[i].getElementsByTagName('small')[0].style.display = 'none';
			}
		}
	}

	//주소찾기 API: https://postcode.map.daum.net/guide#usage
	const modal = document.getElementById('modal');
	const modalContent = document.getElementById('modal-content');
	const searchAddr = document.getElementById('addr1');

    function closeModal() {
    	modalContent.style.display = 'none';
    	modal.style.display = 'none';
    	document.body.style.overflow = 'auto';
    }
    
	searchAddr.addEventListener('click', function(){
		var themeObj = {
			bgColor: "#fff"
		}
		
		new daum.Postcode({
			theme: themeObj,
		    oncomplete: function(data) {
				var addr = '';
				
				if(data.userSelectedType === 'R') {
					//도로명 주소
					addr = data.roadAddress;
				} else {
					//지번 주소
					addr = data.jibunAddress;
				}
				searchAddr.value = addr;
				document.getElementById("addr2").focus();	
				closeModal();
		    }
		}).embed(modalContent);
		
		//모달이 열렸을 때, body 부분 스크롤 방지
		document.body.style.overflow = 'hidden';
		//모달 열기
		modal.style.display = "block";
		modalContent.style.display = 'block';
		//모달 크기
		modalContent.style.width = 500 + 'px';
		modalContent.style.height = 560 + 'px';
	});
</script>
