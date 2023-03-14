/* 관리자페이지에서 제품리스트 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	console.log(btn.value);
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "insert":
				insertProduct(); break;
			case "search":
				//검색처리
		}
	});
});

//상품등록
function insertProduct() {
	location.href = '/product/view';
}

//상품삭제
function deleteProduct(id) {
	showModal(true, "상품을 삭제하시겠습니까?");
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/product/delete?id=' + id;
	});		
}	