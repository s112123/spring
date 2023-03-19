/* 주문내역 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		console.log(btn.value);
		switch(btn.value) {
			case "home":
				location.href = '/';
				break;
			case "delete":
				const id = document.getElementById('order-id').value;
				deleteOrder(id);
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

//주문취소
function deleteOrder(id) {
	showModal(true, '주문을 취소하시겠습니까?');
	const confirmBtn = document.getElementById('modal-confirm-btn');
	confirmBtn.addEventListener('click', function() {
		location.href = '/order/delete?id=' + id;
	});	
}

