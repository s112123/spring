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
	const price = parentEl.nextElementSibling.getElementsByTagName('input')[0].value;
	
	$.ajax({
		url: '/cart/update?id=' + id + '&qty=' + qty,
		type: 'GET',
		success: function(result) {
			if(result === 'updated') {
				//금액을 수정
				const orderPrice = parentEl.nextElementSibling.getElementsByTagName('span')[0];
				orderPrice.innerText = (qty * price).toLocaleString('ko-KR') + ' 원';
				getTotal();
			}
		}
	});
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

//총 주문금액
function getTotal() {
	const selectedItems = document.querySelectorAll('input[name="selectedItem"]');
	let total = 0;
	selectedItems.forEach(function(selectedItem) {
		if(selectedItem.checked) {
			let tds = selectedItem.parentNode.parentNode.getElementsByTagName('td');
			let selectedPrice = tds[3].querySelectorAll('span')[0].innerText.replace(' 원', '').replaceAll(',', '');
			total += Number(selectedPrice);		
		}
	});
	
	const target = document.querySelector('#total');
	target.value = total.toLocaleString('ko-KR');	
}

//선택상품에 따라 총 주문금액 변경
const allCheckBox = document.getElementById('all-check');
allCheckBox.addEventListener('click', function() {
	getTotal();
})

const selectedItems = document.querySelectorAll('input[name="selectedItem"]');
selectedItems.forEach(function(selectedItem) {
	selectedItem.addEventListener('click', function() {
		//항목을 체크할 때, 전체체크란 체크여부
		if(!this.checked) {
			allCheckBox.checked = false;
		} else {
			let i = 0;
			for(i=0; i<selectedItems.length; i++) {
				if(selectedItems[i].checked == false) break;
			}
			if(i == selectedItems.length) allCheckBox.checked = true;	
		}
		
		getTotal();
	});
});




