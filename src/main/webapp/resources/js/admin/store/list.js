//매장등록폼
function writeStoreForm() {
	location.href = '/store/write'; 
}

//매장삭제
function deleteStore(target) {
	const json = target.getAttribute('data-set');
	const dataSet = JSON.parse(json);
	const requestURL = '/api/store/delete/' + dataSet.id;
	
	const result = function () {
		showModal(false, '매장이 삭제되었습니다');
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			//url 연결
			location.href = '/store/list?page=' + dataSet.page; 
		});	
	}
	
	showModal(true, '매장을 삭제하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		ajaxDelete(requestURL, result);
	});		
}