//수량 수정 버튼
const qtyBtns = document.getElementsByClassName('change-qty-btn');
for(let i=0; i<qtyBtns.length; i++) {
	qtyBtns[i].addEventListener('click', function() {
		//수량변경
		let parentEl = this.parentNode;
		let id = parentEl.getElementsByTagName('input')[0].value;
		let qty = parentEl.getElementsByTagName('input')[1].value;
		location.href = '/cart/modify?id=' + id + '&qty=' + qty;
	});
}

//개별삭제
function removeItemInCart(cartId) {
	showModal(true, '장바구니에서 삭제하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/cart/remove?id=' + cartId;
	});	
}

//일괄삭제
function removeItemsInCart() {
	const items = document.getElementsByName('selectItem');
	for(let item of items) {
		if(item.checked) {
			console.log(item.value);
		}
	}
}