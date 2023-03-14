/* 사용자페이지에서 제품리스트 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function(e) {
		e.preventDefault();
		switch(btn.value) {
			case "cart":
				goToCart(); break;
		}
	});
});

//장바구니 페이지로 이동
function goToCart() {
	showModal(true, '장바구니에 추가되었습니다 <br /> 장바구니 페이지로 이동하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/cart';
	});	
}


/*
//장바구니 추가
function insertProductInCart() {
	showModal(true, '장바구니에 추가되었습니다 <br /> 장바구니 페이지로 이동하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		const datas = {
			productId: 1
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
	});		
}
*/

/*
	private int id;						//번호
	private String email;				//회원이메일
	private String pname;				//제품명
	private int price;					//제품가격
	private int qty;					//제품수량
	private LocalDateTime regdate;		//추가시간
*/
/*
//장바구니 추가 버튼
const cartBtns = document.getElementsByClassName('add-cart-btn');	
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
*/