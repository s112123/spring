const modal = document.getElementById('modal');
const modalBox = document.getElementById('modal-box');
const modalHeader = document.getElementById('modal-header');
const modalContent = document.getElementById('modal-content');

//모달닫기
function closeModal(scrollOption = 'auto') {
	//모달 닫기
	modal.style.display = 'none';
	//모달이 닫혔을 때, body 부분 스크롤 복구여부
	document.body.style.overflow = scrollOption;
}

//모달열기
function openModal(width, height, msg, isCancelBtn, scrollOption) {
	//모달이 열렸을 때, body 부분 스크롤 방지
	document.body.style.overflow = 'hidden';
	//모달 열기
	modal.style.display = 'block';
	//모달 크기
	modalBox.style.width = width + 'px';
	modalBox.style.height = height + 'px';	
	//모달 메세지
	if (msg !== null) {
		modalHeader.style.display = 'none';
		modalBox.style.width = '350px';
		modalBox.style.height = '115px';	
		
		let content = ''
		content += '<p id="modal-message">' + msg + '</p>';
		content += '<div id="modal-btn">';
		if (isCancelBtn) {
			content += '  <button id="modal-confirm-btn">확인</button>';
			content += '  <button id="modal-cancel-btn" onclick="closeModal(' + scrollOption + ');">취소</button>';			
		} else {
			content += '  <button id="modal-confirm-btn" onclick="closeModal(' + scrollOption + ');">확인</button>';
		}
		content += '</div>';
		
		modalContent.innerHTML = content;
	}	
}