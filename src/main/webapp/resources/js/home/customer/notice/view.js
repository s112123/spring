//글 목록
function listNotice() {
	location.href='/customer/notice/list';
}

//글 삭제
function deleteNotice() {
	showModal(true, "공지사항을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const form = document.getElementById('notice-form');
		submitForm(form, '/customer/notice/delete', 'POST');
	});	
}

//글 수정
function updateNotice() {
	let isValid = validateNoticeInfo();
	if(!isValid) return;
	
	showModal(true, "공지사항을 수정하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const form = document.getElementById('notice-form');
		submitForm(form, '/customer/notice/update', 'POST');
	});		
}

//글 수정 전, 유효성 검사
function validateNoticeInfo() {
	//구분
	const category = document.querySelector('select[name=category]');
	if (category.value === '선택') {
		showModal(false, "구분를 선택하세요");
		return false;
	}
	
	//제목
	const title = document.querySelector('input[name=title]');
	if (title.value.trim().length === 0) {
		showModal(false, "제목을 입력하세요");
		return false;
	}	
	
	//제목
	const content = document.querySelector('textarea[name=content]');
	if (content.value.trim().length === 0) {
		showModal(false, "내용을 입력하세요");
		return false;
	}	

	return true;
} 

