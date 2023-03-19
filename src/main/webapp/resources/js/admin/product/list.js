/* 관리자페이지에서 제품리스트 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "insert":
				insertProduct(); break;
			case "search":
				//검색처리
		}
		
		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});

//상품등록
function insertProduct() {
	location.href = '/product/view';
}