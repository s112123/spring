//<form>을 submit 한 경우
const form = document.getElementById('member-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	//유효성 검사
	let isValid = validateMemberInfo();
	if(!isValid) return;
	
	//button[type=submit]인 버튼 요소들 저장
	const commands = document.querySelectorAll('button[type=submit]');
	commands.forEach(function(command) {
		switch(command.value) {
			case "update":
				updateMember(form);
		}
	});
});

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	console.log(btn.value);
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "":
		}
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