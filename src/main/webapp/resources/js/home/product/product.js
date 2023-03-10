//장바구니 추가 버튼
const cartBtns = document.getElementsByClassName('cart-btn');	
for (let i=0; i<cartBtns.length; i++) {
	cartBtns[i].addEventListener('click', function() {
		addItemInCart();
	});
}

//장바구니 추가
function addItemInCart() {
	showModal(true, '장바구니에 추가되었습니다 <br /> 장바구니 페이지로 이동하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/cart';
	});	
}