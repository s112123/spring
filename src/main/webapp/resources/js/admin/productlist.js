//상품삭제
function deleteProduct(id) {
	showModal(true, "상품을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/product/delete?id=' + id;
	});		
}	