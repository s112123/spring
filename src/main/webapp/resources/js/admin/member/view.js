//submit 요청시, button[type=submit]인 버튼 요소들 저장 후 버튼에 따라 처리
const form = document.getElementById('member-form');
const commands = document.querySelectorAll('button[type=submit]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
		
		//유효성 검사
		let isValid = validateMemberInfo();
		if(!isValid) return;		
		
		switch(command.value) {
			case "update":
				updateMember(form);
		}	
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;	
	});
});

//유효성 검사
function validateMemberInfo() {
	//수정항목 중 반드시 입력해야 되는 것은 비밀번호이므로 비밀번호만 유효성 검사
	const passwd = document.getElementById('passwd');
	if(passwd.value.trim().length == 0) {
		showModal(false, "비밀번호를 입력해주세요");
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			editPassword();
		});	
		return false;
	} else if(passwd.value.trim().length < 6) {
		showModal(false, "비밀번호는 6자리 이상 입력해주세요");
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			editPassword();
		});	
		return false;
	}
	
	return true;
}

//회원정보수정
function updateMember(form) {
	showModal(true, "회원정보를 수정하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.submit();
	});	
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