const modal = document.getElementById('modal');
const modalBox = document.getElementById('modal-box');
const modalContent = document.getElementById('modal-content');

//모달닫기
function closeModal() {
	//모달 닫기
	modal.style.display = 'none';
	//모달이 닫혔을 때, body 부분 스크롤 복구
	document.body.style.overflow = 'auto';
}

//모달열기
function openModal(width, height, content) {
	//모달이 열렸을 때, body 부분 스크롤 방지
	document.body.style.overflow = 'hidden';
	//모달 열기
	modal.style.display = 'block';
	//모달 크기
	modalBox.style.width = width + 'px';
	modalBox.style.height = height + 'px';		
	//모달 내용 담기
	modalContent.innerHTML = content.innerHTML;
}