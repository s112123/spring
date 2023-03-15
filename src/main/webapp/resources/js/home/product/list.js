/* 사용자페이지에서 제품리스트 페이지 */
console.log(sessionStorage.length);
//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function(e) {
		e.preventDefault();
		switch(btn.name) {
			case "add-cart":
				/* 세션확인이 필요
				sessionStorage.setItem("abc", "def");
				console.log(sessionStorage.length);
				*/
				const productId = btn.value;
				insertProductInCart(productId); 
				break;
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
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