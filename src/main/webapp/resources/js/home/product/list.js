/* 사용자페이지에서 제품리스트 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function(e) {
		e.preventDefault();
		switch(btn.name) {
			case "add-cart":
				const productId = btn.value;
				insertProductInCart(productId); 
				break;
		}
	});
});

//장바구니 추가
function insertProductInCart(productId) {
	const datas = {
		productId: productId
	}
	
	$.ajax({
		url: '/cart/insert',
		type: 'POST',
		dataType: 'text',
		data: datas,
		success: function(result) {
			console.log(result);
		}
	});
	
	showModal(true, '장바구니에 추가되었습니다 <br /> 장바구니 페이지로 이동하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/cart';
	});		
}