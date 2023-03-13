//<form>을 submit 한 경우
const form = document.getElementById('member-form');
form.addEventListener('submit', function(e) {
	e.preventDefault();
	
	//유효성 검사
	let isValid = validateMemberInfo();
	if(!isValid) return;
	
	//button[name=submit]인 버튼 요소들 저장
	const commands = document.getElementsByName('submit');
	commands.forEach(function(command) {
		switch(command.value) {
			case "update" :	
				updateMember();
				showModal(false, "회원정보가 수정되었습니다");
		}
	});
});

//button[name=button]을 클릭한 경우
const btns = document.getElementsByName('button');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		//switch
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
function updateMember() {
	showModal(true, "회원정보를 수정하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		//현재 <form>이 submit 진행 중이므로 모달창을 그냥 닫으면 된다
		closeModal();
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