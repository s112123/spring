/* 사용자페이지에서 장바구니 리스트 페이지 */

//submit 요청시, button[type=submit]인 버튼 요소들 저장 후 버튼에 따라 처리
const form = document.getElementById('cart-form');
const commands = document.querySelectorAll('button[type=submit]');
commands.forEach(function(command) {
	command.addEventListener('click', function(e) {
		e.preventDefault();
		
		//유효성 검사
		let isValid = validateSelectedItem();
		if(!isValid) return;		
		
		switch(command.value) {
			case "delete":
				deleteItemsInCart(form); break;
			case "order":
				orderItems(form); break;
		}	
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

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

//선택삭제
function deleteItemsInCart(form) {
	showModal(true, '선택하신 상품을 삭제하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.action = '/cart/delete';
		form.method = 'POST';
		form.submit(); 
	});	
}

//주문하기
function orderItems(form) {
	showModal(true, '선택하신 상품을 주문하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		form.action = '/order/insert';
		form.method = 'POST';
		form.submit(); 
	});		
}

//유효성 검사
function validateSelectedItem() {
	const chkBoxs = document.querySelectorAll('input[name="selectedItem"]');
	
	let cntCheck = 0;
	for(let i=0; i<chkBoxs.length; i++) {
		if(!chkBoxs[i].checked) continue;
		else cntCheck++;
	}
	
	if(cntCheck == 0) {
		showModal(false, '선택된 상품이 없습니다');
		return false;
	}

	return true;
}