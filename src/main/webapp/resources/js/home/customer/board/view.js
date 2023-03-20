//submit 요청시, button[type=submit]인 버튼 요소들 저장 후 버튼에 따라 처리
const form = document.getElementById('board-form');
const commands = document.querySelectorAll('button[type=submit]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
		
		switch(command.value) {
			case "update":
				//유효성 검사
				let isValid = validateBoardInfo();
				if(!isValid) return;
				updateBoard(form); break;
			case "delete":
				//삭제할 때는 유효성 검사가 필요없다
				deleteBoard(form); break;
		}	
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "list":
				location.href='/board/list';
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

//글 수정
function updateBoard(form) {
	showModal(true, "글을 수정하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.action = '/board/update';
		form.method = 'POST';
		form.submit();
	});		
}

//글 삭제
function deleteBoard(form) {
	showModal(true, "글을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.action = '/board/delete';
		form.method = 'POST';
		form.submit();
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


//textarea 제한
const ta = document.getElementById('reply-write');
ta.addEventListener('keyup', function(e) {
	//글자수 확인
	const replyLength = document.getElementById('reply-length');
	if(ta.value.trim().length <= 100) {
		replyLength.innerText = ta.value.trim().length + ' / 100';
	}
});

