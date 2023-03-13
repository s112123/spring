//회원삭제
function deleteMember(id) {
	showModal(true, "회원을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/member/delete?id=' + id;
	});		
}	