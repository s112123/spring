//유효성 검사
function validateNoticeWrite() {
	const form = document.getElementById('noticeWriteForm');
	const title = document.getElementById('title');
	
	if(title.value.trim().length === 0) {
		title.value = null;
		title.focus();
		return false;
	}

	form.submit();
}