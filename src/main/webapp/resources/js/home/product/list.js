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
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

//장바구니 추가
function insertProductInCart(productId) {
	const datas = {
		productId: productId
	};
	
	$.ajax({
		url: '/cart/insert',
		type: 'POST',
		dataType: 'text',
		data: datas,
		success: function(result) {
			console.log(result);
			if(result === 'notLogin') {
				location.href = '/login';
			}
			if(result === 'success') {
				showModal(true, '장바구니에 추가되었습니다 <br /> 장바구니 페이지로 이동하시겠습니까?');		
			}
			if(result === 'duplicated') {
				showModal(true, '이미 추가된 상품입니다 <br /> 장바구니 페이지로 이동하시겠습니까?');				
			}	
			
			const confirmBtn = document.getElementById('modal-confirm-btn');
			confirmBtn.addEventListener('click', function() {
				location.href = '/cart';
			});	
		}
	});
}