
/*
//유효성 검사
function validateNoticeWrite() {
	const title = document.getElementById('title');
	
	if(title.value.trim().length === 0) {
		openModal(350, 115, '제목을 입력하세요');
		
		document.getElementById('modal-confirm-btn').addEventListener('click', function() {
			title.value = null;
			title.focus();		
		});		

		return false;
	} else {
		openModal(350, 115, '등록하시겠습니까?', true);
		document.getElementById('modal-confirm-btn').addEventListener('click', function() {
			const form = document.getElementById('noticeWriteForm');
			form.submit();	
		});	
	}
}
*/