/* 공지사항 목록 페이지 */

//button[type=button]을 클릭한 경우
const btns = document.querySelectorAll('button[type=button]');
btns.forEach(function(btn) {
	console.log(btn.value);
	btn.addEventListener('click', function() {
		switch(btn.value) {
			case "write":
				location.href = '/notice/write';
			case "insert":
				//삽입
			case "search":
				//검색처리
		}
	});
});

