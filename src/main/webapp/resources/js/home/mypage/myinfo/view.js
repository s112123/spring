//submit 요청시, button[type=submit]인 버튼 요소들 저장 후 버튼에 따라 처리
const form = document.getElementById('myinfo-form');
const commands = document.querySelectorAll('button[type=submit]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
		
		//유효성 검사
		let isValid = validateMyInfo();
		if(!isValid) return;		
		
		switch(command.value) {
			case "update":
				updateMember(form);
		}	
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;	
	});
});

//회원정보수정
function updateMember(form) {
	showModal(true, "회원정보를 수정하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.submit();
	});	
}

//유효성 검사
function validateMyInfo() {
	const username = document.getElementById('username');
	const phone = document.getElementById('phone');
	const addr1 = document.getElementById('addr1');		
	
	//이름
	if(username.value.trim().length === 0) {
		username.value = null;
		showModal(false, '이름을 입력해주세요');
		return false;
	}

	//연락처
	if(phone.value.trim().length === 0) {
		phone.value = null;
		showModal(false, '연락처를 입력해주세요');
		return false;
	} else {
		regex = /^[0-9]*$/i;
		isRegex = regex.test(phone.value.trim());
		if(!isRegex) {
			showModal(false, '연락처는 숫자만 입력해주세요');
			return false;
		}
	}
		
	//기본주소
	if(addr1.value.trim().length === 0) {
		showModal(false, '기본주소를 입력해주세요');
		return false;
	}		
	
	//비밀번호
	const passwd = document.getElementById('passwd');
	if(passwd.value.trim().length == 0) {
		showModal(false, "비밀번호를 입력해주세요");
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			editPassword();
		});	
		return false;
	} else if(passwd.value.trim().length < 4) {
		showModal(false, "비밀번호는 4자리 이상 입력해주세요");
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			editPassword();
		});	
		return false;
	}
	
	return true;
}


//비밀번호 편집 가능하도록 함
function editPassword() {
	const passwd = document.getElementById('passwd');
	passwd.style.border = '1px solid rgb(210, 40, 40)';
	passwd.focus();
	passwd.readOnly = false;
	
	passwd.addEventListener('blur', function() {
		passwd.style.border = 'none';
		passwd.readOnly = true;
	});
}
