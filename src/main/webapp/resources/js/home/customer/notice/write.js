//글 목록
function listNotice() {
	location.href='/notice/list';
}

//글 등록
function insertNotice() {
	let isValid = validateNoticeInfo();
	if(!isValid) return;
	
	showModal(true, "공지사항을 등록하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const form = document.getElementById('notice-form');
		submitForm(form, '/notice/insert', 'POST');
	});		
}

//유효성 검사
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