/* 공지사항 목록 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "write":
				location.href = '/board/write';
			case "insert":
				//삽입
			case "search":
				//검색처리
		}

		//버튼 수만큼 반복하므로 return을 하지 않으면 버튼 수만큼 반복 동작된다
		return;
	});
});
