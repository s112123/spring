//글 목록
function listBoard() {
	location.href='/customer/board/list';
}

//글 등록
function insertBoard() {
	let isValid = validateBoardInfo();
	if(!isValid) return;
	
	showModal(true, "글을 등록하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const form = document.getElementById('board-form');
		submitForm(form, '/customer/board/insert', 'POST');
	});		
}

//유효성 검사
function validateBoardInfo() {
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

