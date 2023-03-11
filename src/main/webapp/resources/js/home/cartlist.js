//수량 수정
function updateItemForQty(target) {
	const parentEl = target.parentNode;
	const id = parentEl.getElementsByTagName('input')[0].value;
	const qty = parentEl.getElementsByTagName('input')[1].value;
	location.href = '/cart/update?id=' + id + '&qty=' + qty;	
}

//개별삭제
function deleteItemInCart(cartId) {
	showModal(true, '장바구니에서 삭제하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/cart/delete?id=' + cartId;
	});	
}

//일괄삭제 및 주문하기
const submitBtns = document.getElementsByName('cmd');
for(let i=0; i<submitBtns.length; i++) {
	submitBtns[i].addEventListener('click', function(e) {
		e.preventDefault();
		const form = document.getElementById('cart-form');
		const cmd = this.value;
		
		showModal(true, '선택하신 상품을 삭제하시겠습니까?');
		const confirmBtn = document.getElementById('modal-confirm-btn');
		confirmBtn.addEventListener('click', function() {
			submit(form, cmd);
		});	
	});
}
function submit(form, cmd) {
	//일괄삭제
	if(cmd === 'delete')
		form.action = '/cart/deleteItems';
	//주문하기
	if(cmd === 'order') 
		//form.action = '/cart/deleteItems'; 	
	
	form.method = 'POST';
	form.submit(); 	
}