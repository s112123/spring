const modal = document.getElementById('modal-overlay');
const modalBox = document.getElementById('modal-box');
const modalHeader = document.getElementById('modal-header');
const modalContent = document.getElementById('modal-content');

//모달닫기
function closeModal() {
	//모달 닫기
	modal.style.display = 'none';
	//모달이 닫혔을 때, body 부분 스크롤 복구
	document.body.style.overflow = 'auto';	
}

//모달열기
function showModal(isCancelBtn, msg, width, height) {
	/*
		isCancelBtn: true는 확인버튼과 취소버튼이 생성되고, false는 확인버튼만 생성
		msg: null이 아니면 모달크기가 고정설정되고 modal-content에 내용 삽입
		width, height: msg이 null인 경우, 모달 크기 설정
	*/
	
	document.body.style.overflow = 'hidden';
	modal.style.display = 'block';
	
	if(msg !== null) {
		modalHeader.style.display = 'none';	
		modalBox.style.width = '350px';
		modalBox.style.height = (msg.indexOf('<br />') == -1) ? '130px' : '150px';
		
		let content = '';
		content += '<p id="modal-message">' + msg + '</p>';
		content += '<div id="modal-btn">';
		if (isCancelBtn) {
			content += '  <button id="modal-confirm-btn">확인</button>';
			content += '  <button class="modal-close-btn" onclick="closeModal()">닫기</button>';			
		} else {
			content += '  <button id="modal-confirm-btn" onclick="closeModal()">확인</button>';
		}
		content += '</div>';
		
		modalContent.innerHTML = content;
	} else {
		modalHeader.style.display = 'block';
		modalContent.innerHTML = '';	
		modalBox.style.width = width + 'px';
		modalBox.style.height = height + 'px';			
	}	
}