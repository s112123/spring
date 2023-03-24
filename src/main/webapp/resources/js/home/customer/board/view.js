/* ----- BOARD ----- */
//글 목록
function listBoard() {
	location.href='/customer/board/list';
}

//글 삭제
function deleteBoard() {
	showModal(true, "글을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const form = document.getElementById('board-form');
		submitForm(form, '/customer/board/delete', 'POST');
	});	
}

//글 수정
function updateBoard() {
	let isValid = validateBoardInfo();
	if(!isValid) return;
	
	showModal(true, "글을 수정하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const form = document.getElementById('board-form');
		submitForm(form, '/customer/board/update', 'POST');
	});		
}

//글 수정 전, 유효성 검사
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


/* ----- REPLY ----- */
//댓글 등록
function insertReply(target) {
	const json = target.getAttribute("data-set");
	const dataSet = JSON.parse(json);
	const requestURL = '/api/reply/insert/';
	
	/* 전송 데이터 */
	const writer = document.querySelector('input[name=reply-writer]').value;
	const content = document.querySelector('textarea[name=reply-content]').value;
	
	if(content.trim().length === 0) {
		showModal(false, '댓글 내용을 입력하세요');
		return;
	}
	
	const datas = {
		bid: dataSet.bid,
		writer: writer,
		content: content
	};
	
	const result = function () {
		showModal(false, '댓글이 등록되었습니다');
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			//원래 요소만 추가되어 화면이 새로 로딩되지 않도록 처리해야 한다
			location.href = "/customer/board/view?id=" + dataSet.bid + "&page=" + dataSet.page;
		});	
	}	
	
	ajaxInsert(requestURL, datas, result);			
}

//댓글 삭제
function deleteReply(target) {
	const json = target.getAttribute("data-set");
	const dataSet = JSON.parse(json);
	const requestURL = '/api/reply/delete/' + dataSet.id;
	
	const result = function () {
		showModal(false, '댓글이 삭제되었습니다');
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {	

			//삭제된 댓글 박스만 삭제
			const items = document.getElementsByClassName('reply-item');
			
			if(items.length > 1) {
				target.parentNode.parentNode.parentNode.remove();
			} else {
				while(items[0].hasChildNodes())
	     			items[0].removeChild(items[0].firstChild); 
	     		
	     		//마지막 댓글 삭제 후, 등록된 댓글 없음으로 처리	
	     		const childNode = document.createElement('div');
	     		childNode.className = 'reply-item-content';
	     		childNode.innerHTML = '등록된 댓글이 없습니다';	
	     		items[0].appendChild(childNode);
			}
			
			//댓글 수 변경
			const total = document.getElementById('reply-total');
			total.innerText = "(" + (Number(total.innerText.replace('(', '').replace(')', '')) - 1) + ")";
		});			
	}	
	
	showModal(true, '댓글을 삭제하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		ajaxDelete(requestURL, result);
	});		
}

//textarea 제한
const ta = document.getElementById('reply-content');
ta.addEventListener('keyup', function(e) {
	//글자수 확인
	const replyLength = document.getElementById('reply-length');
	if(ta.value.trim().length <= 100) {
		replyLength.innerText = ta.value.trim().length + ' / 100';
	}
});
